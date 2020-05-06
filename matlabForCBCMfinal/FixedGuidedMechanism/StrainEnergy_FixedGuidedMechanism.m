clear all
tic
global t1 t2 t3 t4 t5 t6 L1 L2 L3 theta1 E1 E2 E3 E4 E5 E6 I1 I2 I3 I4 I5 I6 L delt_y
syms k r x
mu=0.33;
L1=70e-3/3;
L2=70e-3/3;
L3=70e-3/3;
L=L1+L2+L3;
theta1=5.5*pi/180;
theta2=5.5*pi/180;
theta3=5.5*pi/180;
t1=1.5e-3;
t2=1.5e-3;
t3=1.5e-3;
t4=1.5e-3;
t5=1.5e-3;
t6=1.5e-3;
E1=1.379e9;
H=12.55e-3;
I1=(t1)^3*H/12;
E2=1.379e9;
I2=(t2)^3*H/12;
E3=1.379e9;
I3=(t3)^3*H/12;
E4=1.379e9;
I4=(t4)^3*H/12;
E5=1.379e9;
I5=(t5)^3*H/12;
E6=1.379e9;
I6=(t5)^3*H/12;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
jj=1;
for delt_y=0e-3:3e-4:12e-3
xx0=rand(18,1);
opt=optimset('Display','off','MaxFunEvals',1e20,'MaxIter',1e20,'TolFun',1e-20,'TolX',1e-20);   % Option to display output
[r1,fval,exitflag,output,jacobian]=fsolve(@fsolvefuncl_3,xx0,opt);
kkkk(:,jj)=r1;
jj=jj+1;
end

StrainEnergy=Energy_FixedGuidedMechanism(kkkk);

figure(1)
delt_y=0e-3:3e-4:12e-3;
plot(delt_y,StrainEnergy*E1*I1/L1,'-r')
xlabel('\delta')
ylabel('Strain Energy V_T')
title('Strain energy in the fixed-guided mechanism')
