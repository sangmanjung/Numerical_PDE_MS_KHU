%% Ch.3 Order of accuracy : exact solution 2 of the equation.
clc
for j=1:n % consider the grid axis for u(:,:)
    for i=1:m % consider the grid axis for u(:,:)
         % exact sol : u(t,x)=u(x-at), a=1. Thus x(i)-t(j).
        if (abs(x(i)-a*t(j))<=1/2)
            u(j,i)=1-2*abs(x(i)-a*t(j));
        else
            u(j,i)=0;
        end
    end
end