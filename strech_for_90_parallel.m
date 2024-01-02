load per90.mat
load time90.mat
%% Stretch for 90% parallel
lda1=@(t) 0.184206E1+(-0.1E0).*t+(-0.2E-1).*log(0.1E1+0.192821E19.* ...
  exp(1).^((-0.1E2).*t));
lda2=@(t) 0.193032E1+(-0.1E-1).*t+(-0.2E-1).*log(0.1E1+0.159085E21.* ...
  exp(1).^((-0.1E1).*t));
lda3 =@(t) 0.169997E1+(-0.1E-2).*t+(-0.117647E-1).*log(0.1E1+ ...
  0.690904E26.*exp(1).^((-0.17E0).*t));
lda4 =@(t) 0.197031E1+(-0.1E-3).*t+(-0.2E-1).*log(0.1E1+0.117505E22.* ... 
    exp(1).^((-0.1E-1).*t));
 %% Plotting
 figure()
 plot(time1,lda1(time1))
 figure()
 plot(time2,lda2(time2))
 figure()
 plot(time3,lda3(time3))
 figure()
 plot(time4,lda4(time4))