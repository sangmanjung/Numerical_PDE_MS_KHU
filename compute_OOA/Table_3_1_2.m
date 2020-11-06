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
    x=-1:h:6;
    t=0:k:Ft;
    Nx=length(x);
    Nt=length(t);
    
    %initial condition
    u0=zeros(1,Nx);
    for i=1:Nx
        if x(i)>=-1/2 && x(i)<=1/2
            u0(i)=1-2*abs(x(i));
        end
    end
    
    u_ex=zeros(Nt,Nx);
    for j=1:Nt
        for i=1:Nx
            if x(i)>=-1/2+a*t(j) && x(i)<=1/2+a*t(j)
            u_ex(j,i)=1-2*abs(x(i)-a*t(j));
            end
        end
    end
    
    
    u2=zeros(Nt,Nx); % Lax-Wendroff
    u4=zeros(Nt,Nx); % Lax-Friderichs
    
    u2(1,:)=u0(:);
    u4(1,:)=u0(:);
    
    for j=1:Nt-1 
        for i=1:Nx
            if i==1
                u2(j+1,i)=u2(j,i)-a*lambda/2*(u2(j,i+1)-u2(j,Nx-1))+a^2*lambda^2/2*(u2(j,i+1)-2*u2(j,i)+u2(j,Nx-1));
                u4(j+1,i)=1/2*(u4(j,i+1)+u4(j,Nx-1))-1/2*a*lambda*(u4(j,i+1)-u4(j,Nx-1));
            elseif i==Nx
                u2(j+1,i)=u2(j,i)-a*lambda/2*(u2(j,2)-u2(j,i-1))+a^2*lambda^2/2*(u2(j,2)-2*u2(j,i)+u2(j,i-1));
                u4(j+1,i)=1/2*(u4(j,2)+u4(j,i-1))-1/2*a*lambda*(u4(j,2)-u4(j,i-1));
            else
                u2(j+1,i)=u2(j,i)-a*lambda/2*(u2(j,i+1)-u2(j,i-1))+a^2*lambda^2/2*(u2(j,i+1)-2*u2(j,i)+u2(j,i-1));
                u4(j+1,i)=1/2*(u4(j,i+1)+u4(j,i-1))-1/2*a*lambda*(u4(j,i+1)-u4(j,i-1));
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
fprintf('        |     Lax-Wendroff     |    Lax-Friedrichs    |\n')
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
