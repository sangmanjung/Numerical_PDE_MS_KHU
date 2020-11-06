%% Ch.3 Order of accuracy : FTCS scheme
clc
for i=1:n-1
    for j=2:m-1
        % Forward-time central-space scheme
        u(i+1,j)=u(i,j)-a*lambda/2*(u(i,j+1)-u(i,j-1));
    end
    %     u(i+1,1)=0; % boundary, at x=-1.
    u(i+1,1)=-sin(1+x(j)); % boundary, at x=-1, exercise 2.3.2 (b).
    u(i+1,m)=u(i+1,m-1); % boundary, at x=3
    u(:,1)=u(:,m); % periodic condition
end
