%% Ch.3 Order of accuracy : Lax-Friedrichs scheme
clc
for i=1:n-1
    for j=2:m-1
        % Lax-Friedrichs scheme
        u(i+1,j)=0.5*(u(i,j+1)+u(i,j-1))-0.5*a*lambda*(u(i,j+1)-u(i,j-1));
    end
    u(i+1,1)=0; % boundary, at x=-1.
    u(i+1,m)=u(i+1,m-1); % boundary, at x=1
    u(:,1)=u(:,m); % periodic condition
end
