module traffic_ctrl (a_green,
    a_red,
    a_yellow,
    b_green,
    b_red,
    b_yellow,
    clk,
    emg_a,
    emg_b,
    ped_req,
    ped_walk,
    reset,
    tick,
    VPWR,
    VGND,
    timing_sel);
 output a_green;
 output a_red;
 output a_yellow;
 output b_green;
 output b_red;
 output b_yellow;
 input clk;
 input emg_a;
 input emg_b;
 input ped_req;
 output ped_walk;
 input reset;
 input tick;
 input VPWR;
 input VGND;
 input [1:0] timing_sel;

 sky130_fd_sc_hd__or2_1 _165_ (.A(\cnt[1] ),
    .B(\cnt[0] ),
    .X(_066_));
 sky130_fd_sc_hd__or2_1 _166_ (.A(\cnt[2] ),
    .B(_066_),
    .X(_067_));
 sky130_fd_sc_hd__or2_2 _167_ (.A(\cnt[3] ),
    .B(_067_),
    .X(_068_));
 sky130_fd_sc_hd__inv_2 _168_ (.A(net5),
    .Y(_069_));
 sky130_fd_sc_hd__or2_1 _169_ (.A(\cnt[7] ),
    .B(\cnt[6] ),
    .X(_070_));
 sky130_fd_sc_hd__or4_4 _170_ (.A(\cnt[5] ),
    .B(\cnt[4] ),
    .C(_070_),
    .D(_068_),
    .X(_071_));
 sky130_fd_sc_hd__inv_2 _171_ (.A(_071_),
    .Y(_072_));
 sky130_fd_sc_hd__buf_4 _172_ (.A(_072_),
    .X(_028_));
 sky130_fd_sc_hd__or4_4 _173_ (.A(\cnt[4] ),
    .B(_068_),
    .C(_069_),
    .D(_028_),
    .X(_073_));
 sky130_fd_sc_hd__or2_2 _174_ (.A(\cnt[5] ),
    .B(_073_),
    .X(_074_));
 sky130_fd_sc_hd__inv_2 _175_ (.A(net4),
    .Y(_075_));
 sky130_fd_sc_hd__clkbuf_2 _176_ (.A(\state[3] ),
    .X(_076_));
 sky130_fd_sc_hd__clkbuf_2 _177_ (.A(_076_),
    .X(_077_));
 sky130_fd_sc_hd__inv_2 _178_ (.A(\state[2] ),
    .Y(_078_));
 sky130_fd_sc_hd__buf_1 _179_ (.A(_078_),
    .X(_010_));
 sky130_fd_sc_hd__inv_2 _180_ (.A(\state[1] ),
    .Y(_027_));
 sky130_fd_sc_hd__or3_4 _181_ (.A(_078_),
    .B(\state[3] ),
    .C(_027_),
    .X(_079_));
 sky130_fd_sc_hd__inv_2 _182_ (.A(emg_a_s),
    .Y(_080_));
 sky130_fd_sc_hd__or2_1 _183_ (.A(\min_cnt[7] ),
    .B(\min_cnt[4] ),
    .X(_081_));
 sky130_fd_sc_hd__or2_2 _184_ (.A(\min_cnt[1] ),
    .B(\min_cnt[0] ),
    .X(_082_));
 sky130_fd_sc_hd__or3_4 _185_ (.A(\min_cnt[3] ),
    .B(\min_cnt[2] ),
    .C(_082_),
    .X(_083_));
 sky130_fd_sc_hd__or4_4 _186_ (.A(\min_cnt[6] ),
    .B(\min_cnt[5] ),
    .C(_081_),
    .D(_083_),
    .X(_084_));
 sky130_fd_sc_hd__inv_2 _187_ (.A(emg_b_s),
    .Y(_085_));
 sky130_fd_sc_hd__or2_1 _188_ (.A(emg_a_s),
    .B(_085_),
    .X(_086_));
 sky130_fd_sc_hd__buf_1 _189_ (.A(_086_),
    .X(_007_));
 sky130_fd_sc_hd__a2bb2o_1 _190_ (.A1_N(_080_),
    .A2_N(_084_),
    .B1(_072_),
    .B2(_007_),
    .X(_087_));
 sky130_fd_sc_hd__inv_2 _191_ (.A(_087_),
    .Y(_088_));
 sky130_fd_sc_hd__clkbuf_2 _192_ (.A(\state[2] ),
    .X(_089_));
 sky130_fd_sc_hd__inv_2 _193_ (.A(\state[0] ),
    .Y(_090_));
 sky130_fd_sc_hd__clkbuf_2 _194_ (.A(_090_),
    .X(_004_));
 sky130_fd_sc_hd__or4_4 _195_ (.A(_089_),
    .B(_077_),
    .C(_004_),
    .D(_027_),
    .X(_091_));
 sky130_fd_sc_hd__buf_1 _196_ (.A(\state[0] ),
    .X(_092_));
 sky130_fd_sc_hd__clkbuf_2 _197_ (.A(\state[1] ),
    .X(_093_));
 sky130_fd_sc_hd__or4_4 _198_ (.A(_092_),
    .B(_093_),
    .C(_010_),
    .D(_076_),
    .X(_094_));
 sky130_fd_sc_hd__inv_2 _199_ (.A(_094_),
    .Y(net13));
 sky130_fd_sc_hd__or4_4 _200_ (.A(_089_),
    .B(_076_),
    .C(_092_),
    .D(_027_),
    .X(_095_));
 sky130_fd_sc_hd__or4_4 _201_ (.A(_010_),
    .B(_076_),
    .C(_090_),
    .D(_093_),
    .X(_096_));
 sky130_fd_sc_hd__a21oi_1 _202_ (.A1(_095_),
    .A2(_096_),
    .B1(_012_),
    .Y(_097_));
 sky130_fd_sc_hd__nor3_2 _203_ (.A(_077_),
    .B(net13),
    .C(_097_),
    .Y(_098_));
 sky130_fd_sc_hd__o221a_2 _204_ (.A1(_028_),
    .A2(_079_),
    .B1(_088_),
    .B2(_091_),
    .C1(_098_),
    .X(_099_));
 sky130_fd_sc_hd__inv_2 _205_ (.A(_099_),
    .Y(_100_));
 sky130_fd_sc_hd__o22a_1 _206_ (.A1(_010_),
    .A2(_099_),
    .B1(_089_),
    .B2(_100_),
    .X(_101_));
 sky130_fd_sc_hd__or2_1 _207_ (.A(_087_),
    .B(_091_),
    .X(_102_));
 sky130_fd_sc_hd__or2_2 _208_ (.A(_092_),
    .B(_079_),
    .X(_103_));
 sky130_fd_sc_hd__or4_4 _209_ (.A(_089_),
    .B(_077_),
    .C(_004_),
    .D(_093_),
    .X(_104_));
 sky130_fd_sc_hd__inv_2 _210_ (.A(_076_),
    .Y(_105_));
 sky130_fd_sc_hd__o32a_1 _211_ (.A1(_004_),
    .A2(_029_),
    .A3(_079_),
    .B1(_001_),
    .B2(_096_),
    .X(_106_));
 sky130_fd_sc_hd__o211a_1 _212_ (.A1(_003_),
    .A2(_095_),
    .B1(_105_),
    .C1(_106_),
    .X(_107_));
 sky130_fd_sc_hd__o221a_2 _213_ (.A1(_031_),
    .A2(_103_),
    .B1(_071_),
    .B2(_104_),
    .C1(_107_),
    .X(_108_));
 sky130_fd_sc_hd__nand2_2 _214_ (.A(_102_),
    .B(_108_),
    .Y(_109_));
 sky130_fd_sc_hd__a22oi_1 _215_ (.A1(_093_),
    .A2(_109_),
    .B1(_027_),
    .B2(_108_),
    .Y(_110_));
 sky130_fd_sc_hd__or4_4 _216_ (.A(_089_),
    .B(_077_),
    .C(_092_),
    .D(_093_),
    .X(_111_));
 sky130_fd_sc_hd__o21a_1 _217_ (.A1(_085_),
    .A2(_084_),
    .B1(_071_),
    .X(_112_));
 sky130_fd_sc_hd__o31a_1 _218_ (.A1(_090_),
    .A2(_010_),
    .A3(_005_),
    .B1(_105_),
    .X(_113_));
 sky130_fd_sc_hd__o221a_1 _219_ (.A1(_006_),
    .A2(_103_),
    .B1(_009_),
    .B2(_095_),
    .C1(_113_),
    .X(_114_));
 sky130_fd_sc_hd__o221a_1 _220_ (.A1(_071_),
    .A2(_094_),
    .B1(_028_),
    .B2(_104_),
    .C1(_114_),
    .X(_115_));
 sky130_fd_sc_hd__o311a_2 _221_ (.A1(emg_a_s),
    .A2(_111_),
    .A3(_112_),
    .B1(_115_),
    .C1(_102_),
    .X(_116_));
 sky130_fd_sc_hd__inv_2 _222_ (.A(_116_),
    .Y(_117_));
 sky130_fd_sc_hd__o22a_1 _223_ (.A1(_004_),
    .A2(_116_),
    .B1(_092_),
    .B2(_117_),
    .X(_118_));
 sky130_fd_sc_hd__or4_4 _224_ (.A(_077_),
    .B(_101_),
    .C(_110_),
    .D(_118_),
    .X(_119_));
 sky130_fd_sc_hd__inv_2 _225_ (.A(_119_),
    .Y(_120_));
 sky130_fd_sc_hd__clkbuf_4 _226_ (.A(_120_),
    .X(_014_));
 sky130_fd_sc_hd__o2111a_1 _227_ (.A1(\cnt[6] ),
    .A2(_074_),
    .B1(_075_),
    .C1(\cnt[7] ),
    .D1(_014_),
    .X(_064_));
 sky130_fd_sc_hd__clkbuf_2 _228_ (.A(net4),
    .X(_121_));
 sky130_fd_sc_hd__clkbuf_2 _229_ (.A(_119_),
    .X(_122_));
 sky130_fd_sc_hd__a2bb2oi_1 _230_ (.A1_N(\cnt[6] ),
    .A2_N(_074_),
    .B1(\cnt[6] ),
    .B2(_074_),
    .Y(_123_));
 sky130_fd_sc_hd__nor3_1 _231_ (.A(_121_),
    .B(_122_),
    .C(_123_),
    .Y(_063_));
 sky130_fd_sc_hd__nand2_1 _232_ (.A(\cnt[5] ),
    .B(_073_),
    .Y(_124_));
 sky130_fd_sc_hd__a211oi_1 _233_ (.A1(_074_),
    .A2(_124_),
    .B1(_121_),
    .C1(_122_),
    .Y(_062_));
 sky130_fd_sc_hd__o21ai_1 _234_ (.A1(_069_),
    .A2(_028_),
    .B1(_014_),
    .Y(_125_));
 sky130_fd_sc_hd__inv_2 _235_ (.A(_125_),
    .Y(_126_));
 sky130_fd_sc_hd__clkbuf_2 _236_ (.A(_125_),
    .X(_127_));
 sky130_fd_sc_hd__clkbuf_2 _237_ (.A(_075_),
    .X(_128_));
 sky130_fd_sc_hd__o221a_1 _238_ (.A1(_036_),
    .A2(_126_),
    .B1(\cnt[4] ),
    .B2(_127_),
    .C1(_128_),
    .X(_061_));
 sky130_fd_sc_hd__o221a_1 _239_ (.A1(_035_),
    .A2(_126_),
    .B1(\cnt[3] ),
    .B2(_127_),
    .C1(_128_),
    .X(_060_));
 sky130_fd_sc_hd__o221a_1 _240_ (.A1(_034_),
    .A2(_126_),
    .B1(\cnt[2] ),
    .B2(_127_),
    .C1(_128_),
    .X(_059_));
 sky130_fd_sc_hd__a221o_1 _241_ (.A1(\cnt[1] ),
    .A2(_126_),
    .B1(_033_),
    .B2(_127_),
    .C1(net4),
    .X(_058_));
 sky130_fd_sc_hd__clkbuf_2 _242_ (.A(_075_),
    .X(_129_));
 sky130_fd_sc_hd__o221a_1 _243_ (.A1(_032_),
    .A2(_126_),
    .B1(\cnt[0] ),
    .B2(_127_),
    .C1(_129_),
    .X(_057_));
 sky130_fd_sc_hd__a21oi_4 _244_ (.A1(_069_),
    .A2(_120_),
    .B1(_016_),
    .Y(_130_));
 sky130_fd_sc_hd__inv_2 _245_ (.A(_130_),
    .Y(_131_));
 sky130_fd_sc_hd__clkbuf_2 _246_ (.A(_131_),
    .X(_132_));
 sky130_fd_sc_hd__or2_1 _247_ (.A(\min_cnt[4] ),
    .B(_083_),
    .X(_133_));
 sky130_fd_sc_hd__or2_1 _248_ (.A(\min_cnt[5] ),
    .B(_133_),
    .X(_134_));
 sky130_fd_sc_hd__or2_1 _249_ (.A(\min_cnt[6] ),
    .B(_134_),
    .X(_135_));
 sky130_fd_sc_hd__inv_2 _250_ (.A(_135_),
    .Y(_136_));
 sky130_fd_sc_hd__inv_2 _251_ (.A(\min_cnt[7] ),
    .Y(_137_));
 sky130_fd_sc_hd__o221a_1 _252_ (.A1(\min_cnt[7] ),
    .A2(_136_),
    .B1(_137_),
    .B2(_135_),
    .C1(_014_),
    .X(_138_));
 sky130_fd_sc_hd__clkbuf_2 _253_ (.A(_130_),
    .X(_139_));
 sky130_fd_sc_hd__o221a_1 _254_ (.A1(_132_),
    .A2(_138_),
    .B1(\min_cnt[7] ),
    .B2(_139_),
    .C1(_129_),
    .X(_056_));
 sky130_fd_sc_hd__a21oi_1 _255_ (.A1(\min_cnt[6] ),
    .A2(_134_),
    .B1(_136_),
    .Y(_140_));
 sky130_fd_sc_hd__nor2_1 _256_ (.A(_122_),
    .B(_140_),
    .Y(_141_));
 sky130_fd_sc_hd__o221a_1 _257_ (.A1(_132_),
    .A2(_141_),
    .B1(\min_cnt[6] ),
    .B2(_139_),
    .C1(_129_),
    .X(_055_));
 sky130_fd_sc_hd__nand2_1 _258_ (.A(\min_cnt[5] ),
    .B(_133_),
    .Y(_142_));
 sky130_fd_sc_hd__a21oi_1 _259_ (.A1(_134_),
    .A2(_142_),
    .B1(_122_),
    .Y(_143_));
 sky130_fd_sc_hd__o221a_1 _260_ (.A1(_132_),
    .A2(_143_),
    .B1(\min_cnt[5] ),
    .B2(_139_),
    .C1(_129_),
    .X(_054_));
 sky130_fd_sc_hd__nand2_1 _261_ (.A(\min_cnt[4] ),
    .B(_083_),
    .Y(_144_));
 sky130_fd_sc_hd__a21oi_1 _262_ (.A1(_133_),
    .A2(_144_),
    .B1(_119_),
    .Y(_145_));
 sky130_fd_sc_hd__o221a_1 _263_ (.A1(_132_),
    .A2(_145_),
    .B1(\min_cnt[4] ),
    .B2(_139_),
    .C1(_129_),
    .X(_053_));
 sky130_fd_sc_hd__inv_2 _264_ (.A(_083_),
    .Y(_146_));
 sky130_fd_sc_hd__o21a_1 _265_ (.A1(\min_cnt[2] ),
    .A2(_082_),
    .B1(\min_cnt[3] ),
    .X(_147_));
 sky130_fd_sc_hd__o21a_1 _266_ (.A1(_146_),
    .A2(_147_),
    .B1(_014_),
    .X(_148_));
 sky130_fd_sc_hd__clkbuf_2 _267_ (.A(_075_),
    .X(_149_));
 sky130_fd_sc_hd__o221a_1 _268_ (.A1(_132_),
    .A2(_148_),
    .B1(\min_cnt[3] ),
    .B2(_139_),
    .C1(_149_),
    .X(_052_));
 sky130_fd_sc_hd__a2bb2oi_1 _269_ (.A1_N(\min_cnt[2] ),
    .A2_N(_082_),
    .B1(\min_cnt[2] ),
    .B2(_082_),
    .Y(_150_));
 sky130_fd_sc_hd__nor2_1 _270_ (.A(_122_),
    .B(_150_),
    .Y(_151_));
 sky130_fd_sc_hd__o221a_1 _271_ (.A1(_131_),
    .A2(_151_),
    .B1(\min_cnt[2] ),
    .B2(_130_),
    .C1(_149_),
    .X(_051_));
 sky130_fd_sc_hd__or2_1 _272_ (.A(_119_),
    .B(_131_),
    .X(_152_));
 sky130_fd_sc_hd__a21bo_1 _273_ (.A1(\min_cnt[1] ),
    .A2(\min_cnt[0] ),
    .B1_N(_082_),
    .X(_153_));
 sky130_fd_sc_hd__o221a_1 _274_ (.A1(\min_cnt[1] ),
    .A2(_130_),
    .B1(_152_),
    .B2(_153_),
    .C1(_149_),
    .X(_050_));
 sky130_fd_sc_hd__inv_2 _275_ (.A(\min_cnt[0] ),
    .Y(_154_));
 sky130_fd_sc_hd__o221a_1 _276_ (.A1(\min_cnt[0] ),
    .A2(_130_),
    .B1(_154_),
    .B2(_152_),
    .C1(_149_),
    .X(_049_));
 sky130_fd_sc_hd__or3_4 _277_ (.A(_117_),
    .B(_099_),
    .C(_108_),
    .X(_155_));
 sky130_fd_sc_hd__inv_2 _278_ (.A(resume_b),
    .Y(_156_));
 sky130_fd_sc_hd__nor2_1 _279_ (.A(_096_),
    .B(_155_),
    .Y(_157_));
 sky130_fd_sc_hd__o22a_1 _280_ (.A1(_095_),
    .A2(_155_),
    .B1(_156_),
    .B2(_157_),
    .X(_158_));
 sky130_fd_sc_hd__nor2_1 _281_ (.A(_121_),
    .B(_158_),
    .Y(_048_));
 sky130_fd_sc_hd__buf_1 _282_ (.A(_075_),
    .X(_159_));
 sky130_fd_sc_hd__and2_1 _283_ (.A(_159_),
    .B(\sync_b[0] ),
    .X(_047_));
 sky130_fd_sc_hd__and2_1 _284_ (.A(_159_),
    .B(net2),
    .X(_046_));
 sky130_fd_sc_hd__and2_1 _285_ (.A(_159_),
    .B(\sync_a[0] ),
    .X(_045_));
 sky130_fd_sc_hd__and2_1 _286_ (.A(_159_),
    .B(net1),
    .X(_044_));
 sky130_fd_sc_hd__and2_1 _287_ (.A(_159_),
    .B(ped_s),
    .X(_043_));
 sky130_fd_sc_hd__and2_1 _288_ (.A(_128_),
    .B(\sync_p[0] ),
    .X(_042_));
 sky130_fd_sc_hd__and2_1 _289_ (.A(_128_),
    .B(net3),
    .X(_041_));
 sky130_fd_sc_hd__or2_1 _290_ (.A(_121_),
    .B(_100_),
    .X(_039_));
 sky130_fd_sc_hd__or2_1 _291_ (.A(_121_),
    .B(_109_),
    .X(_038_));
 sky130_fd_sc_hd__or2_1 _292_ (.A(net4),
    .B(_117_),
    .X(_037_));
 sky130_fd_sc_hd__inv_2 _293_ (.A(_103_),
    .Y(net14));
 sky130_fd_sc_hd__inv_2 _294_ (.A(_091_),
    .Y(net11));
 sky130_fd_sc_hd__inv_2 _295_ (.A(_104_),
    .Y(net10));
 sky130_fd_sc_hd__inv_2 _296_ (.A(_111_),
    .Y(net8));
 sky130_fd_sc_hd__nor2_1 _297_ (.A(net8),
    .B(net10),
    .Y(net9));
 sky130_fd_sc_hd__o21ai_1 _298_ (.A1(resume_b),
    .A2(emg_b_s),
    .B1(_080_),
    .Y(_030_));
 sky130_fd_sc_hd__or3b_2 _299_ (.A(emg_b_s),
    .B(emg_a_s),
    .C_N(ped_pending),
    .X(_160_));
 sky130_fd_sc_hd__buf_1 _300_ (.A(_160_),
    .X(_011_));
 sky130_fd_sc_hd__and2_1 _301_ (.A(_007_),
    .B(_011_),
    .X(_000_));
 sky130_fd_sc_hd__clkbuf_1 _302_ (.A(emg_a_s),
    .X(_002_));
 sky130_fd_sc_hd__nand2_1 _303_ (.A(_080_),
    .B(_011_),
    .Y(_008_));
 sky130_fd_sc_hd__nor2_1 _304_ (.A(_069_),
    .B(_084_),
    .Y(_013_));
 sky130_fd_sc_hd__o221ai_4 _305_ (.A1(_117_),
    .A2(_108_),
    .B1(_116_),
    .B2(_109_),
    .C1(_099_),
    .Y(_015_));
 sky130_fd_sc_hd__inv_2 _306_ (.A(\cnt[0] ),
    .Y(_017_));
 sky130_fd_sc_hd__o22a_1 _307_ (.A1(_117_),
    .A2(_099_),
    .B1(_116_),
    .B2(_100_),
    .X(_161_));
 sky130_fd_sc_hd__nor2_1 _308_ (.A(_109_),
    .B(_161_),
    .Y(_018_));
 sky130_fd_sc_hd__a21bo_1 _309_ (.A1(\cnt[1] ),
    .A2(\cnt[0] ),
    .B1_N(_066_),
    .X(_019_));
 sky130_fd_sc_hd__clkbuf_1 _310_ (.A(_015_),
    .X(_020_));
 sky130_fd_sc_hd__a21bo_1 _311_ (.A1(\cnt[2] ),
    .A2(_066_),
    .B1_N(_067_),
    .X(_021_));
 sky130_fd_sc_hd__inv_2 _312_ (.A(net6),
    .Y(_162_));
 sky130_fd_sc_hd__o21ai_1 _313_ (.A1(_162_),
    .A2(_015_),
    .B1(_155_),
    .Y(_022_));
 sky130_fd_sc_hd__a21bo_1 _314_ (.A1(\cnt[3] ),
    .A2(_067_),
    .B1_N(_068_),
    .X(_023_));
 sky130_fd_sc_hd__nor2_1 _315_ (.A(net7),
    .B(_015_),
    .Y(_024_));
 sky130_fd_sc_hd__a2bb2o_1 _316_ (.A1_N(\cnt[4] ),
    .A2_N(_068_),
    .B1(\cnt[4] ),
    .B2(_068_),
    .X(_025_));
 sky130_fd_sc_hd__nor2b_1 _317_ (.A(_015_),
    .B_N(net7),
    .Y(_026_));
 sky130_fd_sc_hd__nor2_1 _318_ (.A(net11),
    .B(net13),
    .Y(net12));
 sky130_fd_sc_hd__inv_2 _319_ (.A(ped_d),
    .Y(_163_));
 sky130_fd_sc_hd__a31o_1 _320_ (.A1(ped_s),
    .A2(_163_),
    .A3(_103_),
    .B1(ped_pending),
    .X(_164_));
 sky130_fd_sc_hd__o211a_1 _321_ (.A1(net14),
    .A2(_155_),
    .B1(_149_),
    .C1(_164_),
    .X(_065_));
 sky130_fd_sc_hd__conb_1 _322_ (.LO(_040_));
 sky130_fd_sc_hd__mux2_1 _323_ (.A0(_004_),
    .A1(_007_),
    .S(_028_),
    .X(_005_));
 sky130_fd_sc_hd__mux2_1 _324_ (.A0(_004_),
    .A1(_030_),
    .S(_028_),
    .X(_006_));
 sky130_fd_sc_hd__mux2_1 _325_ (.A0(_027_),
    .A1(_030_),
    .S(_028_),
    .X(_031_));
 sky130_fd_sc_hd__mux2_1 _326_ (.A0(_027_),
    .A1(_007_),
    .S(_028_),
    .X(_029_));
 sky130_fd_sc_hd__mux2_1 _327_ (.A0(_004_),
    .A1(_008_),
    .S(_028_),
    .X(_009_));
 sky130_fd_sc_hd__mux2_1 _328_ (.A0(_026_),
    .A1(_025_),
    .S(_014_),
    .X(_036_));
 sky130_fd_sc_hd__mux2_1 _329_ (.A0(_022_),
    .A1(_021_),
    .S(_014_),
    .X(_034_));
 sky130_fd_sc_hd__mux2_1 _330_ (.A0(_024_),
    .A1(_023_),
    .S(_014_),
    .X(_035_));
 sky130_fd_sc_hd__mux2_1 _331_ (.A0(_020_),
    .A1(_019_),
    .S(_014_),
    .X(_033_));
 sky130_fd_sc_hd__mux2_1 _332_ (.A0(_018_),
    .A1(_017_),
    .S(_014_),
    .X(_032_));
 sky130_fd_sc_hd__mux2_1 _333_ (.A0(_027_),
    .A1(_002_),
    .S(_028_),
    .X(_003_));
 sky130_fd_sc_hd__mux2_1 _334_ (.A0(_027_),
    .A1(_000_),
    .S(_028_),
    .X(_001_));
 sky130_fd_sc_hd__mux2_1 _335_ (.A0(_010_),
    .A1(_011_),
    .S(_028_),
    .X(_012_));
 sky130_fd_sc_hd__mux2_1 _336_ (.A0(_015_),
    .A1(_013_),
    .S(_014_),
    .X(_016_));
 sky130_fd_sc_hd__dfxtp_1 _337_ (.D(_037_),
    .Q(\state[0] ),
    .CLK(clknet_2_0_0_clk));
 sky130_fd_sc_hd__dfxtp_1 _338_ (.D(_038_),
    .Q(\state[1] ),
    .CLK(clknet_2_0_0_clk));
 sky130_fd_sc_hd__dfxtp_1 _339_ (.D(_039_),
    .Q(\state[2] ),
    .CLK(clknet_2_0_0_clk));
 sky130_fd_sc_hd__dfxtp_1 _340_ (.D(_040_),
    .Q(\state[3] ),
    .CLK(clknet_2_0_0_clk));
 sky130_fd_sc_hd__dfxtp_1 _341_ (.D(_041_),
    .Q(\sync_p[0] ),
    .CLK(clknet_2_2_0_clk));
 sky130_fd_sc_hd__dfxtp_1 _342_ (.D(_042_),
    .Q(ped_s),
    .CLK(clknet_2_2_0_clk));
 sky130_fd_sc_hd__dfxtp_1 _343_ (.D(_043_),
    .Q(ped_d),
    .CLK(clknet_2_2_0_clk));
 sky130_fd_sc_hd__dfxtp_1 _344_ (.D(_044_),
    .Q(\sync_a[0] ),
    .CLK(clknet_2_2_0_clk));
 sky130_fd_sc_hd__dfxtp_1 _345_ (.D(_045_),
    .Q(emg_a_s),
    .CLK(clknet_2_2_0_clk));
 sky130_fd_sc_hd__dfxtp_1 _346_ (.D(_046_),
    .Q(\sync_b[0] ),
    .CLK(clknet_2_2_0_clk));
 sky130_fd_sc_hd__dfxtp_1 _347_ (.D(_047_),
    .Q(emg_b_s),
    .CLK(clknet_2_2_0_clk));
 sky130_fd_sc_hd__dfxtp_1 _348_ (.D(_048_),
    .Q(resume_b),
    .CLK(clknet_2_2_0_clk));
 sky130_fd_sc_hd__dfxtp_1 _349_ (.D(_049_),
    .Q(\min_cnt[0] ),
    .CLK(clknet_2_3_0_clk));
 sky130_fd_sc_hd__dfxtp_1 _350_ (.D(_050_),
    .Q(\min_cnt[1] ),
    .CLK(clknet_2_3_0_clk));
 sky130_fd_sc_hd__dfxtp_1 _351_ (.D(_051_),
    .Q(\min_cnt[2] ),
    .CLK(clknet_2_3_0_clk));
 sky130_fd_sc_hd__dfxtp_1 _352_ (.D(_052_),
    .Q(\min_cnt[3] ),
    .CLK(clknet_2_3_0_clk));
 sky130_fd_sc_hd__dfxtp_1 _353_ (.D(_053_),
    .Q(\min_cnt[4] ),
    .CLK(clknet_2_3_0_clk));
 sky130_fd_sc_hd__dfxtp_1 _354_ (.D(_054_),
    .Q(\min_cnt[5] ),
    .CLK(clknet_2_3_0_clk));
 sky130_fd_sc_hd__dfxtp_1 _355_ (.D(_055_),
    .Q(\min_cnt[6] ),
    .CLK(clknet_2_3_0_clk));
 sky130_fd_sc_hd__dfxtp_1 _356_ (.D(_056_),
    .Q(\min_cnt[7] ),
    .CLK(clknet_2_3_0_clk));
 sky130_fd_sc_hd__dfxtp_1 _357_ (.D(_057_),
    .Q(\cnt[0] ),
    .CLK(clknet_2_1_0_clk));
 sky130_fd_sc_hd__dfxtp_1 _358_ (.D(_058_),
    .Q(\cnt[1] ),
    .CLK(clknet_2_0_0_clk));
 sky130_fd_sc_hd__dfxtp_1 _359_ (.D(_059_),
    .Q(\cnt[2] ),
    .CLK(clknet_2_1_0_clk));
 sky130_fd_sc_hd__dfxtp_1 _360_ (.D(_060_),
    .Q(\cnt[3] ),
    .CLK(clknet_2_1_0_clk));
 sky130_fd_sc_hd__dfxtp_1 _361_ (.D(_061_),
    .Q(\cnt[4] ),
    .CLK(clknet_2_1_0_clk));
 sky130_fd_sc_hd__dfxtp_1 _362_ (.D(_062_),
    .Q(\cnt[5] ),
    .CLK(clknet_2_1_0_clk));
 sky130_fd_sc_hd__dfxtp_1 _363_ (.D(_063_),
    .Q(\cnt[6] ),
    .CLK(clknet_2_1_0_clk));
 sky130_fd_sc_hd__dfxtp_1 _364_ (.D(_064_),
    .Q(\cnt[7] ),
    .CLK(clknet_2_1_0_clk));
 sky130_fd_sc_hd__dfxtp_1 _365_ (.D(_065_),
    .Q(ped_pending),
    .CLK(clknet_2_3_0_clk));
 sky130_fd_sc_hd__decap_3 PHY_0 ();
 sky130_fd_sc_hd__decap_3 PHY_1 ();
 sky130_fd_sc_hd__decap_3 PHY_2 ();
 sky130_fd_sc_hd__decap_3 PHY_3 ();
 sky130_fd_sc_hd__decap_3 PHY_4 ();
 sky130_fd_sc_hd__decap_3 PHY_5 ();
 sky130_fd_sc_hd__decap_3 PHY_6 ();
 sky130_fd_sc_hd__decap_3 PHY_7 ();
 sky130_fd_sc_hd__decap_3 PHY_8 ();
 sky130_fd_sc_hd__decap_3 PHY_9 ();
 sky130_fd_sc_hd__decap_3 PHY_10 ();
 sky130_fd_sc_hd__decap_3 PHY_11 ();
 sky130_fd_sc_hd__decap_3 PHY_12 ();
 sky130_fd_sc_hd__decap_3 PHY_13 ();
 sky130_fd_sc_hd__decap_3 PHY_14 ();
 sky130_fd_sc_hd__decap_3 PHY_15 ();
 sky130_fd_sc_hd__decap_3 PHY_16 ();
 sky130_fd_sc_hd__decap_3 PHY_17 ();
 sky130_fd_sc_hd__decap_3 PHY_18 ();
 sky130_fd_sc_hd__decap_3 PHY_19 ();
 sky130_fd_sc_hd__decap_3 PHY_20 ();
 sky130_fd_sc_hd__decap_3 PHY_21 ();
 sky130_fd_sc_hd__decap_3 PHY_22 ();
 sky130_fd_sc_hd__decap_3 PHY_23 ();
 sky130_fd_sc_hd__decap_3 PHY_24 ();
 sky130_fd_sc_hd__decap_3 PHY_25 ();
 sky130_fd_sc_hd__decap_3 PHY_26 ();
 sky130_fd_sc_hd__decap_3 PHY_27 ();
 sky130_fd_sc_hd__decap_3 PHY_28 ();
 sky130_fd_sc_hd__decap_3 PHY_29 ();
 sky130_fd_sc_hd__decap_3 PHY_30 ();
 sky130_fd_sc_hd__decap_3 PHY_31 ();
 sky130_fd_sc_hd__decap_3 PHY_32 ();
 sky130_fd_sc_hd__decap_3 PHY_33 ();
 sky130_fd_sc_hd__decap_3 PHY_34 ();
 sky130_fd_sc_hd__decap_3 PHY_35 ();
 sky130_fd_sc_hd__decap_3 PHY_36 ();
 sky130_fd_sc_hd__decap_3 PHY_37 ();
 sky130_fd_sc_hd__decap_3 PHY_38 ();
 sky130_fd_sc_hd__decap_3 PHY_39 ();
 sky130_fd_sc_hd__decap_3 PHY_40 ();
 sky130_fd_sc_hd__decap_3 PHY_41 ();
 sky130_fd_sc_hd__decap_3 PHY_42 ();
 sky130_fd_sc_hd__decap_3 PHY_43 ();
 sky130_fd_sc_hd__decap_3 PHY_44 ();
 sky130_fd_sc_hd__decap_3 PHY_45 ();
 sky130_fd_sc_hd__decap_3 PHY_46 ();
 sky130_fd_sc_hd__decap_3 PHY_47 ();
 sky130_fd_sc_hd__decap_3 PHY_48 ();
 sky130_fd_sc_hd__decap_3 PHY_49 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_50 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_51 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_52 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_53 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_54 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_55 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_56 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_57 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_58 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_59 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_60 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_61 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_62 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_63 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_64 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_65 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_66 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_67 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_68 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_69 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_70 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_71 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_72 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_73 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_74 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_75 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_76 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_77 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_78 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_79 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_80 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_81 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_82 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_83 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_84 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_85 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_86 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_87 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_88 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_89 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_90 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_91 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_92 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_93 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_94 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_95 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_96 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_97 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_98 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_99 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_100 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_101 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_102 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_103 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_104 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_105 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_106 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_107 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_108 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_109 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_110 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_111 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_112 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_113 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_114 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_115 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_116 ();
 sky130_fd_sc_hd__clkbuf_1 input1 (.A(emg_a),
    .X(net1));
 sky130_fd_sc_hd__clkbuf_1 input2 (.A(emg_b),
    .X(net2));
 sky130_fd_sc_hd__clkbuf_1 input3 (.A(ped_req),
    .X(net3));
 sky130_fd_sc_hd__dlymetal6s2s_1 input4 (.A(reset),
    .X(net4));
 sky130_fd_sc_hd__clkbuf_1 input5 (.A(tick),
    .X(net5));
 sky130_fd_sc_hd__clkbuf_1 input6 (.A(timing_sel[0]),
    .X(net6));
 sky130_fd_sc_hd__clkbuf_1 input7 (.A(timing_sel[1]),
    .X(net7));
 sky130_fd_sc_hd__clkbuf_2 output8 (.A(net8),
    .X(a_green));
 sky130_fd_sc_hd__clkbuf_2 output9 (.A(net9),
    .X(a_red));
 sky130_fd_sc_hd__clkbuf_2 output10 (.A(net10),
    .X(a_yellow));
 sky130_fd_sc_hd__clkbuf_2 output11 (.A(net11),
    .X(b_green));
 sky130_fd_sc_hd__clkbuf_2 output12 (.A(net12),
    .X(b_red));
 sky130_fd_sc_hd__clkbuf_2 output13 (.A(net13),
    .X(b_yellow));
 sky130_fd_sc_hd__clkbuf_2 output14 (.A(net14),
    .X(ped_walk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_0_clk (.A(clk),
    .X(clknet_0_clk));
 sky130_fd_sc_hd__clkbuf_1 clkbuf_1_0_0_clk (.A(clknet_0_clk),
    .X(clknet_1_0_0_clk));
 sky130_fd_sc_hd__clkbuf_1 clkbuf_1_1_0_clk (.A(clknet_0_clk),
    .X(clknet_1_1_0_clk));
 sky130_fd_sc_hd__clkbuf_1 clkbuf_2_0_0_clk (.A(clknet_1_0_0_clk),
    .X(clknet_2_0_0_clk));
 sky130_fd_sc_hd__clkbuf_1 clkbuf_2_1_0_clk (.A(clknet_1_0_0_clk),
    .X(clknet_2_1_0_clk));
 sky130_fd_sc_hd__clkbuf_1 clkbuf_2_2_0_clk (.A(clknet_1_1_0_clk),
    .X(clknet_2_2_0_clk));
 sky130_fd_sc_hd__clkbuf_1 clkbuf_2_3_0_clk (.A(clknet_1_1_0_clk),
    .X(clknet_2_3_0_clk));
endmodule
