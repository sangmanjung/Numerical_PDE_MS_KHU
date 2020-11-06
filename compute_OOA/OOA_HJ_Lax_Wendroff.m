%% Ch.3 Order of accuracy : Lax-Wendroff scheme
clc

for j=1:n-1
    for i=1:m
        if i==1
            u2(j+1,i)=u2(j,i)-a*lambda/2*(u2(j,i+1)-u2(j,m-1))+a^2*lambda^2/2*(u2(j,i+1)-2*u2(j,i)+u2(j,m-1));
        elseif i==m
            u2(j+1,i)=u2(j,i)-a*lambda/2*(u2(j,2)-u2(j,i-1))+a^2*lambda^2/2*(u2(j,2)-2*u2(j,i)+u2(j,i-1));
        else
            u2(j+1,i)=u2(j,i)-a*lambda/2*(u2(j,i+1)-u2(j,i-1))+a^2*lambda^2/2*(u2(j,i+1)-2*u2(j,i)+u2(j,i-1));
        end
    end
end