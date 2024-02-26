function [C, K, mag, phase, alpha, T]=ol_lead_lag_controller(G, crossover, PM, p1)

crossover_freq=crossover;
desired_PM=PM;

phi_m=180*(-pi/2-atan(crossover_freq/p1))/pi;
phase_to_add=desired_PM-(180+phi_m);
phase_to_add=phase_to_add*pi/180;           %in rad now

alpha=(1+sin(phase_to_add))/(1-sin((phase_to_add)));

T=1/(crossover_freq*sqrt(alpha));

K=1; %initially set to 1

%determine transfer
num_LL=K*[alpha*T 1];
den_LL=[T 1];
C=tf(num_LL, den_LL);                           
[mag, ~]=bode(C*G, crossover_freq);
K=1/mag; %determine K

%re do transfer func with new K
num_LL=K*[alpha*T 1];
den_LL=[T 1];
C=tf(num_LL, den_LL);                           
[mag, phase]=bode(C*G, crossover_freq);


