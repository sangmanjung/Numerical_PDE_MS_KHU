% FDM_2Dinitial_1
% This initial condition is adopted by fig.4 and fig.5
for j=1:m
    for k=1:l
        u(j,k,1)=u_s-2/10^7*(x(j)-0.1*y(k)-225)*(x(j)-0.1*y(k)-675);
        v(j,k,1)=v_s-3/10^5*(x(j)-450)-1.2/10^4*(y(k)-150);
    end
end