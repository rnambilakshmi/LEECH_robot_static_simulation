clear all
global t1 t2 t3 t4 t5 t6 L1 L2 L3 L4 L5 L6 theta1 E1 E2 E3 E4 E5 E6 I6 I1 I2 I3 I4 I5 L LO beta beta0 t7 L7 E7 I7
syms k
mu=0.33;
L1=30e-3/7;
L2=30e-3/7;
L3=30e-3/7;
L4=30e-3/7;
L5=30e-3/7;
L6=30e-3/7;
L7=30e-3/7;
L=L1+L2+L3+L4+L5+L6+L7;
LO=2*L/3;
beta0=30*pi/180;
theta1=10*pi/180;
theta2=10*pi/180;
theta3=10*pi/180;
t1=1.2e-3;
t2=1.2e-3;
t3=1.2e-3;
t4=1.2e-3;
t5=1.2e-3;
t6=1.2e-3;
t7=1.2e-3;
E1=1.4e9;
H=6e-3;
I1=(t1)^3*H/12;
E2=1.4e9;
I2=(t2)^3*H/12;
E3=1.4e9;
I3=(t3)^3*H/12;
E4=1.4e9;
I4=(t4)^3*H/12;
E5=1.4e9;
I5=(t5)^3*H/12;
E6=1.4e9;
I6=(t6)^3*H/12;
E7=1.4e9;
I7=(t7)^3*H/12;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
jj=1;
for beta=beta0+0*pi/180:1*pi/180:beta0+60*pi/180
if jj==1
xx0=rand(42,1);
else xx0=kkkk(:,jj-1);
end
opt=optimset('Display','off','MaxFunEvals',1e20,'MaxIter',1e20,'TolFun',1e-20,'TolX',1e-20);   % Option to display output
[r1,fval,exitflag,output,jacobian]=fsolve(@fsolvefuncl_51,xx0,opt);
kkkk(:,jj)=r1;
jj=jj+1;
end
StrainEnergy=Energy_CircularGuidedMechanism(kkkk);
figure(1)
beta=30:90;
plot(beta,StrainEnergy*E1*I1/L1,'-.k')
xlabel('\beta')
ylabel('V_T')
title('Strain energy in circular-guided mechanism')
