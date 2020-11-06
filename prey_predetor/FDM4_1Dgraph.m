% FDM_1Dgraph.m
global alpha

alpha=1/2; FDM2_parameters;
FDM2_1Dinitial
FDM3_1DKinetics_1
subplot(2,2,1)
plot(x,u(end,:),x,v(end,:),'--');
grid on
xlabel('(a)')
legend('prey','predator');

alpha=33/80; FDM2_parameters;
FDM2_1Dinitial
FDM3_1DKinetics_1
subplot(2,2,2)
plot(x,u(end,:),x,v(end,:),'--');
grid on
xlabel('(b)')
legend('prey','predator');

alpha=3/10; FDM2_parameters;
FDM2_1Dinitial
FDM3_1DKinetics_1
subplot(2,2,3)
plot(x,u(end,:),x,v(end,:),'--');
grid on
xlabel('(c)')
legend('prey','predator');

alpha=1/20; FDM2_parameters;
FDM2_1Dinitial
FDM3_1DKinetics_1
subplot(2,2,4)
plot(x,u(366,:),x,v(366,:),'--');
grid on
xlabel('(d)')
legend('prey','predator');