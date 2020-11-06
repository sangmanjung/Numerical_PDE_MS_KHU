%% Ch.3 Order of accuracy : fundamentals
clc, clear

% parameters setting
global h
% Given h is 1/10, 1/20, 1/40, 1/80, 1/160.
h=1/50; % determine the step size
OOA_parameters
 
% load the approximations of FDS
OOA_FTFS
u1=u;
OOA_FTBS
u2=u;
OOA_FTCS
u3=u;
OOA_Leapfrog
u4=u;
OOA_LaxFriedrichs
u5=u;
OOA_LaxWendroff
u6=u;

% load the exact solution
OOA_exact6
u_exact=u;

%% Ch.3 Order of accuracy : Calculate the error

% norm of h equals to sqrt(h*sum(abs(u_exact(t,:)-u_approx(t,:)).^2))
% Error_1=@(t,h) sqrt(h)*norm(u_exact(t,:)-u2(t,:),2);
% Error_2=@(t,h) sqrt(h)*norm(u_exact(t,:)-u4(t,:),2);
% Error_3=@(t,h) sqrt(h)*norm(u_exact(t,:)-u6(t,:),2);
% Error_4=@(t,h) sqrt(h)*norm(u_exact(t,:)-u5(t,:),2);
 
% Error_FTCS=@(t,h) sqrt(h)*norm(u_exact(t,:)-u3(t,:),2); 

% find the time = 5.4
% temp=find(t < 3.3);
% t_index=temp(length(temp))+1;
 
% test
% FTBS_error=Error_1(t_index,h)
% Leapfrog_error=Error_2(t_index,h)
% Lax_Wendroff_error=Error_3(t_index,h)
% Lax_Friedrichs_error=Error_4(t_index,h)

% Error_FTCS(t_index,h)

% 2-dimensional graph
% You must enter all of the number 1,2,3,4, 5 and 6 respectively.
% 1.FTFS, 2.FTBS, 3.FTCS, 4.Leapfrog, 5.Lax-Friedrichs, 6.Lax-Wendroff
OOA_choose_the_scheme

% mesh graph of the error
% OOA_meshgraph



