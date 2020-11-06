clc
clear 
close all
method=1;
a=1;
h_vec=[1/10 1/20 1/40 1/80 1/160];
Nh=length(h_vec);
error=zeros(Nh,4);
for hsize=1:Nh
    h=h_vec(hsize);
    lambda=0.9;
    Ft=5.4; % final time
    k=h*lambda;
    x=-1:h:1;
    t=0:k:Ft;
    Nx=length(x);
    Nt=length(t);
    
    %initial condition
    u0=zeros(1,Nx);
    for i=1:Nx
        if x(i)>=-1 && x(i)<=1
            u0(i)=1-sin(2*pi*x(i));
        end
    end
    
    u_ex=zeros(Nt,Nx);
    for j=1:Nt
        for i=1:Nx
            u_ex(j,i)=1-sin(2*pi*(x(i)-a*t(j)));
        end
    end

    u2=zeros(Nt,Nx); % forward-time backward-space
    u4=zeros(Nt,Nx); % leapfrog
    
    u2(1,:)=u0(:);
    u4(1,:)=u0(:);
    for j=1:Nt-1 % forward-time backward-space
        for i=1:Nx
            if i==1
                u2(j+1,i)=u2(j,i)-a*lambda*(u2(j,i)-u2(j,Nx-1));
            else
                u2(j+1,i)=u2(j,i)-a*lambda*(u2(j,i)-u2(j,i-1));
            end
        end
    end
    
    for j=1:Nt-1 % leapfrog
        for i=1:Nx
            if j==1
                if i==1 % first time step for leapfrog (FTCS)
                    u4(j+1,i)=u4(j,i)-1/2*a*lambda*(u4(j,i+1)-u4(j,Nx-1));
                elseif i==Nx
                    u4(j+1,i)=u4(j,i)-1/2*a*lambda*(u4(j,2)-u4(j,i-1));
                else
                    u4(j+1,i)=u4(j,i)-1/2*a*lambda*(u4(j,i+1)-u4(j,i-1));
                end
            else
                if i==1
                    u4(j+1,i)=u4(j-1,i)-a*lambda*(u4(j,i+1)-u4(j,Nx-1));
                elseif i==Nx
                    u4(j+1,i)=u4(j-1,i)-a*lambda*(u4(j,2)-u4(j,i-1));
                else
                    u4(j+1,i)=u4(j-1,i)-a*lambda*(u4(j,i+1)-u4(j,i-1));
                end
            end
        end
    end
    error(hsize,1)=sqrt(h*sum((u2(end,:)-u_ex(end,:)).^2));
    error(hsize,3)=sqrt(h*sum((u4(end,:)-u_ex(end,:)).^2));
     if hsize~=1
         error(hsize,2)=log(error(hsize-1,1)/error(hsize,1))/log(2);
         error(hsize,4)=log(error(hsize-1,3)/error(hsize,3))/log(2);
     end
end

%% error table
h_string={'1/10 ', '1/20 ','1/40 ','1/80 ','1/160'};

fprintf('-------------------------------------------------------\n')
fprintf('        | Forward t bacward x  |   Leapfrog scheme    |\n')
fprintf('-------------------------------------------------------\n')
fprintf('    h   |    Error   |  Order  |    Error   |  Order  |\n')
fprintf('-------------------------------------------------------\n')
for i=1:Nh
    if i==1
        fprintf(' %s  | %1.3e  |         | %1.3e  |         |\n',...
            h_string{i},error(i,1),error(i,3));
    else
        fprintf(' %s  | %1.3e  | %1.3f   | %1.3e  | %1.3f   |\n',...
           h_string{i},error(i,1),error(i,2),error(i,3),error(i,4));
    end
end
fprintf('-------------------------------------------------------\n')

