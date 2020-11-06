%% Stability region for the schemes

clc

% Set the functions g & the variables
g1=@(x) cos(x)-sqrt(-1)*a*lambda*sin(x); % Lax
g2=@(x) 1-1/2*a*lambda*(cos(x)+sqrt(-1)*sin(x)-1); % FTCS
g3=@(x) 1-a*lambda+a*lambda*cos(x)-sqrt(-1)*a*lambda*sin(x); % FTBS
x=-1:0.1:7;
a=1;
lambda=0.8;

% the norm of g2(pi/2)
norm(g2(pi/2))

% Graph of the Von neumann stability region (amplication factor). 
unit=cos(x)+sqrt(-1)*sin(x);
plot(real(unit),imag(unit),'k','LineWidth',1.8)
xlabel('Real part of g')
ylabel('Imaginary part of g')
grid on
xlim([-1.2 2])
ylim([-1.2 1.2])
hold on
plot(real(g1(x)),imag(g1(x)),'r','LineWidth',1.2)
plot(real(g2(x)),imag(g2(x)),'b','LineWidth',1.2)
plot(real(g3(x)),imag(g3(x)),'m','LineWidth',1.2)
legend('Unit circle','Lax-Friedrichs','FTCS','FTBS')