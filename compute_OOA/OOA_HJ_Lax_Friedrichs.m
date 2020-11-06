%% Ch.3 Order of accuracy : Lax-Friedrichs scheme
clc

for j=1:n-1
    for i=1:m
        if i==1
            u4(j+1,i)=1/2*(u4(j,i+1)+u4(j,m-1))-1/2*a*lambda*(u4(j,i+1)-u4(j,m-1));
        elseif i==m
            u4(j+1,i)=1/2*(u4(j,2)+u4(j,i-1))-1/2*a*lambda*(u4(j,2)-u4(j,i-1));
        else
            u4(j+1,i)=1/2*(u4(j,i+1)+u4(j,i-1))-1/2*a*lambda*(u4(j,i+1)-u4(j,i-1));
        end
    end
end