%% Ch.3 Order of accuracy : FTCS scheme
clc
 for j=1:n-1 % forward-time backward-space
        for i=1:m
            if i==1
                u(j+1,i)=u(j,i)-a*lambda/2*(u(j,i+1)-u(j,m-1));
            else
                u(j+1,i)=u(j,i)-a*lambda/2*(u(j,i+1)-u(j,i-1));
            end
        end
    end