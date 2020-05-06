clear all
tic
global t1 t2 t3 t4 t5 t6 L1 L2 L3 L4 L5 L6 theta1 E1 E2 E3 E4 E5 E6 I6 I1 I2 I3 I4 I5 L LO beta beta0 t7 L7 E7 I7
syms k r x
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
xx0=rand(42,1);
if jj==1
xx0=rand(42,1);
else xx0=kkkk(:,jj-1);
end
opt=optimset('Display','off','MaxFunEvals',1e20,'MaxIter',1e20,'TolFun',1e-20,'TolX',1e-20);   % Option to display output
[r1,fval,exitflag,output,jacobian]=fsolve(@fsolvefuncl_51,xx0,opt);
kkkk(:,jj)=r1;
jj=jj+1;
end
disp('The calculation is finished, now drawing the configuration of the circular guided mechanism')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%--Beam shape--%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
C=[tan(r)/r^3*(1-cos(r*x))+sin(r*x)/r^3-x/r^2,(1-cos(r*x))/(r^2*cos(r));
(cos(r*x)-1+tan(r)*sin(r*x))/r^2,sin(r*x)/(r*cos(r))];
C1=0.5*[-(-4*r*x-2*r*x*cos(2*r)+4*sin(-2*r+r*x)+4*sin(r*x)+sin(2*r-2*r*x))/(4*r^5*(cos(r))^2) (4*cos(r*x)-2*(cos(r*x))^2-(sin(2*r*x)-2*r*x)*tan(r))/(4*r^4*cos(r));
    (4*cos(r*x)-2*(cos(r*x))^2-(sin(2*r*x)-2*r*x)*tan(r))/(4*r^4*cos(r)) -(sin(2*r*x)-2*r*x)/(4*r^3*cos(r)^2)];
C_p=[tanh(r)/r^3*(cosh(r*x)-1)-sinh(r*x)/r^3+x/r^2,(cosh(r*x)-1)/(r^2*cosh(r));
(1-cosh(r*x)+tanh(r)*sinh(r*x))/r^2,sinh(r*x)/(r*cosh(r))];
C1_p=0.5*[-(-4*r*x-2*r*x*cosh(2*r)+4*sinh(-2*r+r*x)+4*sinh(r*x)+sinh(2*r-2*r*x))/(4*r^5*(cosh(r))^2) (4*cosh(r*x)-2*(cosh(r*x))^2+(sinh(2*r*x)-2*r*x)*tanh(r))/(4*r^4*cosh(r));
    (4*cosh(r*x)-2*(cosh(r*x))^2+(sinh(2*r*x)-2*r*x)*tanh(r))/(4*r^4*cosh(r)) (sinh(2*r*x)-2*r*x)/(4*r^3*cosh(r)^2)];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for jjj=1:10:length(kkkk(1,:))
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Load=[P F M];
Load1=[P1 F1 M1];
Load2=[P2 F2 M2];
Load3=[P3 F3 M3];
Load4=[P4 F4 M4];
Load5=[P5 F5 M5];
Load6=[P6 F6 M6];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


i=1;
for X=0:0.1:1
    if P<0
    p=sqrt(-P);
    C_=subs(C,{r,x},{p,X});
    C1_=subs(C1,{r,x},{p,X})-subs(C1,{r,x},{p,0});
    else
    p=sqrt(P);    
    C_=subs(C_p,{r,x},{p,X});
    C1_=subs(C1_p,{r,x},{p,X})-subs(C1_p,{r,x},{p,0});
    end
    if P1<0
    p1=sqrt(-P1);
    C_1=subs(C,{r,x},{p1,X});
    C1_1=subs(C1,{r,x},{p1,X})-subs(C1,{r,x},{p1,0});
    else
    p1=sqrt(P1);    
    C_1=subs(C_p,{r,x},{p1,X});
    C1_1=subs(C1_p,{r,x},{p1,X})-subs(C1_p,{r,x},{p1,0});
    end
        if P2<0
    p2=sqrt(-P2);
    C_2=subs(C,{r,x},{p2,X});
    C1_2=subs(C1,{r,x},{p2,X})-subs(C1,{r,x},{p2,0});
    else
    p2=sqrt(P2);    
    C_2=subs(C_p,{r,x},{p2,X});
    C1_2=subs(C1_p,{r,x},{p2,X})-subs(C1_p,{r,x},{p2,0});
        end
    if P3<0
    p3=sqrt(-P3);
    C_3=subs(C,{r,x},{p3,X});
    C1_3=subs(C1,{r,x},{p3,X})-subs(C1,{r,x},{p3,0});
    else
    p3=sqrt(P3);    
    C_3=subs(C_p,{r,x},{p3,X});
    C1_3=subs(C1_p,{r,x},{p3,X})-subs(C1_p,{r,x},{p3,0});
    end    
    if P4<0
    p4=sqrt(-P4);
    C_4=subs(C,{r,x},{p4,X});
    C1_4=subs(C1,{r,x},{p4,X})-subs(C1,{r,x},{p4,0});
    else
    p4=sqrt(P4);    
    C_4=subs(C_p,{r,x},{p4,X});
    C1_4=subs(C1_p,{r,x},{p4,X})-subs(C1_p,{r,x},{p4,0});
    end
    if P5<0
    p5=sqrt(-P5);
    C_5=subs(C,{r,x},{p5,X});
    C1_5=subs(C1,{r,x},{p5,X})-subs(C1,{r,x},{p5,0});
    else
    p5=sqrt(P5);    
    C_5=subs(C_p,{r,x},{p5,X});
    C1_5=subs(C1_p,{r,x},{p5,X})-subs(C1_p,{r,x},{p5,0});
    end 
    
    if P6<0
    p6=sqrt(-P6);
    C_6=subs(C,{r,x},{p6,X});
    C1_6=subs(C1,{r,x},{p6,X})-subs(C1,{r,x},{p6,0});
    else
    p6=sqrt(P6);    
    C_6=subs(C_p,{r,x},{p6,X});
    C1_6=subs(C1_p,{r,x},{p6,X})-subs(C1_p,{r,x},{p6,0});
    end 
    
    U(:,i)=C_*[Load(2);Load(3)];
    U1(:,i)=C_1*[Load1(2);Load1(3)];
    U2(:,i)=C_2*[Load2(2);Load2(3)];
    U3(:,i)=C_3*[Load3(2);Load3(3)];
    U4(:,i)=C_4*[Load4(2);Load4(3)];
    U5(:,i)=C_5*[Load5(2);Load5(3)];
    U6(:,i)=C_6*[Load6(2);Load6(3)];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Ux(i)=X*t1^2*P/(12*L1^2)-[F M]*C1_*[F;M];
Ux1(i)=X*t2^2*P1/(12*L2^2)-[F1 M1]*C1_1*[F1;M1];
Ux2(i)=X*t3^2*P2/(12*L3^2)-[F2 M2]*C1_2*[F2;M2];
Ux3(i)=X*t4^2*P3/(12*L4^2)-[F3 M3]*C1_3*[F3;M3];
Ux4(i)=X*t5^2*P4/(12*L5^2)-[F4 M4]*C1_4*[F4;M4];
Ux5(i)=X*t6^2*P5/(12*L6^2)-[F5 M5]*C1_5*[F5;M5];
Ux6(i)=X*t7^2*P6/(12*L7^2)-[F6 M6]*C1_6*[F6;M6];
i=i+1;
end
X=0:0.1:1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%
alpha=0;
alpha1=U(2,length(X));
alpha2=U1(2,length(X));
alpha3=U2(2,length(X));
alpha4=U3(2,length(X));
alpha5=U4(2,length(X));
alpha6=U5(2,length(X));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%
%%Deflection%%%
%%%%%%%%%%%%%%%
X_=Ux+X;
Y_=U(1,:);
Position=[X_;Y_]*L1;
Position_new1=[cos(alpha) -sin(alpha);sin(alpha) cos(alpha)]*Position;
% plot(Position_new1(1,:)/(L),Position_new1(2,:)/L,'.-k')
% hold on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
X_1=Ux1+X;
Y_1=U1(1,:);
Position1=[cos(alpha1) -sin(alpha1);sin(alpha1) cos(alpha1)]*[X_1;Y_1]*L2;
Position_new2(1,:)=Position1(1,:)-(Position1(1,1)-Position_new1(1,length(X)));
Position_new2(2,:)=Position1(2,:)-(Position1(2,1)-Position_new1(2,length(X)));
% plot(Position_new2(1,:)/L,Position_new2(2,:)/L,'.-r')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
X_2=Ux2+X;
Y_2=U2(1,:);
Position2=[cos(alpha1+alpha2) -sin(alpha1+alpha2);sin(alpha1+alpha2) cos(alpha1+alpha2)]*[X_2;Y_2]*L3;
Position_new3(1,:)=Position2(1,:)+(Position_new2(1,length(X))-Position2(1,1));
Position_new3(2,:)=Position2(2,:)+(Position_new2(2,length(X))-Position2(2,1));
% plot(Position_new3(1,:)/L,Position_new3(2,:)/L,'.-')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
X_3=Ux3+X;
Y_3=U3(1,:);
Position3=[cos(alpha1+alpha2+alpha3) -sin(alpha1+alpha2+alpha3);sin(alpha1+alpha2+alpha3) cos(alpha1+alpha2+alpha3)]*[X_3;Y_3]*L4;
Position_new4(1,:)=Position3(1,:)+(Position_new3(1,length(X))-Position3(1,1));
Position_new4(2,:)=Position3(2,:)+(Position_new3(2,length(X))-Position3(2,1));
% plot(Position_new4(1,:)/L,Position_new4(2,:)/L,'g.-')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
X_4=Ux4+X;
Y_4=U4(1,:);
Position4=[cos(alpha1+alpha2+alpha3+alpha4) -sin(alpha1+alpha2+alpha3+alpha4);sin(alpha1+alpha2+alpha3+alpha4) cos(alpha1+alpha2+alpha3+alpha4)]*[X_4;Y_4]*L5;
Position_new5(1,:)=Position4(1,:)+(Position_new4(1,length(X))-Position4(1,1));
Position_new5(2,:)=Position4(2,:)+(Position_new4(2,length(X))-Position4(2,1));
% plot(Position_new5(1,:)/L,Position_new5(2,:)/L,'c.-')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
X_5=Ux5+X;
Y_5=U5(1,:);
Position5=[cos(alpha1+alpha2+alpha3+alpha4+alpha5) -sin(alpha1+alpha2+alpha3+alpha4+alpha5);sin(alpha1+alpha2+alpha3+alpha4+alpha5) cos(alpha1+alpha2+alpha3+alpha4+alpha5)]*[X_5;Y_5]*L6;
Position_new6(1,:)=Position5(1,:)+(Position_new5(1,length(X))-Position5(1,1));
Position_new6(2,:)=Position5(2,:)+(Position_new5(2,length(X))-Position5(2,1));
% plot(Position_new5(1,:)/L,Position_new5(2,:)/L,'c.-')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
X_6=Ux6+X;
Y_6=U6(1,:);
Position6=[cos(alpha1+alpha2+alpha3+alpha4+alpha5+alpha6) -sin(alpha1+alpha2+alpha3+alpha4+alpha5+alpha6);sin(alpha1+alpha2+alpha3+alpha4+alpha5+alpha6) cos(alpha1+alpha2+alpha3+alpha4+alpha5+alpha6)]*[X_6;Y_6]*L7;
Position_new7(1,:)=Position6(1,:)+(Position_new6(1,length(X))-Position6(1,1));
Position_new7(2,:)=Position6(2,:)+(Position_new6(2,length(X))-Position6(2,1));
% plot(Position_new5(1,:)/L,Position_new5(2,:)/L,'c.-')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 figure(1)
 axis equal
Position_total_=[Position_new1 Position_new2 Position_new3 Position_new4 Position_new5 Position_new6 Position_new7];
 plot(Position_total_(1,:)/L,Position_total_(2,:)/L,'-r')
 hold on
xlabel('x')
ylabel('y')
title('Deformation of the flexible beam in circular guided mechanism')
end