clear all
tic
global t1 t2 t3 t4 t5 L1 L2 L3  E1 E2 E3 I1 I2 I3  L theta2 Lcq Lbc Lab Lad theta
syms k r x
mu=0.33;
L1=100e-3/3;
L2=100e-3/3;
L3=100e-3/3;
L=L1+L2+L3;
Lcq=L/20; 
Lbc=L;
Lab=(1-1/sqrt(2))*L;
Lad=Lcq+1/sqrt(2)*L;
%theta1=10*pi/180;
theta2=135*pi/180;
%theta3=10*pi/180;
t1=1.2e-3;
t2=1.2e-3;
t3=1.2e-3;
t4=1.2e-3;
t5=1.2e-3;
E1=7.17e10;
H=6e-3;
I1=(t1)^3*H/12;
E2=7.17e10;
I2=(t2)^3*H/12;
E3=7.17e10;
I3=(t3)^3*H/12;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
jj=1;
for theta=0:2*pi/36:2*pi
xx0=rand(19,1);
opt=optimset('Display','off','MaxFunEvals',1e20,'MaxIter',1e20,'TolFun',1e-20,'TolX',1e-20);   % Option to display output
[r1,fval,exitflag,output,jacobian]=fsolve(@fsolvefuncl_3p,xx0,opt);
kkkk(:,jj)=r1;
jj=jj+1;
end
theta=0:2*pi/36:2*pi;


figure(1)
plot(theta*180/pi,(kkkk(2,:).*cos(theta)-kkkk(3,:).*sin(theta))*E1*I1/L1^2*Lab,'-.k')
xlabel('\theta_1')
ylabel('T_i_n')
title('Force-displacement relationship of the partially compliant 4-bar mechanism')
toc