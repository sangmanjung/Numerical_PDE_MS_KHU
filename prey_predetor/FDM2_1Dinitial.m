% FDM_initial1D.m
% initial conditions
for j=1:m
    u(1,j)=u_s-1e-8*(x(j)-1200)*(x(j)-2800);
    v(1,j)=v_s;
end