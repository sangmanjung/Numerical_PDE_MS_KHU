clear all, clc

% parameters
mu=1; sigma=1; Pa=1.9; Pb=2; Pc=3.3; Pd=1.3; Pe=0.7;

% system of ODE
[t,y]=ode45(@ERPSsys,[0 500],[0.2 0.2 0.2 0.2 0.2],[],mu,sigma,Pa,Pb,Pc,Pd,Pe);

% graph
figure(3)
set(gcf, 'Position',  [400, 50, 620, 720])
subplot(5,1,1)
plot(t,y(:,1),'r','LineWidth',2)
xlabel('Time')
ylabel('a,b,c,d,e')
ylim([0 0.4])
xlim([0 500])
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

Pc=5.65;
[t,y]=ode45(@ERPSsys,[0 500],[0.2 0.2 0.2 0.2 0.2],[],mu,sigma,Pa,Pb,Pc,Pd,Pe);
subplot(5,1,2)
plot(t,y(:,1),'r','LineWidth',2)
xlabel('Time')
ylabel('a,b,c,d,e')
ylim([0 0.4])
xlim([0 500])
grid on
hold on
plot(t,y(:,2),'g','LineWidth',2)
plot(t,y(:,3),'b','LineWidth',2)
plot(t,y(:,4),'y','LineWidth',2)
plot(t,y(:,5),'m','LineWidth',2)
hold off

Pc=6.5;
[t,y]=ode45(@ERPSsys,[0 100],[0.2 0.2 0.2 0.2 0.2],[],mu,sigma,Pa,Pb,Pc,Pd,Pe);
subplot(5,1,3)
plot(t,y(:,1),'r','LineWidth',2)
xlabel('Time')
ylabel('a,b,c,d,e')
ylim([0 0.4])
xlim([0 100])
grid on
hold on
plot(t,y(:,2),'g','LineWidth',2)
plot(t,y(:,3),'b','LineWidth',2)
plot(t,y(:,4),'y','LineWidth',2)
plot(t,y(:,5),'m','LineWidth',2)
hold off

Pc=100;
[t,y]=ode45(@ERPSsys,[0 100],[0.2 0.2 0.2 0.2 0.2],[],mu,sigma,Pa,Pb,Pc,Pd,Pe);
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

Pc=100; Pd=0.01;
[t,y]=ode45(@ERPSsys,[0 200],[0.2 0.2 0.2 0.2 0.2],[],mu,sigma,Pa,Pb,Pc,Pd,Pe);
subplot(5,1,5)
plot(t,y(:,1),'r','LineWidth',2)
xlabel('Time')
ylabel('a,b,c,d,e')
ylim([0 1])
xlim([0 200])
grid on
hold on
plot(t,y(:,2),'g','LineWidth',2)
plot(t,y(:,3),'b','LineWidth',2)
plot(t,y(:,4),'y','LineWidth',2)
plot(t,y(:,5),'m','LineWidth',2)
hold off


