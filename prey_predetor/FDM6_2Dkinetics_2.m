% FDM6_2Dkinetics_2
% finite difference scheme : explicit FTCS
for i=1:n-1
    for j=2:m-1
        for k=2:l-1
            
            % zero(no)-flux boundary conditions
            u(j,1,i)=u(j,3,i); u(j,l,i)=u(j,l-2,i);
            u(m,k,i)=u(m-2,k,i); u(1,k,i)=u(2,k,i);
            v(j,1,i)=v(j,3,i); v(j,l,i)=v(j,l-2,i);
            v(m,k,i)=v(m-2,k,i); v(1,k,i)=v(2,k,i);
            
            % corner boundary conditions
            u(2,1,i)=(u(2,2,i)+u(2,3,i))/2; u(1,2,i)=(u(2,2,i)+u(2,1,i))/2; % SW corner
            u(m-1,l,i)=(u(m-1,l-1,i)+u(m-1,l-2,i))/2; u(m,l-1,i)=(u(m-1,l-1,i)+u(m-2,l-1,i))/2; % NE corner
            u(m-1,1,i)=2*u(m-1,3,i)-u(m-1,2,i); u(m,2,i)=2*u(m-2,2,i)-u(m-1,2,i); % SE corner
            u(2,l,i)=2*u(2,l-2,i)-u(2,l-1,i); u(1,l-1,i)=2*u(3,l-1,i)-u(2,l-1,i); % NW corner
            
            v(2,1,i)=(v(2,2,i)+v(2,3,i))/2; v(1,2,i)=(v(2,2,i)+v(2,1,i))/2; % SW corner
            v(m-1,l,i)=(v(m-1,l-1,i)+v(m-1,l-2,i))/2; v(m,l-1,i)=(v(m-1,l-1,i)+v(m-2,l-1,i))/2; % NE corner
            v(m-1,1,i)=2*v(m-1,3,i)-v(m-1,2,i); v(m,2,i)=2*v(m-2,2,i)-v(m-1,2,i); % SE corner
            v(2,l,i)=2*v(2,l-2,i)-v(2,l-1,i); v(1,l-1,i)=2*v(3,l-1,i)-v(2,l-1,i); % NW corner
            
            % kinetics (ii)
            u(j,k,i+1)=u(j,k,i)+dt*(u(j-1,k,i)-2*u(j,k,i)+u(j+1,k,i))/h^2+dt*(u(j,k-1,i)-2*u(j,k,i)+u(j,k+1,i))/h^2+...
                dt*u(j,k,i)*(1-u(j,k,i))-dt*v(j,k,i)*(1-exp(-gamma*u(j,k,i)));
            v(j,k,i+1)=v(j,k,i)+dt*delta*(v(j-1,k,i)-2*v(j,k,i)+v(j+1,k,i))/h^2+dt*delta*(v(j,k-1,i)-2*v(j,k,i)+v(j,k+1,i))/h^2+...
                dt*beta*v(j,k,i)*(alpha-1-alpha*exp(-gamma*u(j,k,i)));

        end
    end
end