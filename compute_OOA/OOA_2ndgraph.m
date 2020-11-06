%% Ch.3 Order of accuracy : 2-dimensional graph

for i=1:n
    % the graph of (x,u) plane for each time t>=0.
    plot(x,u0,'b','LineWidth',2);
    hold on
    plot(x,u(i,:),'r-o');
    hold off
    ylim([-1.5 1.5])
    xlabel('x-axis','FontSize',14)
    ylabel('u-axis','FontSize',14)
    legend('Initial','Approximation')
    title({'The Finite Difference Scheme Approximation of PDE';
        ['time --> ',num2str(t(i))]});
    grid on
    %     F(i)=getframe;
    pause(0.01);
end

%  movie(F)
