%% To find the evolution of g33 from the given materials parameters
close all
clear 
clc
load 30percent_parallel.mat
load time.mat
%% parameters
x           =   [1.1997    0.0298    0.6041   36.4633  215.3859    0.0229];
mu0             =   x(1);
mu1             =   x(2);
mu2             =   x(3);
b0              =   x(4);
b1              =   x(5);
b2              =   x(6);
parameters1     =   [mu0,mu1,mu2,b0,b1,b2];

%% Stretch and Stretch Rate

lda1        =    @(t) 0.335793E1+(-0.1E0).*t+(-0.133333E-1).*log(0.1E1+ ...
  0.634852E77.*0.2718281828459045E1.^((-0.15E2).*t));
%%
binit           =       2.012747764451281; % initial concentration pameter (30 % parallel)
%%
TAI_integrand   =       @(th,g33,l,b,mu1,mu2) 4.*b.^(1/2).*exp(1).^(2.*b.*cos(th).^2.*(cos(th).^2+g33.^3.* ...
  sin(th).^2).^(-1)+g33.^(-4).*l.^(-2).*mu2.*((-1).*g33.^2.*l+ ...
  l.^3.*cos(th).^2+g33.^3.*sin(th).^2).^2).*g33.^(-1).*l.^(-2) ...
  .*mu1.*(2.*pi).^(1/2).*erfi(2.^(1/2).*b.^(1/2)).^(-1).*sin( ...
  th).*(2.*l.^3.*cos(th).^2+(-1).*g33.^3.*sin(th).^2).*(cos( ...
  th).^2+g33.^3.*sin(th).^2).^(-3/2).*((-1).*g33.^2.*l+l.^3.* ...
  cos(th).^2+g33.^3.*sin(th).^2);

TAI             =       @(g33,l,b,mu1,mu2) integral(@(th) TAI_integrand(th,g33,l,b,mu1,mu2),0,pi,'ArrayValued',true);

PK1             =       @(t,g33) lda1(t).^(-1).*TAI(g33,lda1(t),binit,mu1,mu2)+(-1).* ...
  g33.*lda1(t).^(-2).*mu0+g33.^(-2).*lda1(t).*mu0;

%%
sol=zeros(length(time1),1);
xs=1;
for i=1:length(time1)
fun=@(g33) PK1(time1(i),g33)-per3010(i,2);
xs=fzero(fun,xs);
sol(i)=xs;
end

figure()
title('stress vs stretch')
xlabel('\lambda -1')
ylabel('\sigma')
for i=1:length(time1)
    plot(lda1(time1(i))-1,PK1(time1(i),sol(i)),'bo')
    title('stress vs stretch')
    xlabel('\lambda -1')
    ylabel('\sigma')
    hold on
end
hold off
%%

figure()
plot(time1,sol,'ro')
title('evolution of g33')
xlabel('time(t)')
ylabel('g33(t)')
