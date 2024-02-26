function [D_d, D_c]=controller_description(closedloop_axis_bandwidth_domain, G_axis_c, Ti)


RT=[0.1 0.9];

Gcl_c=closedloop_axis_bandwidth_domain;
%S Domain

S=stepinfo(Gcl_c, 'RiseTimeLimits', RT);
D_c.Overshoot=S.Overshoot;
D_c.Risetime=S.RiseTime;
D_c.Poles=pole(Gcl_c);
D_c.Zeros=zero(Gcl_c);
D_c.Bandwidth=bandwidth(Gcl_c);


%Zdomain

G_axis_d=c2d(G_axis_c, Ti, 'zoh');
LLI_bw_d = c2d(Gcl_c, Ti, 'tustin');
ol_x_lbw_d = minreal(LLI_bw_d * G_axis_d);
cl_x_lbw_d = feedback(ol_x_lbw_d, 1);


S=stepinfo(cl_x_lbw_d, 'RiseTimeLimits', RT);
D_d.Overshoot=S.Overshoot;
D_d.Risetime=S.RiseTime;
D_d.Poles=pole(cl_x_lbw_d);
D_d.Zeros=zero(cl_x_lbw_d);
D_d.Bandwidth=bandwidth(cl_x_lbw_d);
D_d.LTI=LLI_bw_d;
