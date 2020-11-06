%% FDS for Reaction-Diffusion Equations
% Finite-Difference Schemes for Reaction?Diffusion Equations
% Modeling Predator?Prey Interactions in MATLAB

% Model :
% du/dt = del(u)+u*(1-u)-v*h(a*u)
% dv/dt = delta*del(v)+b*v*h(a*u)-c*v

% h(:) is functional response
% a,b,c and delta are strictly positive

% h(:) is :
% (i) : h1(x) = x/(1+x), a=1/alpha, b=beta, c=gamma
% (ii) : h2(x) = 1-exp(-x), a=gamma, c=beta, b=alpha*beta

% Thus, we covered this by
% du/dt = del(u)+f(u,v)
% dv/dt = delta*del(v)+g(u,v)

% (i) :
% f(u,v) = u*(1-u)-u*v/(u+alpha)
% g(u,v) = beta*(u*v)/(u+alpha)-gamma*v

% (ii) :
% f(u,v) = u(1-u)-v*(1-exp(-gamma*u))
% g(u,v) = beta*v*(alpha-1-alpha*exp(-gamma*u))

%% One Dimensional Finite Difference Scheme
close all, clear all, clc
% finite difference grid
h=1; dt=1/10; T=600;
t=0:dt:T; x=0:h:4000;
n=length(t); m=length(x);
u=zeros(n,m);  v=zeros(n,m);

% set the parameters & simulations
global alpha beta gamma delta
alpha=33/80; beta=2; gamma=4/5; delta=1; % initial setting
figure(1)
FDM4_1Dgraph

%% Two Dimensional Finite Difference Scheme
close all, clear all, clc
   
% finite difference grid
h=1; T=100; dt=1/5;
t=0:dt:T; x=0:h:400; y=0:h:400;
m=length(x); l=length(y); n=length(t);
u=zeros(m,l,n);v=zeros(m,l,n);

% set the parameters
alpha=0.4; beta=2; gamma=0.6; delta=1; % case 1,2, and 3
% alpha=1.5; beta=1; gamma=5; delta=1; % case 4
FDM2_parameters

% random initial condition
% u(:,:,1)=rand(m,l); v(:,:,1)=rand(m,l);

% initial conditions
FDM5_2Dinitial_1 % case 1 and 2
% FDM5_2Dinitial_2 % case 3
% FDM5_2Dinitial_3 % case 4

% Finite Difference Scheme using FTCS
FDM6_2Dkinetics_1
% FDM6_2Dkinetics_2

% simulations
FDM7_2Dgraph_prey
% FDM7_2Dgraph_predator

clc
