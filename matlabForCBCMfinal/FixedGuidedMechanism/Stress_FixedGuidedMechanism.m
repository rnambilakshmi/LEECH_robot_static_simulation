clear all
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for jjj=1:1:length(kkkk(1,:))
Forces=kkkk([1,2,3,7,8,9,13,14,15],jjj);
 M=Forces(1);
 F=Forces(2);
 P=Forces(3);
 M1=Forces(4);
 F1=Forces(5);
 P1=Forces(6);
 M2=Forces(7);
 F2=Forces(8);
 P2=Forces(9);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Load=[F M];
Load1=[F1 M1];
Load2=[F2 M2];

i=1;
for X=0:0.1:1
    if P<0
    p=sqrt(-P);
    Stress_1(i)=[(tan(p)*cos(p*X)-sin(p*X))/p cos(p*X)/cos(p)]*[F;M];
    else
    p=sqrt(P);    
    Stress_1(i)=[(tanh(p)*cosh(p*X)-sinh(p*X))/p cosh(p*X)/cosh(p)]*[F;M];
    end
    if P1<0
    p1=sqrt(-P1);
    Stress_2(i)=[(tan(p1)*cos(p1*X)-sin(p1*X))/p1 cos(p1*X)/cos(p1)]*[F1;M1];
    else
    p1=sqrt(P1);    
    Stress_2(i)=[(tanh(p1)*cosh(p1*X)-sinh(p1*X))/p1 cosh(p1*X)/cosh(p1)]*[F1;M1];
    end
   if P2<0
    p2=sqrt(-P2);
    Stress_3(i)=[(tan(p2)*cos(p2*X)-sin(p2*X))/p2 cos(p2*X)/cos(p2)]*[F2;M2];
    else
    p2=sqrt(P2);    
    Stress_3(i)=[(tanh(p2)*cosh(p2*X)-sinh(p2*X))/p2 cosh(p2*X)/cosh(p2)]*[F2;M2];
   end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i=i+1;
end
stress_All_axis(jjj,:)=[Stress_1*t1/L1/2+abs(t1^2*P/(12*L1^2)) Stress_2*t1/L1/2+abs(t1^2*P1/(12*L1^2)) Stress_3*t1/L1/2+abs(t1^2*P2/(12*L1^2))];
jjj
end
figure(1)
delt_y=0e-3:3e-4:12e-3;
plot(delt_y,max(stress_All_axis')*E1,'-.r')
xlabel('\delta')
ylabel('\sigma_{max}')
title('Maximum stress in the fixed-guided mechanism')
