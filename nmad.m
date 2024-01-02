%% Error Measures

% Normalized Mean Absolute Difference
% e is the vector of experimental stress values (or if strain control, the vector of experimental strain values)
% p is the vector of predicted stress values (or if strain control, the vector of predicted strain values)
function res=nmad(e,p)
res=100*mean(abs(e-p))./max([mean(abs(e)),mean(abs(p))]);
end
