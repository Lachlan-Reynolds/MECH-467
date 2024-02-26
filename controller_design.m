function [K_lo, mag_lo, phase_lo, K_hi, mag_hi, phase_hi]=controller_design(axis, J, B, Ke, Kt, Ka, crossover_hz_lo, crossover_hz_hi, PM)

if axis=='x'
    fullTitle1="Open Loop X-axis Transfer Function Bode Plot";
    % fullTitle2="X-axis Machine with Unity Gain LLC";
    % fullTitle3="X-axis Machine with Required Gain LLC";


elseif axis=='y'
    fullTitle1="Open Loop Y-axis Transfer Function Bode Plot with ";
    % % fullTitle2="Y-axis Machine with Unity Gain LLC";
    % % fullTitle3="Y-axis Machine with Required Gain LLC";


end

figure()
Gol=tf([0 0 Ka*Kt*Ke],[J B 0]);
bode(Gol)
title(fullTitle1);
grid on;
xlim([1 1e3]);
hold on;
p1=B/J;

% Lead Lag 
crossover_freq=crossover_hz_lo*2*pi;

[C_lo,K_lo, mag_lo, phase_lo]=lead_lag_controller(Gol, crossover_freq, PM,p1);
crossover_freq=crossover_hz_hi*2*pi;

[C_hi, K_hi, mag_hi, phase_hi]=lead_lag_controller(Gol, crossover_freq, PM,p1);


% Cascaded Integrator
Ki=crossover_freq/10;
num_I=[1 Ki];
den_I=[1 0];
I=tf(num_I, den_I);

%LBW
LLI_lo=C_lo*I;
bode(LLI_lo)
hold on;

%HBW
LLI_hi=C_hi*I;
bode(LLI_hi)
hold on;

legend("Open Loop", "LLC LBW", "LLC HBW", "LLI LBW", "LLI HBW");

hold off;
