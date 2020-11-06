% Error computations mesh graph
figure(2)
subplot(2,3,1)
Err_1=abs(u_exact-u1); %FTFS
mesh(x,t,Err_1)
title('FTFS')
subplot(2,3,2)
Err_2=abs(u_exact-u2); %FTBS
mesh(x,t,Err_2)
title('FTBS')
subplot(2,3,3)
Err_3=abs(u_exact-u3); %FTCS
mesh(x,t,Err_3)
title('FTCS')
subplot(2,3,4)
Err_4=abs(u_exact-u4); %Leapfrog
mesh(x,t,Err_4)
title('Leapfrog')
subplot(2,3,5)
Err_5=abs(u_exact-u5); %Lax-Friedrichs
mesh(x,t,Err_5)
title('Lax-Friedrichs')
subplot(2,3,6)
mesh(x,t,u_exact)
title('One-way wave equation') % Exact solution