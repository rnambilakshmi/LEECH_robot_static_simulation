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
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for jjj=1:length(kkkk(1,:))
Forces=kkkk([1,2,3,7,8,9,13,14,15,19,20,21,25,26,27,31,32,33,37,38,39],jjj);
 M=Forces(1);
 F=Forces(2);
 P=Forces(3);
 M1=Forces(4);
 F1=Forces(5);
 P1=Forces(6);
 M2=Forces(7);
 F2=Forces(8);
 P2=Forces(9);
 M3=Forces(10);
 F3=Forces(11);
 P3=Forces(12);
 M4=Forces(13);
 F4=Forces(14);
 P4=Forces(15);
 M5=Forces(16);
 F5=Forces(17);
 P5=Forces(18);
  M6=Forces(19);
 F6=Forces(20);
 P6=Forces(21);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Load=[F M];
Load1=[F1 M1];
Load2=[F2 M2];
Load3=[F3 M3];
Load4=[F4 M4];
Load5=[F5 M5];
Load6=[F6 M6];
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
    if P3<0
    p3=sqrt(-P3);
    Stress_4(i)=[(tan(p3)*cos(p3*X)-sin(p3*X))/p3 cos(p3*X)/cos(p3)]*[F3;M3];
    else
    p3=sqrt(P3);    
    Stress_4(i)=[(tanh(p3)*cosh(p3*X)-sinh(p3*X))/p3 cosh(p3*X)/cosh(p3)]*[F3;M3];
    end    
    if P4<0
    p4=sqrt(-P4);
    Stress_5(i)=[(tan(p4)*cos(p4*X)-sin(p4*X))/p4 cos(p4*X)/cos(p4)]*[F4;M4];
    else
    p4=sqrt(P4);    
    Stress_5(i)=[(tanh(p4)*cosh(p4*X)-sinh(p4*X))/p4 cosh(p4*X)/cosh(p4)]*[F4;M4];
    end
    
    if P5<0
    p5=sqrt(-P5);
    Stress_6(i)=[(tan(p5)*cos(p5*X)-sin(p5*X))/p5 cos(p5*X)/cos(p5)]*[F5;M5];
    else
    p5=sqrt(P5);    
    Stress_6(i)=[(tanh(p5)*cosh(p5*X)-sinh(p5*X))/p5 cosh(p5*X)/cosh(p5)]*[F5;M5];
    end
        
    if P6<0
    p6=sqrt(-P6);
    Stress_7(i)=[(tan(p6)*cos(p6*X)-sin(p6*X))/p6 cos(p6*X)/cos(p6)]*[F6;M6];
    else
    p6=sqrt(P6);    
    Stress_7(i)=[(tanh(p6)*cosh(p6*X)-sinh(p6*X))/p6 cosh(p6*X)/cosh(p6)]*[F6;M6];
    end
    
    i=i+1;
 end
 stress_All(jjj,:)=[Stress_1*t1/L1/2+abs(t1^2*P/(12*L1^2)) Stress_2*t1/L1/2+abs(t1^2*P1/(12*L1^2)) Stress_3*t1/L1/2+abs(t1^2*P2/(12*L1^2)) Stress_4*t1/L1/2+abs(t1^2*P3/(12*L1^2)) Stress_5*t1/L1/2+abs(t1^2*P4/(12*L1^2)) Stress_6*t1/L1/2+abs(t1^2*P5/(12*L1^2)) Stress_7*t1/L1/2+abs(t1^2*P6/(12*L1^2))];
 jjj
end
figure(1)
beta=30:90;
plot(beta,max(stress_All')*E1,'-.k')
xlabel('\beta')
ylabel('\sigma_{max}')
title('Maximum stress in circular-guided mechanism')
