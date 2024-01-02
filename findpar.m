% run %% Hybrid model Stored Energy (AI type) dissipation (GST type)

%% Finding parameters using fmincon(Optimization)
clear
close all
clc
%x0_nmad              =   [2.41270213628628	1.06325616999114	27.6720036642161	293.833198400588	0.000139855033147191	2.62944427912196	69.7510415444331	413.051143659560	144.438200361598	104.809502452000	116.701838174739	116.311453528110];
%x0              =   [1,1,1,1,1,1,1,1,1,1,1,1];
%x0              =   rand(12,1);
A               =   [];
b               =   [];
Aeq             =   [];
beq             =   [];
%%
% lb              =   [1e-8,1e-8,1e-8,1e-8,1e-8,1e-8,1e-8,1e-8,1e-8,1e-8,1e-8,1e-8];
% ub              =   [50,50,50,500,50,10,500,500,500,900,900,50];
% lb              =   [1e-8,1e-8,1e-8,1e-8,1e-8,1e-8];
% ub              =   [50,50,10,200,200,200];
% [xval,fval]     =   fmincon(@gst_model,x0,A,b,Aeq,beq,lb,ub)
%[xval,fval]     =   ga(@gst_model,12,A,b,Aeq,beq,lb,ub,[],options);
%% rates 10%, 1%, 0.1%
lb              =   [1e-8,1e-8,1e-8,1e-8,1e-8,1e-8,1e-8];
ub              =   [50,50,10,50,500,500,500];
options = optimoptions('ga','UseParallel',true,'ConstraintTolerance',1e-6,'PlotFcn',{@gaplotbestf,@gaplotbestindiv});

[xval,fval]     =   ga(@gst_model,7,A,b,Aeq,beq,lb,ub,[],options);
stress_stretch_plot(xval)

%% rates 10%, 1%
% lb              =   [1e-8,1e-8,1e-8,1e-8,1e-8,1e-8,1e-8,1e-8];
% ub              =   [50,50,50,10,500,500,500,500];
% options = optimoptions('ga','UseParallel',true,'ConstraintTolerance',1e-6,'PlotFcn',{@gaplotbestf,@gaplotbestindiv});
% 
% [xval,fval]     =   ga(@gst_model,8,A,b,Aeq,beq,lb,ub,[],options);
% stress_stretch_plot(xval)