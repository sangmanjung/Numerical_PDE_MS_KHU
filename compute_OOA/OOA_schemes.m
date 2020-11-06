%% Ch.3 Order of accuracy : finite difference schemes
clc
k=input('Enter one of the schemes : 1(FTFS),2(FTBS),3(LeapFrog),4(Lax-F),5(Lax-W),6(FTCS)');
for i=2:n-1
    for j=2:m-1
        switch k
            case 1
                % Forward-time forward-space scheme
                 u(i+1,j)=u(i,j)-a*lambda*(u(i,j+1)-u(i,j));
            case 2
                % Forward-time backward-space scheme
                 u(i+1,j)=u(i,j)-a*lambda*(u(i,j)-u(i,j-1));
            case 3
                 % Leapfrog scheme
                 u(i+1,j)=u(i-1,j)-a*lambda*(u(i,j+1)-u(i,j-1));
            case 4
                 % Lax-Friedrichs scheme
                 u(i+1,j)=0.5*(u(i,j+1)+u(i,j-1))-0.5*a*lambda*(u(i,j+1)-u(i,j-1));
            case 5
                % Lax-Wendroff scheme
                u(i+1,j)=u(i,j)-a*lambda/2*(u(i,j+1)-u(i,j-1))+a^2*lambda^2/2*(u(i,j+1)-2*u(i,j)+u(i,j-1));
            case 6
                 % Forward-time central-space scheme
                 u(i+1,j)=u(i,j)-a*lambda/2*(u(i,j)-u(i,j-1));
            otherwise
                disp('You must put one of the number 1, 2, 3, 4, 5 and 6.')
        end
    end
%       u(i+1,1)=0; % boundary, at x=-1.
%       u(i+1,m)=u(i+1,m-1); % boundary, at x=1
      u(:,1)=u(:,m); % periodic condition
end
