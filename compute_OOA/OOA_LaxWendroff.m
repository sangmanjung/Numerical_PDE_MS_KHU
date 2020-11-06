%% Ch.3 Order of accuracy : Lax-Wendroff scheme
clc
for i=1:n-1
    for j=2:m-1
        % Lax-Wendroff scheme
        u(i+1,j)=u(i,j)-a*lambda/2*(u(i,j+1)-u(i,j-1))+a^2*lambda^2/2*(u(i,j+1)-2*u(i,j)+u(i,j-1));
    end
    u(i+1,1)=0; % boundary, at x=-1.
    u(i+1,m)=u(i+1,m-1); % boundary, at x=1
    u(:,1)=u(:,m); % periodic condition
end
