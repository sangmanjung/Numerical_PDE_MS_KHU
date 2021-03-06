%% Cyclic game coexistence paper : RPS game on PDE
close all, clear all, clc

% parameters
N=100; % population size (total number of individual)
M=1/10^3; % individual mobility parameter
mu=1; sigma=1; Pa=2.5; Pb=1; Pc=0.5;

% finite difference grid
h=1; T=200; dt=1/5;
t=0:dt:T; x=0:h:N; y=0:h:N;
m=length(x); l=length(y); n=length(t);
a=zeros(m,l,n); b=zeros(m,l,n); c=zeros(m,l,n); % density of species

% initial condition
a(:,:,1)=rand(m,l); b(:,:,1)=rand(m,l); c(:,:,1)=rand(m,l);

% finite difference scheme (FTCS)
for i = 1:n-1
    for j = 2:m-1
        for k = 2:l-1
            
            % periodic boundary condition
            a(1,k,i)=a(2,k,i); a(j,1,i)=a(j,2,i); a(1,1,i)=a(2,2,i);
            b(1,k,i)=b(2,k,i); b(j,1,i)=b(j,2,i); b(1,1,i)=b(2,2,i);
            c(1,k,i)=c(2,k,i); c(j,1,i)=c(j,2,i); c(1,1,i)=c(2,2,i);
            
            a(m,k,i)=a(m-1,k,i); a(j,l,i)=a(j,l-1,i); a(m,l,i)=a(m-1,l-1,i);
            b(m,k,i)=b(m-1,k,i); b(j,l,i)=b(j,l-1,i); b(m,l,i)=b(m-1,l-1,i);
            c(m,k,i)=c(m-1,k,i); c(j,l,i)=c(j,l-1,i); c(m,l,i)=c(m-1,l-1,i);
            
            % species A, B, and C
            a(j,k,i+1)=a(j,k,i)+dt*M*((a(j+1,k,i)-2*a(j,k,i)+a(j-1,k,i))/h^2 + (a(j,k+1,i)-2*a(j,k,i)+a(j,k-1,i))/h^2)+...
                dt*mu*a(j,k,i)*(1-(a(j,k,i)+b(j,k,i)+c(j,k,i)))-dt*sigma*a(j,k,i)*c(j,k,i)-dt*Pa/2*a(j,k,i)*a(j,k,i);
            
            b(j,k,i+1)=b(j,k,i)+dt*M*((b(j+1,k,i)-2*b(j,k,i)+b(j-1,k,i))/h^2 + (b(j,k+1,i)-2*b(j,k,i)+b(j,k-1,i))/h^2)+...
                dt*mu*b(j,k,i)*(1-(a(j,k,i)+b(j,k,i)+c(j,k,i)))-dt*sigma*b(j,k,i)*a(j,k,i)-dt*Pb/2*b(j,k,i)*b(j,k,i);
            
            c(j,k,i+1)=c(j,k,i)+dt*M*((c(j+1,k,i)-2*c(j,k,i)+c(j-1,k,i))/h^2 + (c(j,k+1,i)-2*c(j,k,i)+c(j,k-1,i))/h^2)+...
                dt*mu*c(j,k,i)*(1-(a(j,k,i)+b(j,k,i)+c(j,k,i)))-dt*sigma*b(j,k,i)*c(j,k,i)-dt*Pc/2*c(j,k,i)*c(j,k,i);
        end
    end
end

% Spatial graph
% figure(1)
% for i=1:n-1
%     ga(:,:)=a(:,:,i);
%     gb(:,:)=b(:,:,i);
%     gc(:,:)=c(:,:,i);
%     subplot(1,3,1)
%     mesh(x,y,ga)
%     zlim([0 1])
%     zlabel('species A')
%     title(sprintf('Time step = %d',i))
%     subplot(1,3,2)
%     mesh(x,y,gb)
%     zlim([0 1])
%     zlabel('species B')
%     title(sprintf('Time step = %d',i))
%     subplot(1,3,3)
%     mesh(x,y,gc)
%     zlim([0 1])
%     zlabel('species C')
%     title(sprintf('Time step = %d',i))
%     colormap summer
%     drawnow
% end

% Line graph
figure(2)
va=sum(sum(a))/m^2; vb=sum(sum(b))/m^2; vc=sum(sum(c))/m^2;
vola(:)=va(1,1,:); volb(:)=vb(1,1,:); volc(:)=vc(1,1,:);
plot(t,vola,'r',t,volb,'b',t,volc,'y','LineWidth',2)
grid on
xlabel('Time')
ylabel('a,b,c')
legend('Species A','Species B','Species C');
ylim([0 0.6])

