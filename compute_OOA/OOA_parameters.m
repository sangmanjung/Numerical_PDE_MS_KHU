%% Ch.3 Order of accuracy : parameters setting
% Let the speed of propagetion a is 1.
% Given PDE is the one-way wave equation.

% Define the Variables we need
a=1;
b=1;
global h
% mu=k/h^2;
%h=1/10; % step size of x, i.e. h=dx
lambda=0.9; % lambda=k/h
k=lambda*h; % k=dt
t=0:k:1.5; % initial value of t is 0.
x=0:h:1; % boundary value of u, u(t,-1)=0 & u(t,3)=0
n=length(t);
m=length(x);
u=zeros(n,m); % finite difference grid
u0=zeros(1,m); % initial frame of grid

% Initial-Boundary Problem Function u0

% initial 1
% for i=1:m
%  if (abs(x(i))<=1)
%      u0(i)= sin(2*pi*x(i)); % u(0,x)=u0(x)
%  else
%      u0(i)=0;
%  end
% end
% u(1,:)=u0; % Initial value setting

% initial 2
% for i=1:m % consider the grid axis for u(:,:)
%     if (abs(x(i))<=1/2)
%         u0(i)=1-2*abs(x(i));
%     else
%         u0(i)=0;
%     end
% end
% u(1,:)=u0; % Initial value setting

% % initial 3
% for i=1:m
%  if (abs(x(i))<=1/2)
%      u0(i)= cos(pi*x(i))^2; % u(0,x)=u0(x)
%  else
%      u0(i)=0;
%  end
% end
% u(1,:)=u0; % Initial value setting

% initial 4
% for i=1:m
%  if (abs(x(i))<=1)
%      u0(i)= 1-abs(x(i)); % u(0,x)=u0(x)
%  else
%      u0(i)=0;
%  end
% end
% u(1,:)=u0; % Initial value setting

% initial 5
% for i=1:m % consider the grid axis for u(:,:)
%         % exact sol : u(t,x)=u(x-at), a=1. Thus x(i)-t(j).
%             u0(i)=sin(x(i));
% end
% u(1,:)=u0; % Initial value setting

% initial 6
for i=1:m % consider the grid axis for u(:,:)
        % exact sol : u(t,x)=u(x-at), a=1. Thus x(i)-t(j).
            u0(i)=sin(2*pi*x(i));
end
u(1,:)=u0; % Initial value setting