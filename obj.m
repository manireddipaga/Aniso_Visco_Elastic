function res=obj(x)
mu0=x(1);
mu1=x(2);
res=100*(mu1-mu0^2)^2 + (1-mu0)^2;

end