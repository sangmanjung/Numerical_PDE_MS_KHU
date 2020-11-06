%% Ch.3 Order of accuracy : exact solution 5 of the equation.
clc
for i=1:n % consider the grid axis for u(:,:)
    for j=1:m % consider the grid axis for u(:,:)
        % exact sol : u(t,x)=u(x-at), a=1. Thus x(i)-t(j).
            u(i,j)=sin(x(j)-a*t(i));
    end
end