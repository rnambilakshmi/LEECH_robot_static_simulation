clear all
global t1 t2 t3 t4 t5 t6 t7 t8 L1 L2 L3 L4 L5 L6 L7 L8 E1 E2 E3 E4 E5 E6 E7 E8  I1 I2 I3 I4 I5 I6 I7 I8 L Beta w1 w2
syms k r x
mu=0.33;
L1=60e-3/4;
L2=L1;
L3=L1;
L7=L1;
L4=L1;
L5=L1;
L6=L1;
L8=L1;
L=L1+L2+L3+L7;
N=4;
Beta=60*pi/180;
w1=2*L*sin(Beta)/(N+1);
w2=N*w1;
t1=1e-3;
t2=t1;
t3=t1;
t4=t1;
t5=t1;
t6=t1;
t7=t1;
t8=t1;
E1=1.4e9;
H=25.2e-3;
I1=(t1)^3*H/12;
E2=E1;
I2=I1;
E3=E1;
I3=I1;
E4=E1;
I4=I1;
E5=E1;
I5=I1;
E6=E1;
I6=I1;
E7=E1;
I7=I1;
E8=E1;
I8=I1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
jj=1;
for MM=0:0.005:0.15
Loads=[0;1;MM];
if jj==1
xx0=rand(55,1);
else xx0=kkkk(:,jj-1);
end
opt=optimset('Display','off','MaxFunEvals',1e20,'MaxIter',1e20,'TolFun',1e-20,'TolX',1e-20);   % Option to display output
[r1,fval,exitflag,output,jacobian]=fsolve(@fsolvefuncl_8c,xx0,opt,Loads);
kkkk(:,jj)=r1;
jj=jj+1;
end

EnergyCrossPivot=energy_CrossPivot(kkkk);

figure(1)
MM=0:0.005:0.15;
plot(MM,EnergyCrossPivot(1,:)*E1*I1/L1,'-.k')
hold on
plot(MM,EnergyCrossPivot(2,:)*E1*I1/L1,'-.r')
plot(MM,EnergyCrossPivot(1,:)*E1*I1/L1+EnergyCrossPivot(2,:)*E1*I1/L1,'b')
xlabel('M')
ylabel('Starin Energy V_T')
title('Stain Energy in cross axis flexural pivot')