clear all, clc

% parameters
mu=1; sigma=1; Pa=0.3; Pb=1.1; Pc=2.5; Pd=0.7; Pe=2.2;

% system of ODE
[t,y]=ode45(@RPSLSsys,[0 300],[0.2 0.2 0.2 0.2 0.2],[],mu,sigma,Pa,Pb,Pc,Pd,Pe);

% graph
figure(4)
set(gcf, 'Position',  [450, 50, 620, 720])
subplot(5,1,1)
plot(t,y(:,1),'r','LineWidth',2)
xlabel('Time')
ylabel('a,b,c,d,e')
ylim([0 0.4])
xlim([0 300])
grid on
hold on
plot(t,y(:,2),'g','LineWidth',2)
plot(t,y(:,3),'b','LineWidth',2)
plot(t,y(:,4),'y','LineWidth',2)
plot(t,y(:,5),'m','LineWidth',2)
lgd=legend('Species A','Species B','Species C','Species D','Species E');
set(lgd,'Orientation','horizontal',...
    'Position',[0.331432653594351 0.949820402298848 0.375317666127691 0.0377155172413793])
hold off

Pe=3.3;
[t,y]=ode45(@RPSLSsys,[0 200],[0.2 0.2 0.2 0.2 0.2],[],mu,sigma,Pa,Pb,Pc,Pd,Pe);
subplot(5,1,2)
plot(t,y(:,1),'r','LineWidth',2)
xlabel('Time')
ylabel('a,b,c,d,e')
ylim([0 0.6])
xlim([0 200])
grid on
hold on
plot(t,y(:,2),'g','LineWidth',2)
plot(t,y(:,3),'b','LineWidth',2)
plot(t,y(:,4),'y','LineWidth',2)
plot(t,y(:,5),'m','LineWidth',2)
hold off

Pe=9.3;
[t,y]=ode45(@RPSLSsys,[0 100],[0.2 0.2 0.2 0.2 0.2],[],mu,sigma,Pa,Pb,Pc,Pd,Pe);
subplot(5,1,3)
plot(t,y(:,1),'r','LineWidth',2)
xlabel('Time')
ylabel('a,b,c,d,e')
ylim([0 0.6])
xlim([0 100])
grid on
hold on
plot(t,y(:,2),'g','LineWidth',2)
plot(t,y(:,3),'b','LineWidth',2)
plot(t,y(:,4),'y','LineWidth',2)
plot(t,y(:,5),'m','LineWidth',2)
hold off

Pe=100;
[t,y]=ode45(@RPSLSsys,[0 100],[0.2 0.2 0.2 0.2 0.2],[],mu,sigma,Pa,Pb,Pc,Pd,Pe);
subplot(5,1,4)
plot(t,y(:,1),'r','LineWidth',2)
xlabel('Time')
ylabel('a,b,c,d,e')
ylim([0 0.6])
xlim([0 100])
grid on
hold on
plot(t,y(:,2),'g','LineWidth',2)
plot(t,y(:,3),'b','LineWidth',2)
plot(t,y(:,4),'y','LineWidth',2)
plot(t,y(:,5),'m','LineWidth',2)
hold off

Pe=100; Pa=0.01;
[t,y]=ode45(@RPSLSsys,[0 100],[0.2 0.2 0.2 0.2 0.2],[],mu,sigma,Pa,Pb,Pc,Pd,Pe);
subplot(5,1,5)
plot(t,y(:,1),'r','LineWidth',2)
xlabel('Time')
ylabel('a,b,c,d,e')
ylim([0 1])
xlim([0 100])
grid on
hold on
plot(t,y(:,2),'g','LineWidth',2)
plot(t,y(:,3),'b','LineWidth',2)
plot(t,y(:,4),'y','LineWidth',2)
plot(t,y(:,5),'m','LineWidth',2)
hold off


