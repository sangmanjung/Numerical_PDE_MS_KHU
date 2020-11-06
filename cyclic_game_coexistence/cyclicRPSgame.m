clear all, clc

% parameters
mu=1; sigma=1; Pa=2.5; Pb=1; Pc=0.5;

% system of ODE
[t,y]=ode45(@RPSsys,[0 200],[0.35 0.35 0.35],[],mu,sigma,Pa,Pb,Pc);

% graph
% for i=1:269
%     figure(1)
%     plot(t(i),y(i,1),'r.','Markersize',13)
%     xlim([0 200])
%     ylim([0 0.6])
%     grid on
%     hold on
%     plot(t(i),y(i,2),'b.','Markersize',13)
%     plot(t(i),y(i,3),'y.','Markersize',13)
%     legend('Species A','Species B','Species C')
%     pause(0.1)
% end

figure(2)
set(gcf, 'Position',  [200, 400, 1200, 280])
subplot(1,3,1)
plot(t,y(:,1),'r','LineWidth',2)
xlabel('Time')
ylabel('a,b,c')
ylim([0 0.6])
grid on
hold on
plot(t,y(:,2),'b','LineWidth',2)
plot(t,y(:,3),'y','LineWidth',2)
legend('Species A','Species B','Species C');

Pa=5.2; Pb=1; Pc=0.5;
[t,y]=ode45(@RPSsys,[0 100],[0.35 0.35 0.35],[],mu,sigma,Pa,Pb,Pc);
subplot(1,3,2)
plot(t,y(:,1),'r','LineWidth',2)
xlabel('Time')
ylabel('a,b,c')
ylim([0 0.6])
grid on
hold on
plot(t,y(:,2),'b','LineWidth',2)
plot(t,y(:,3),'y','LineWidth',2)

Pa=100; Pb=1; Pc=0.5;
[t,y]=ode45(@RPSsys,[0 20],[0.35 0.35 0.35],[],mu,sigma,Pa,Pb,Pc);
subplot(1,3,3)
plot(t,y(:,1),'r','LineWidth',2)
xlabel('Time')
ylabel('a,b,c')
ylim([0 0.8])
grid on
hold on
plot(t,y(:,2),'b','LineWidth',2)
plot(t,y(:,3),'y','LineWidth',2)

hold off



