%% Error Measures

% Mean Squared Difference

% e is the vector of experimental stress values (or if strain control, the vector of experimental strain values)
% p is the vector of predicted stress values (or if strain control, the vector of predicted strain values)

function res=msd(e,p)
    res=(1/length(e))*sum((e-p).^2);
end