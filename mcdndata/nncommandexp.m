clear all;
load("input.mat");
load("Target.mat");

in = input';
out = target';

r = [(min(input))'-100 (max(input))'+100];
n = [15 10 10 1];

net = newff(r,n,{'tansig' 'tansig' 'tansig' 'tansig'},'trainlm');
net1 = train(net,in,out);

a = sim(net1,in);



