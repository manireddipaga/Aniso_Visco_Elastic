function dydt=evol(t,y,b,parameters,lda,kbar,kphat,ftermbar1,stermbar1)
mu0         =   parameters(1);
mu1         =   parameters(2);
mu2         =   parameters(3);
b0          =   parameters(4);
b1          =   parameters(5);
b2          =   parameters(6);

% arr         =   [t,y,lda(t),b,mu1,mu2]

% firstterm   =   ftermbar1(y,lda(t),b,mu1,mu2)
% 
% secondterm  =   stermbar1(y,lda(t),b,mu1,mu2)
%parameters
dydt        = (-2).*lda(t).^(-1).*y.^(-1).*(3.*b0+b1+12.*b2.*y.^2.*kbar( ...
  y).^2+(-6).*b1.*kphat(y)+9.*b1.*kphat(y).^2).^(-1).*((-1).* ...
  lda(t).^3.*mu0+mu0.*y.^3+lda(t).*y.^3.*ftermbar1(y,lda(t),b, ...
  mu1,mu2)+(-1).*lda(t).*y.^3.*stermbar1(y,lda(t),b,mu1,mu2));







end