% FDM_2Dinitial_2
% This initial condition is adopted by fig.6
for j=1:m
    for k=1:l;
        u(j,k,1)=u_s-2/10^7*(x(j)-180)*(x(j)-720)-6/10^7*(y(k)-90)*(y(k)-210);
        v(j,k,1)=v_s-3/10^5*(x(j)-450)-6/10^5*(y(k)-135);
    end
end