% FDM_parameters.m
% calculate the parameters : alpha, beta, gamma
global alpha beta gamma

if (beta > gamma) && (alpha < (beta-gamma)/gamma)
    u_s=alpha*gamma/(beta-gamma);
    v_s=(1-u_s)*(u_s+alpha);
elseif (alpha>1) && (gamma > -log((alpha-1)/alpha))
    u_s=-log((alpha-1)/alpha)/gamma;
    v_s=u_s*(1-u_s)/(1-exp(-gamma*u_s));
else
    u_s=0; v_s=0;
    fprintf('\nPut into the currect value of the parameters\n')
end