%% Ch.3 Order of accuracy : Leapfrog scheme
clc

 for j=1:n-1 % leapfrog
        for i=1:m
            if j==1
                if i==1 % first time step for leapfrog (FTCS)
                    u(j+1,i)=u(j,i)-1/2*a*lambda*(u(j,i+1)-u(j,m-1));
                elseif i==Nx
                    u(j+1,i)=u(j,i)-1/2*a*lambda*(u(j,2)-u(j,i-1));
                else
                    u(j+1,i)=u(j,i)-1/2*a*lambda*(u(j,i+1)-u(j,i-1));
                end
            else
                if i==1
                    u(j+1,i)=u(j-1,i)-a*lambda*(u(j,i+1)-u(j,m-1));
                elseif i==m
                    u(j+1,i)=u(j-1,i)-a*lambda*(u(j,2)-u(j,i-1));
                else
                    u(j+1,i)=u(j-1,i)-a*lambda*(u(j,i+1)-u(j,i-1));
                end
            end
        end
    end