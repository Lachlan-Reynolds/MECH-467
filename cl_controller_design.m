function [Gcl, LLI_cl]=cl_controller_design(G, p1, crossover_hz, PM)

Gol=G;
Gcl=feedback(Gol,1);

% Lead Lag 
crossover_freq=crossover_hz*2*pi;

[C,~, ~, ~]=lead_lag_controller(Gol, crossover_freq, PM,p1);

% Cascaded Integrator
Ki=crossover_freq/10;
num_I=[1 Ki];
den_I=[1 0];
I=tf(num_I, den_I);

%LBW
LLI_cl=feedback(C*I*G,1);


