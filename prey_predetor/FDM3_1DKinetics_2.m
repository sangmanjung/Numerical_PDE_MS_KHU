% FDM_Kinetics_2
% finite difference scheme : explicit FTCS
for i=1:n-1
    for j=2:m-1
        % zero(no) flux boundary conditions
        u(i,1)=u(i,3); u(i,m)=u(i,m-2);
        v(i,1)=v(i,3); v(i,m)=v(i,m-2);
        
        % Kinetics (ii)
        u(i+1,j)=u(i,j)+dt*(u(i,j-1)-2*u(i,j)+u(i,j+1))/h^2+dt*u(i,j)*(1-u(i,j))-dt*v(i,j)*(1-exp(-gamma*u(i,j)));
        v(i+1,j)=v(i,j)+dt*delta*(v(i,j-1)-2*v(i,j)+v(i,j+1))/h^2+dt*beta*v(i,j)*(alpha-1-alpha*exp(-gamma*u(i,j)));
    end
end