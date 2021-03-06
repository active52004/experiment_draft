close all;
clear all;
clc;
MaxValue = 256;

dir = './results/';
origin = [dir,'original/replay_original_1000.csv'];%origin
optv1 = [dir,'optv1/replay_optv1_1000.csv'];%gf-mult two
optv2 = [dir,'optv2/replay_optv2_1000.csv'];%gf-mult rnd or cst
optv3 = [dir,'optv3/replay_optv3_gf1_1000.csv'];%gf-mult one
optv4_1 = [dir,'optv4/replay_optv4_gf1_1000.csv'];%flip-gfm one
optv4_2 = [dir,'optv4/replay_optv4_gf2_1000.csv'];%flip-gfm two

static_replay1 = [];
M_live=csvread(origin);
cetd_stat=[];
max1 = max(M_live(:,2));
cetd_stat = [cetd_stat;max1];
min1 = min(M_live(:,2));
cetd_stat = [cetd_stat;min1];
var1 = var(M_live(:,2));
cetd_stat = [cetd_stat;var1];
aver1 = mean(M_live(:,2));
cetd_stat = [cetd_stat;aver1];

static_replay1 = [static_replay1,cetd_stat];

M_live=csvread(optv1);
D1=[];
max1 = max(M_live(:,2));
D1 = [D1;max1];
min1 = min(M_live(:,2));
D1 = [D1;min1];
var1 = var(M_live(:,2));
D1 = [D1;var1];
aver1 = mean(M_live(:,2));
D1 = [D1;aver1];
static_replay1 = [static_replay1,D1];

M_live=csvread(optv2);
D2=[];
max1 = max(M_live(:,2));
D2 = [D2;max1];
min1 = min(M_live(:,2));
D2 = [D2;min1];
var1 = var(M_live(:,2));
D2 = [D2;var1];
aver1 = mean(M_live(:,2));
D2 = [D2;aver1];
static_replay1 = [static_replay1,D2];

M_live=csvread(optv3);
D3=[];
max1 = max(M_live(:,2));
D3 = [D3;max1];
min1 = min(M_live(:,2));
D3 = [D3;min1];
var1 = var(M_live(:,2));
D3 = [D3;var1];
aver1 = mean(M_live(:,2));
D3 = [D3;aver1];
static_replay1 = [static_replay1,D3];

M_live=csvread(optv4_1);
D5=[];
max1 = max(M_live(:,2));
D5 = [D5;max1];
min1 = min(M_live(:,2));
D5 = [D5;min1];
var1 = var(M_live(:,2));
D5 = [D5;var1];
aver1 = mean(M_live(:,2));
D5 = [D5;aver1];
static_replay1 = [static_replay1,D5];

M_live=csvread(optv4_2);
D6=[];
max1 = max(M_live(:,2));
D6 = [D6;max1];
min1 = min(M_live(:,2));
D6 = [D6;min1];
var1 = var(M_live(:,2));
D6 = [D6;var1];
aver1 = mean(M_live(:,2));
D6 = [D6;aver1];
static_replay1 = [static_replay1,D6];

dst_filename = 'replay_static_1000.csv';
csvwrite(dst_filename, static_replay1);
