%% Ch.3 Order of accuracy : FTFS scheme
clc
for i=1:n-1
    for j=1:m-1
        % Forward-time forward-space scheme
        u(i+1,j)=u(i,j)-a*lambda*(u(i,j+1)-u(i,j));
    end
    u(i+1,1)=0; % boundary, at x=-1.
    u(i+1,m)=u(i+1,m-1); % boundary, at x=1
    u(:,1)=u(:,m); % periodic condition
end
