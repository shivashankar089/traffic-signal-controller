import sys
src, dst = sys.argv[1], sys.argv[2]
out, skip, depth = [], False, 0
for line in open(src):
    if not skip and 'cell (' in line and 'sky130_fd_sc_hd__lpflow_' in line:
        skip, depth = True, 0
    if skip:
        depth += line.count('{') - line.count('}')
        if depth <= 0 and '}' in line:
            skip = False
        continue
    out.append(line)
open(dst, 'w').writelines(out)
