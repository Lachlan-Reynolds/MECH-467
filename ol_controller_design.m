function O=ol_controller_design(G, p1, crossover_hz, PM)

Gol=G;

% Lead Lag 
crossover_freq=crossover_hz*2*pi;
[C,K, mag, phase, alpha, T]=ol_lead_lag_controller(Gol, crossover_freq, PM,p1);

O.K=K;
O.Magnitude=mag;
O.Phase=phase;
O.Alpha=alpha;
O.T=T;

% Cascaded Integrator
Ki=crossover_freq/10;
num_I=[1 Ki];
den_I=[1 0];
I=tf(num_I, den_I);

LLI=C*I;
O.LLI=LLI;
