%% Error Measures


% Relative Error

function res=re(e,p)

res=(100/length(e))*sum((abs(e-p))/max([abs(e),abs(p)]));


end