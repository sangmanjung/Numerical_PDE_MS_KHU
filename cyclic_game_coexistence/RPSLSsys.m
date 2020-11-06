function dudt=RPSLSsys(t,u,mu,sigma,Pa,Pb,Pc,Pd,Pe)

dudt=[u(1)*(mu*(1-(u(1)+u(2)+u(3)+u(4)+u(5)))-sigma*u(5)-sigma*u(3)-Pa/2*u(1));
    u(2)*(mu*(1-(u(1)+u(2)+u(3)+u(4)+u(5)))-sigma*u(1)-sigma*u(4)-Pb/2*u(2));
    u(3)*(mu*(1-(u(1)+u(2)+u(3)+u(4)+u(5)))-sigma*u(2)-sigma*u(5)-Pc/2*u(3));
    u(4)*(mu*(1-(u(1)+u(2)+u(3)+u(4)+u(5)))-sigma*u(3)-sigma*u(1)-Pd/2*u(4));
    u(5)*(mu*(1-(u(1)+u(2)+u(3)+u(4)+u(5)))-sigma*u(4)-sigma*u(2)-Pe/2*u(5))];