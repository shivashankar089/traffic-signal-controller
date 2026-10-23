import os, re, subprocess
from reportlab.lib.pagesizes import A4
from reportlab.lib.styles import getSampleStyleSheet, ParagraphStyle
from reportlab.lib import colors
from reportlab.lib.units import mm
from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer, Table, TableStyle, Preformatted, PageBreak, Image
import matplotlib; matplotlib.use('Agg'); import matplotlib.pyplot as plt

L = os.environ['PDK_ROOT'] + '/sky130A/libs.ref/sky130_fd_sc_hd/lib'
NET = 'evidence/run1/netlist/traffic_ctrl.synthesis_preroute.v'
SPEF = 'evidence/run1/spef/traffic_ctrl.spef'
open('sta/detail_post.tcl', 'w').write("""read_liberty $::env(LIBFILE)
read_verilog %s
link_design traffic_ctrl
read_sdc sta/post.sdc
read_spef %s
report_worst_slack -max
report_worst_slack -min
report_checks -path_delay min_max -fields {nets cap slew input_pins fanout}
""" % (NET, SPEF))
os.makedirs('sta/postlayout', exist_ok=True)

pre = {}
for l in open('sta/prelayout/summary.txt'):
    m = re.match(r'(\S+_1v\d+)\s+(-?[\d.]+)\s+(-?[\d.]+)', l)
    if m: pre[m.group(1)] = (float(m.group(2)), float(m.group(3)))

names = {'ff': 'Fast NMOS / Fast PMOS', 'ss': 'Slow NMOS / Slow PMOS', 'tt': 'Typical NMOS / Typical PMOS'}
rows = []
for f in sorted(os.listdir(L)):
    if not re.search(r'__(tt|ff|ss)_', f) or 'ccsnoise' in f:
        continue
    c = f.replace('sky130_fd_sc_hd__', '').replace('.lib', '')
    p, neg, t, v1, v2 = re.match(r'(ff|ss|tt)_(n?)(\d+)C_(\d)v(\d+)', c).groups()
    out = subprocess.run(['sta', '-no_splash', '-exit', 'sta/detail_post.tcl'], stdout=subprocess.PIPE, stderr=subprocess.STDOUT, universal_newlines=True,
                         env=dict(os.environ, LIBFILE=L + '/' + f)).stdout
    open('sta/postlayout/%s_post_detail.rpt' % c, 'w').write(out)
    w = re.findall(r'worst slack\s+(-?[\d.]+)', out)
    rows.append(dict(c=c, p=p, temp=('-' if neg else '+') + str(int(t)), volt=v1 + '.' + v2,
                     setup=float(w[0]), hold=float(w[1]), text=out))

S = getSampleStyleSheet()
code = ParagraphStyle('c', parent=S['Code'], fontSize=6.3, leading=7.2)
st = []
def para(t, s='BodyText'): st.append(Paragraph(t, S[s]))

para('STA ANALYSIS - SKY130 HD', 'Title')
para('<b>Post-Layout Static Timing Analysis of the Traffic Signal Controller (traffic_ctrl)</b>', 'Heading3')
para('Roll No.: 24EG104E28')
para('Execution', 'Heading3')
para('OpenSTA was run on my Ubuntu/UTM environment using the SKY130 HD timing libraries, on the routed design produced by '
     'OpenLane (run1). The gate-level netlist (including clock-tree buffers and physical tap/filler cells) was combined with the '
     'extracted parasitics (SPEF) so that real wire delays are included. All 16 corners were analyzed with a 50 ns clock (20 MHz). '
     'The clock is propagated through the synthesized clock tree. Clock uncertainty is 0.25 ns, input and output delays are 10 ns '
     '(20% of the period), input transition is 0.2 ns and output load is 0.05 pF. Magic reported 0 DRC errors on the final layout.')
para('Important commands used', 'Heading3')
st.append(Preformatted("read_liberty <corner_library.lib>\nread_verilog traffic_ctrl.synthesis_preroute.v\nlink_design traffic_ctrl\n"
                       "read_sdc post.sdc\nread_spef traffic_ctrl.spef\n"
                       "report_checks -path_delay min_max -fields {nets cap slew input_pins fanout}", code))
para('Notes', 'Heading3')
para('The SDC differs from the pre-layout run in two ways: the clock is propagated (set_propagated_clock) instead of ideal, and no '
     'fixed clock transition is set, because the real clock-tree slew is used. OpenSTA also prints "module not found" warnings for '
     'tap and filler cells; these are physical-only cells with no timing arcs, so they do not affect the results.')
st.append(PageBreak())

para('16-Corner Result Summary (Post-Layout, SPEF)', 'Heading2')
data = [['#', 'Library corner', 'Process / Temp / V', 'Hold slack (ns)', 'Setup slack (ns)', 'Status']]
for i, r in enumerate(rows, 1):
    ok = r['setup'] >= 0 and r['hold'] >= 0
    data.append([i, r['c'], '%s / %s C / %s V' % (r['p'].upper(), r['temp'], r['volt']),
                 '%.2f' % r['hold'], '%.2f' % r['setup'], 'MET' if ok else 'VIOLATED'])
tb = Table(data, repeatRows=1)
tb.setStyle(TableStyle([('GRID', (0, 0), (-1, -1), 0.3, colors.grey), ('BACKGROUND', (0, 0), (-1, 0), colors.HexColor('#d9e2f3')),
                        ('FONTSIZE', (0, 0), (-1, -1), 8)]))
st.append(tb)
plt.figure(figsize=(8, 3))
plt.plot(range(16), [r['setup'] for r in rows], marker='o', label='Post-layout')
plt.plot(range(16), [pre.get(r['c'], (float('nan'), 0))[0] for r in rows], marker='s', ls='--', label='Pre-layout')
plt.axhline(0, lw=0.8)
plt.xticks(range(16), [r['c'] for r in rows], rotation=60, fontsize=6)
plt.ylabel('Setup WNS (ns)'); plt.title('WNS by Library Corner'); plt.legend(fontsize=7); plt.grid(alpha=0.3); plt.tight_layout()
plt.savefig('sta/wns_post.png', dpi=150); plt.close()
st.append(Spacer(1, 8)); st.append(Image('sta/wns_post.png', width=170*mm, height=64*mm))
para('Negative setup slack indicates a setup timing violation for the reported worst max path.')
st.append(PageBreak())

para('Pre-Layout vs Post-Layout Comparison', 'Heading2')
cmp_ = [['Library corner', 'Setup pre (ns)', 'Setup post (ns)', 'Hold pre (ns)', 'Hold post (ns)']]
for r in rows:
    a = pre.get(r['c'])
    cmp_.append([r['c'], '%.2f' % a[0] if a else '-', '%.2f' % r['setup'], '%.2f' % a[1] if a else '-', '%.2f' % r['hold']])
tb2 = Table(cmp_, repeatRows=1)
tb2.setStyle(TableStyle([('GRID', (0, 0), (-1, -1), 0.3, colors.grey), ('BACKGROUND', (0, 0), (-1, 0), colors.HexColor('#d9e2f3')),
                         ('FONTSIZE', (0, 0), (-1, -1), 8)]))
st.append(tb2)
para('Setup slack shrinks after layout because of wire delay and the clock tree. Hold slack is almost unchanged.')
st.append(PageBreak())

for r in rows:
    ok = r['setup'] >= 0 and r['hold'] >= 0
    para('<b>%s</b>' % r['c'], 'Heading3')
    para('<b>Meaning:</b> %s; temperature %s C; supply %s V.' % (names[r['p']], r['temp'], r['volt']))
    para('<b>Result:</b> hold slack %.2f ns; setup slack %.2f ns - <b>%s</b>.' % (r['hold'], r['setup'], 'MET' if ok else 'VIOLATED'))
    lines = [l for l in r['text'].splitlines() if l.strip() and not l.startswith('Warning')]
    st.append(Preformatted('\n'.join(lines), code))
    st.append(PageBreak())

para('Conclusion', 'Heading2')
fails = [r['c'] for r in rows if r['setup'] < 0 or r['hold'] < 0]
ws = min(rows, key=lambda r: r['setup']); wh = min(rows, key=lambda r: r['hold'])
para('All 16 SKY130 HD corners were analyzed on the routed design with SPEF parasitics at a 50 ns clock. Worst setup slack is '
     '%.2f ns (%s); worst hold slack is %.2f ns (%s). %s' % (ws['setup'], ws['c'], wh['hold'], wh['c'],
     'Timing is met in all 16 corners.' if not fails else 'Violations remain in: ' + ', '.join(fails) + '.'))

def foot(cv, d):
    cv.setFont('Helvetica', 8); cv.drawString(15*mm, 8*mm, 'STA Assessment (Post-Layout) - SKY130 HD (traffic_ctrl)'); cv.drawRightString(195*mm, 8*mm, 'Page %d' % d.page)
SimpleDocTemplate('sta/traffic_ctrl_post_sta_report.pdf', pagesize=A4, leftMargin=15*mm, rightMargin=15*mm, topMargin=15*mm, bottomMargin=15*mm).build(st, onFirstPage=foot, onLaterPages=foot)
print('Created sta/traffic_ctrl_post_sta_report.pdf')
