%% Ch.3 Order of accuracy : subplot of 2-dimensional graph

% the graph of (x,u) plane for each time t>=0.
subplot(1,3,1)
plot(x,u0,'b','LineWidth',2);
hold on
plot(x,u(1,:),'r-o');

ylim([-1.5 2])
xlabel('x-axis','FontSize',14)
ylabel('u-axis','FontSize',14)
legend('Initial','Approximation')
title({'Leapfrog, lambda=0.9, h=1/50';
    ['time --> ',num2str(t(1))]});
grid on
subplot(1,3,2)
plot(x,u0,'b','LineWidth',2);
hold on
plot(x,u(33,:),'r-o');

ylim([-1.5 2])
xlabel('x-axis','FontSize',14)
ylabel('u-axis','FontSize',14)
legend('Initial','Approximation')
title({'Leapfrog, lambda=0.9, h=1/50';
    ['time --> ',num2str(t(33))]});
grid on
subplot(1,3,3)
plot(x,u0,'b','LineWidth',2);
hold on
plot(x,u(70,:),'r-o');

ylim([-1.5 2])
xlabel('x-axis','FontSize',14)
ylabel('u-axis','FontSize',14)
legend('Initial','Approximation')
title({'Leapfrog, lambda=0.9, h=1/50';
    ['time --> ',num2str(t(70))]});
grid on

