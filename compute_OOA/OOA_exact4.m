%% Ch.3 Order of accuracy : exact solution 4 of the equation.
clc
for i=1:n % consider the grid axis for u(:,:)
    for j=1:m % consider the grid axis for u(:,:)
        % exact sol : u(t,x)=u(x-at), a=1. Thus x(i)-t(j).
        if (abs(x(j)-a*t(i))<=1)
            u(i,j)=1-abs(x(j)-a*t(i));
        else
            u(i,j)=0;
        end
    end
end