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


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for jjj=1:length(kkkk(1,:))
Forces=kkkk([19,20,21,25,26,27,31,32,33,50,51,52],jjj);
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
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Load=[F M];
Load1=[F1 M1];
Load2=[F2 M2];
Load3=[F3 M3];
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
    i=i+1;
 end
 stress_All(jjj,:)=[Stress_1*t1/L1/2+abs(t1^2*P/(12*L1^2)) Stress_2*t1/L1/2+abs(t1^2*P1/(12*L1^2)) Stress_3*t1/L1/2+abs(t1^2*P2/(12*L1^2)) Stress_4*t1/L1/2+abs(t1^2*P3/(12*L1^2))];
jjj
end
figure(1)
MM=0:0.005:0.15;
plot(kkkk(43,:)*180/pi,max(stress_All')*E1,'-.k')
xlabel('M')
ylabel('Maximum Stress')
title('Maximum Stress in cross axis flexural pivot')
