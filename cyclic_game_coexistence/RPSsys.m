function du=RPSsys(t,u,mu,sigma,Pa,Pb,Pc)

du=[u(1)*(mu*(1-(u(1)+u(2)+u(3)))-sigma*u(3)-Pa/2*u(1));
    u(2)*(mu*(1-(u(1)+u(2)+u(3)))-sigma*u(1)-Pb/2*u(2));
    u(3)*(mu*(1-(u(1)+u(2)+u(3)))-sigma*u(2)-Pc/2*u(3))];
