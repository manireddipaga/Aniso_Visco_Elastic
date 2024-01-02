%% Error Measure
% Root mean square error
function res=rms(e,p)
        res=sqrt((1/length(e))*sum((e-p).^2));
end