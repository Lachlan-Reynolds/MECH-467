close all;
clc;

partB=readtable("part_B_formatlab.csv");
theta=partB.Enc2_ActPos_mm__1_/20;
Vsig=partB.VSig_V__1_;


Ts=0.0005;                      %5ms
Jeq=3.5e-3;                    % Equivalent interia [kg.m^2]theta=partB.Enc2_ActPos_mm__1_/20;
Jpl=5.91e-4;                    % Prelab equivalent inertia
Kt=0.72;                        % Motor torque constant [N/A]
Sg=0.887;                       % Current Sensor gain [A/V]
Be=0.07025;
Td=0.235;

t=Ts:Ts:(length(Vsig)-1)*Ts;
theta(end)=[];
Vsig(end)=[];
[B,A]=butter(4,100*2*Ts);
theta=filtfilt(B,A,theta);
angVel=deriv(theta,Ts);
angAccel=deriv(angVel,Ts);

LHS=Sg*Kt*Vsig-Be*angVel-Td;
RHS1=Jpl*angAccel;

RHS2=Jeq*angAccel;

figure(1);
hold on;
grid on;
plot(t,Vsig);
plot(t,LHS);
plot(t,RHS1);
plot(t,RHS2);
title("Reliability of Inertial Estimate");
xlabel('Time [s]');
legend("Voltage Input", "LHS"," RHS, Prelab", "RHS, Jeq=3.5e-3 kgm^2");
