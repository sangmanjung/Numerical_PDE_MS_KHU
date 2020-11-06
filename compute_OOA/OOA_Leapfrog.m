%% Ch.3 Order of accuracy : Leapfrog scheme
clc

for j=2:m
    u(2,j)=u(1,j)-a*lambda/2*(u(1,j)-u(1,j-1));
end
for i=2:n-1
    for j=2:m-1
        % Leapfrog scheme
        u(i+1,j)=u(i-1,j)-a*lambda*(u(i,j+1)-u(i,j-1));
    end
%     u(i+1,1)=0; % boundary, at x=-1.
%     u(i+1,m)=u(i+1,m-1); % boundary, at x=1
    
    % (a)
%     u(i+1,1)=0; % boundary, at x=-1.
%     u(i+1,m)=2*u(i+1,m-1)-u(i+1,m-2); % boundary, at x=1
    
    % (b)
%     u(i+1,1)=0; % boundary, at x=-1.
%     u(i+1,m)=0; % boundary, at x=1
    
    % (c)
%     u(i+1,1)=2*u(i+1,m-1)-u(i+1,m-2); % boundary, at x=-1.
%     u(i+1,m)=u(i+1,m-1); % boundary, at x=1
    
    % (d)
    u(i+1,1)=0; % boundary, at x=-1.
    u(i+1,m)=u(i+1,m-1); % boundary, at x=1
    
 u(:,1)=u(:,m); % periodic condition
end
