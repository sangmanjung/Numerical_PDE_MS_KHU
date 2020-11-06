%% Ch.3 Order of accuracy : subplot of 2-dimensional graph

% the graph of (x,u) plane for each time t>=0.
plot(x,u_exact(25,:),'k','LineWidth',2.2);
hold on
plot(x,u2(25,:),'-o');
plot(x,u3(50,:),'-s');
plot(x,u4(25,:),'r-*');
plot(x,u5(25,:),'m-x');
hold off
xlim([0.1 1.8])
ylim([-0.3 1.2])
xlabel('x-axis','FontSize',14)
ylabel('u-axis','FontSize',14)
legend('Exact','FTBS','FTCS','Leapfrog','Lax-Friedrichs')
title({'Finite Difference Schemes, lambda=0.8, h=1/10';
    ['time --> ',num2str(t(25))]});
grid on

