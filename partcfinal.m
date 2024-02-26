
close all;
Vamp1=0.2;                          % Amplitude 0.2V
Vamp2=0.5;
Vamp3=0.9;

freq1=1;                            % Frequency 1Hz
freq2=2;
freq3=3;
freq4=4;
freq5=5;
freq6=6;
freq7=7;
freq8=8;
freq9=9;
freq10=10;
freq20=20;
freq30=30;
freq40=40;
freq50=50;
freq60=60;
freq70=70;


f1=readtable("C:\Users\Lachlan Reynolds\Desktop\MECH 467\Labs\G1\Part C\1.csv");
f2=readtable("C:\Users\Lachlan Reynolds\Desktop\MECH 467\Labs\G1\Part C\2.csv");
f3=readtable("C:\Users\Lachlan Reynolds\Desktop\MECH 467\Labs\G1\Part C\3.csv");
f4=readtable("C:\Users\Lachlan Reynolds\Desktop\MECH 467\Labs\G1\Part C\4.csv");
f5=readtable("C:\Users\Lachlan Reynolds\Desktop\MECH 467\Labs\G1\Part C\5.csv");
f6=readtable("C:\Users\Lachlan Reynolds\Desktop\MECH 467\Labs\G1\Part C\6.csv");
f7=readtable("C:\Users\Lachlan Reynolds\Desktop\MECH 467\Labs\G1\Part C\7.csv");
f8=readtable("C:\Users\Lachlan Reynolds\Desktop\MECH 467\Labs\G1\Part C\8.csv");
f9=readtable("C:\Users\Lachlan Reynolds\Desktop\MECH 467\Labs\G1\Part C\9.csv");
f10=readtable("C:\Users\Lachlan Reynolds\Desktop\MECH 467\Labs\G1\Part C\10.csv");
f20=readtable("C:\Users\Lachlan Reynolds\Desktop\MECH 467\Labs\G1\Part C\20.csv");
f30=readtable("C:\Users\Lachlan Reynolds\Desktop\MECH 467\Labs\G1\Part C\30.csv");
f40=readtable("C:\Users\Lachlan Reynolds\Desktop\MECH 467\Labs\G1\Part C\40.csv");
f50=readtable("C:\Users\Lachlan Reynolds\Desktop\MECH 467\Labs\G1\Part C\50.csv");
f60=readtable("C:\Users\Lachlan Reynolds\Desktop\MECH 467\Labs\G1\Part C\60.csv");
f70=readtable("C:\Users\Lachlan Reynolds\Desktop\MECH 467\Labs\G1\Part C\70.csv");



[MF1,P1]=getBode(f1,freq1,Vamp1,.5,1.5);
[MF2,P2]=getBode(f2,freq2,Vamp1,.5,1.5);
[MF3,P3]=getBode(f3,freq3,Vamp1,.5,1.5);
[MF4,P4]=getBode(f4,freq4,Vamp1,.5,1.5);
[MF5,P5]=getBode(f5,freq5,Vamp1,.5,1.5);
[MF6,P6]=getBode(f6,freq6,Vamp2,.5,1.5);
[MF7,P7]=getBode(f7,freq7,Vamp2,.5,1.5);
[MF8,P8]=getBode(f8,freq8,Vamp2,.5,1.5);
[MF9,P9]=getBode(f9,freq9,Vamp2);
[MF10,P10]=getBode(f10,freq10,Vamp2,1,1.5);
[MF20,P20]=getBode(f20,freq20,Vamp3,1,1.5);
[MF30,P30]=getBode(f30,freq30,Vamp3,1,1.5);
[MF40,P40]=getBode(f40,freq40,Vamp3,1,1.5);
[MF50,P50]=getBode(f50,freq50,Vamp3,1,1.5);
[MF60,P60]=getBode(f60,freq60,Vamp3,1,1.5);
[MF70,P70]=getBode(f70,freq70,Vamp3,1,2);
xlabel("Time [s]");
ylabel("Angular Velocity [rad/s]");
title("Angular Velocity and Signal over Time");
legend("Angular Velocity", "Voltage Sigal");

MF= [MF1 MF2 MF3 MF4 MF5 MF6 MF7 MF8 MF9 MF10 MF20 MF30 MF40 MF50 MF60 MF70]';
P=[P1 P2 P3 P4 P5 P6 P7 P8 P9 P10 P20 P30 P40 P50 P60 P70]';
P=P*-180/pi;
f=[1 2 3 4 5 6 7 8 9 10 20 30 40 50 60 70]';
omega=2*pi*f;


figure;
grid on;
semilogx(omega, MF);

figure;
grid on;
semilogx(omega, P);


