% FDM_2Dinitial_3
% This initial condition is adopted by fig.7
for j=1:m
    for k=1:l
        if  ((x(j)-200)^2+(y(k)-200)^2 < 400)
            u(j,k,1)=1;
            v(j,k,1)=0.2;
        else
            u(j,k,1)=0;
            v(j,k,1)=0;
        end
    end
end