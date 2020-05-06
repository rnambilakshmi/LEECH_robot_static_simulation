clear all

global t1 t2 t3 t4 t5 t6 L1 L2 L3 L4 L5 L6 theta1 KK1 KK2 KK3 KX1 KX2 E1 E2 E3 E4 E5 E6 I1 I2 I3 I4 I5 I6 L delt_y
syms k r x
mu=0.33;
Steps=40;
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
for delt_y=0:12e-3/Steps:12e-3
xx0=rand(18,1);

opt=optimset('Display','off','MaxFunEvals',1e20,'MaxIter',1e20,'TolFun',1e-20,'TolX',1e-20);   % Option to display output
[r1,fval,exitflag,output,jacobian]=fsolve(@fsolvefuncl_3,xx0,opt);
kkkk(:,jj)=r1;
jj=jj+1;
end
disp('The calculation is finished, now drawing the configuration of the fixed-guided mechanism')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%--Beam shape--%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
C=[tan(r)/r^3*(1-cos(r*x))+sin(r*x)/r^3-x/r^2,(1-cos(r*x))/(r^2*cos(r));
(cos(r*x)-1+tan(r)*sin(r*x))/r^2,sin(r*x)/(r*cos(r))];
C1=0.5*[-(-4*r*x-2*r*x*cos(2*r)+4*sin(-2*r+r*x)+4*sin(r*x)+sin(2*r-2*r*x))/(4*r^5*(cos(r))^2) (4*cos(r*x)-2*(cos(r*x))^2-(sin(2*r*x)-2*r*x)*tan(r))/(4*r^4*cos(r));
    (4*cos(r*x)-2*(cos(r*x))^2-(sin(2*r*x)-2*r*x)*tan(r))/(4*r^4*cos(r)) -(sin(2*r*x)-2*r*x)/(4*r^3*cos(r)^2)];
C_p=[tanh(r)/r^3*(cosh(r*x)-1)-sinh(r*x)/r^3+x/r^2,(cosh(r*x)-1)/(r^2*cosh(r));
(1-cosh(r*x)+tanh(r)*sinh(r*x))/r^2,sinh(r*x)/(r*cosh(r))];
C1_p=0.5*[-(-4*r*x-2*r*x*cosh(2*r)+4*sinh(-2*r+r*x)+4*sinh(r*x)+sinh(2*r-2*r*x))/(4*r^5*(cosh(r))^2) (4*cosh(r*x)-2*(cosh(r*x))^2+(sinh(2*r*x)-2*r*x)*tanh(r))/(4*r^4*cosh(r));
    (4*cosh(r*x)-2*(cosh(r*x))^2+(sinh(2*r*x)-2*r*x)*tanh(r))/(4*r^4*cosh(r)) (sinh(2*r*x)-2*r*x)/(4*r^3*cosh(r)^2)];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for jjj=1:8:length(kkkk(1,:))
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
Load=[P F M];
Load1=[P1 F1 M1];
Load2=[P2 F2 M2];

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
    
    U(:,i)=C_*[Load(2);Load(3)];
    U1(:,i)=C_1*[Load1(2);Load1(3)];
    U2(:,i)=C_2*[Load2(2);Load2(3)];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Ux(i)=X*t1^2*P/(12*L1^2)-[F M]*C1_*[F;M];
Ux1(i)=X*t2^2*P1/(12*L2^2)-[F1 M1]*C1_1*[F1;M1];
Ux2(i)=X*t3^2*P2/(12*L3^2)-[F2 M2]*C1_2*[F2;M2];
i=i+1;
end
X=0:0.1:1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%
alpha=0;
alpha1=U(2,length(X));
alpha2=U1(2,length(X));
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

figure(1)
axis equal
Position_total_=[Position_new1 Position_new2 Position_new3];
plot(Position_total_(1,:)/L,Position_total_(2,:)/L,'-r')
hold on
xlabel('x')
ylabel('y')
title('Deformation of the fixed-guided mechanism')
jjj
end