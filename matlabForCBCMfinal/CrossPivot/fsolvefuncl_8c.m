function y=fsolvefuncl_8c(x,Loads)
global t1 t2 t3 t4 t5 t6  t7 t8 L1 L2 L3 L4 L5 L6 L7 L8 E1 E2 E3 E4 E5 E6 E7 E8 I1 I2 I3 I4 I5 I6 I7 I8 L Beta w1 w2
Fx=Loads(1);
Fy=Loads(2);
MM=Loads(3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m1=x(1);
f1=x(2);
p1=x(3);
delt_y1=x(4);
delt_x1=x(5);
alpha1=x(6);
m2=x(7);
f2=x(8);
p2=x(9);
delt_y2=x(10);
delt_x2=x(11);
alpha2=x(12);
m3=x(13);
f3=x(14);
p3=x(15);
delt_y3=x(16);
delt_x3=x(17);
alpha3=x(18);
m4=x(19);
f4=x(20);
p4=x(21);
delt_y4=x(22);
delt_x4=x(23);
alpha4=x(24);
m5=x(25);
f5=x(26);
p5=x(27);
delt_y5=x(28);
delt_x5=x(29);
alpha5=x(30);
m6=x(31);
f6=x(32);
p6=x(33);
delt_y6=x(34);
delt_x6=x(35);
alpha6=x(36);

a1=x(37);
a2=x(38);
b1=x(39);
b2=x(40);

Delt_X=x(41);
Delt_Y=x(42);
Delt_theta=x(43);

m7=x(44);
f7=x(45);
p7=x(46);
delt_y7=x(47);
delt_x7=x(48);
alpha7=x(49);
m8=x(50);
f8=x(51);
p8=x(52);
delt_y8=x(53);
delt_x8=x(54);
alpha8=x(55);

y1=12*delt_y1-6*alpha1+p1*(1.2*delt_y1-0.1*alpha1)-f1+p1^2*[-1/700 1/1400]*[delt_y1;alpha1];
y2=-6*delt_y1+4*alpha1+p1*(-0.1*delt_y1+2/15*alpha1)-m1+p1^2*[1/1400 -11/6300]*[delt_y1;alpha1];
y3=t1^2*p1/(12*L1^2)+[delt_y1 alpha1]*[-0.6 0.05;0.05 -1/15]*[delt_y1;alpha1]-delt_x1+p1*[delt_y1 alpha1]*[1/700 -1/1400;-1/1400 11/6300]*[delt_y1;alpha1];
y4=[12 -6]*[delt_y2;alpha2]+p2*[1.2 -0.1]*[delt_y2;alpha2]-f2+p2^2*[-1/700 1/1400]*[delt_y2;alpha2];
y5=[-6 4]*[delt_y2;alpha2]+p2*[-0.1 2/15]*[delt_y2;alpha2]-m2+p2^2*[1/1400 -11/6300]*[delt_y2;alpha2];
y6=t2^2*p2/(12*L2^2)+[delt_y2 alpha2]*[-0.6 0.05;0.05 -1/15]*[delt_y2;alpha2]-delt_x2+p2*[delt_y2 alpha2]*[1/700 -1/1400;-1/1400 11/6300]*[delt_y2;alpha2];
y7=[12 -6]*[delt_y3;alpha3]+p3*[1.2 -0.1]*[delt_y3;alpha3]-f3+p3^2*[-1/700 1/1400]*[delt_y3;alpha3];
y8=[-6 4]*[delt_y3;alpha3]+p3*[-0.1 2/15]*[delt_y3;alpha3]-m3+p3^2*[1/1400 -11/6300]*[delt_y3;alpha3];
y9=t3^2*p3/(12*L3^2)+[delt_y3 alpha3]*[-0.6 0.05;0.05 -1/15]*[delt_y3;alpha3]-delt_x3+p3*[delt_y3 alpha3]*[1/700 -1/1400;-1/1400 11/6300]*[delt_y3;alpha3];
y10=[12 -6]*[delt_y4;alpha4]+p4*[1.2 -0.1]*[delt_y4;alpha4]-f4+p4^2*[-1/700 1/1400]*[delt_y4;alpha4];
y11=[-6 4]*[delt_y4;alpha4]+p4*[-0.1 2/15]*[delt_y4;alpha4]-m4+p4^2*[1/1400 -11/6300]*[delt_y4;alpha4];
y12=t4^2*p4/(12*L4^2)+[delt_y4 alpha4]*[-0.6 0.05;0.05 -1/15]*[delt_y4;alpha4]-delt_x4+p4*[delt_y4 alpha4]*[1/700 -1/1400;-1/1400 11/6300]*[delt_y4;alpha4];
y13=[12 -6]*[delt_y5;alpha5]+p5*[1.2 -0.1]*[delt_y5;alpha5]-f5+p5^2*[-1/700 1/1400]*[delt_y5;alpha5];
y14=[-6 4]*[delt_y5;alpha5]+p5*[-0.1 2/15]*[delt_y5;alpha5]-m5+p5^2*[1/1400 -11/6300]*[delt_y5;alpha5];
y15=t5^2*p5/(12*L5^2)+[delt_y5 alpha5]*[-0.6 0.05;0.05 -1/15]*[delt_y5;alpha5]-delt_x5+p5*[delt_y5 alpha5]*[1/700 -1/1400;-1/1400 11/6300]*[delt_y5;alpha5];
y16=[12 -6]*[delt_y6;alpha6]+p6*[1.2 -0.1]*[delt_y6;alpha6]-f6+p6^2*[-1/700 1/1400]*[delt_y6;alpha6];
y17=[-6 4]*[delt_y6;alpha6]+p6*[-0.1 2/15]*[delt_y6;alpha6]-m6+p6^2*[1/1400 -11/6300]*[delt_y6;alpha6];
y18=t6^2*p6/(12*L6^2)+[delt_y6 alpha6]*[-0.6 0.05;0.05 -1/15]*[delt_y6;alpha6]-delt_x6+p6*[delt_y6 alpha6]*[1/700 -1/1400;-1/1400 11/6300]*[delt_y6;alpha6];

y44=[12 -6]*[delt_y7;alpha7]+p7*[1.2 -0.1]*[delt_y7;alpha7]-f7+p7^2*[-1/700 1/1400]*[delt_y7;alpha7];
y45=[-6 4]*[delt_y7;alpha7]+p7*[-0.1 2/15]*[delt_y7;alpha7]-m7+p7^2*[1/1400 -11/6300]*[delt_y7;alpha7];
y46=t7^2*p7/(12*L7^2)+[delt_y7 alpha7]*[-0.6 0.05;0.05 -1/15]*[delt_y7;alpha7]-delt_x7+p7*[delt_y7 alpha7]*[1/700 -1/1400;-1/1400 11/6300]*[delt_y7;alpha7];

y47=[12 -6]*[delt_y8;alpha8]+p8*[1.2 -0.1]*[delt_y8;alpha8]-f8+p8^2*[-1/700 1/1400]*[delt_y8;alpha8];
y48=[-6 4]*[delt_y8;alpha8]+p8*[-0.1 2/15]*[delt_y8;alpha8]-m8+p8^2*[1/1400 -11/6300]*[delt_y8;alpha8];
y49=t8^2*p8/(12*L8^2)+[delt_y8 alpha8]*[-0.6 0.05;0.05 -1/15]*[delt_y8;alpha8]-delt_x8+p8*[delt_y8 alpha8]*[1/700 -1/1400;-1/1400 11/6300]*[delt_y8;alpha8];

y19=(cos(alpha1)*p2-sin(alpha1)*f2)*E2*I2/L2^2-p1*E1*I1/L1^2;
y20=(cos(alpha1)*f2+sin(alpha1)*p2)*E2*I2/L2^2-f1*E1*I1/L1^2;
y21=m1*E1*I1/L1-(m2*E2*I2/L2+f2*E2*I2/L2*(1+delt_x2)-p2*E2*I2/L2*(delt_y2));
y22=(cos(alpha1+alpha2)*p7-sin(alpha1+alpha2)*f7)*E7*I7/L7^2-p1*E2*I2/L2^2;
y23=(cos(alpha1+alpha2)*f7+sin(alpha1+alpha2)*p7)*E7*I7/L7^2-f1*E2*I2/L2^2;
y24=m2*E2*I2/L2-(m7*E7*I7/L7+f7*E7*I7/L7*(1+delt_x7)-p7*E7*I7/L7*(delt_y7));

y50=(cos(alpha1+alpha2+alpha7)*p3-sin(alpha1+alpha2+alpha7)*f3)*E3*I3/L3^2-p1*E2*I2/L2^2;
y51=(cos(alpha1+alpha2+alpha7)*f3+sin(alpha1+alpha2+alpha7)*p3)*E3*I3/L3^2-f1*E2*I2/L2^2;
y52=m7*E7*I7/L7-(m3*E3*I3/L3+f3*E3*I3/L3*(1+delt_x3)-p3*E3*I3/L3*(delt_y3));

y25=cos(alpha1+alpha2+alpha7)*(L3*delt_x3+L3)-sin(alpha1+alpha2+alpha7)*L3*delt_y3+cos(alpha1+alpha2)*(L7*delt_x7+L7)-sin(alpha1+alpha2)*L7*delt_y7+cos(alpha1)*(L2*delt_x2+L2)-sin(alpha1)*L2*delt_y2+(L1*delt_x1+L1)-a1;
y26=sin(alpha1+alpha2+alpha7)*(L3*delt_x3+L3)+cos(alpha1+alpha2+alpha7)*L3*delt_y3+sin(alpha1+alpha2)*(L7*delt_x7+L7)+cos(alpha1+alpha2)*L7*delt_y7+sin(alpha1)*(L2*delt_x2+L2)+cos(alpha1)*L2*delt_y2+(L1*delt_y1)-b1;
y27=alpha1+alpha2+alpha3+alpha7-Delt_theta;

y28=(cos(alpha4)*p5-sin(alpha4)*f5)*E5*I5/L5^2-p4*E4*I4/L4^2;
y29=(cos(alpha4)*f5+sin(alpha4)*p5)*E5*I5/L5^2-f4*E4*I4/L4^2;
y30=m4*E4*I4/L4-(m5*E5*I5/L5+f5*E5*I5/L5*(1+delt_x5)-p5*E5*I5/L5*(delt_y5));
y31=(cos(alpha4+alpha5)*p8-sin(alpha4+alpha5)*f8)*E8*I8/L8^2-p4*E4*I4/L4^2;
y32=(cos(alpha4+alpha5)*f8+sin(alpha4+alpha5)*p8)*E8*I8/L8^2-f4*E4*I4/L4^2;
y33=m5*E5*I5/L5-(m8*E8*I8/L8+f8*E8*I8/L8*(1+delt_x8)-p8*E8*I8/L8*(delt_y8));

y53=(cos(alpha4+alpha5+alpha8)*p6-sin(alpha4+alpha5+alpha8)*f6)*E6*I6/L6^2-p4*E4*I4/L4^2;
y54=(cos(alpha4+alpha5+alpha8)*f6+sin(alpha4+alpha5+alpha8)*p6)*E6*I6/L6^2-f4*E4*I4/L4^2;
y55=m8*E8*I8/L8-(m6*E6*I6/L6+f6*E6*I6/L6*(1+delt_x6)-p6*E6*I6/L6*(delt_y6));

y34=cos(alpha4+alpha5+alpha8)*(L6*delt_x6+L6)-sin(alpha4+alpha5+alpha8)*L6*delt_y6+cos(alpha4+alpha5)*(L8*delt_x8+L8)-sin(alpha8+alpha8)*L8*delt_y8+cos(alpha4)*(L5*delt_x5+L5)-sin(alpha4)*L5*delt_y5+(L4*delt_x4+L4)-a2;
y35=sin(alpha4+alpha5+alpha8)*(L6*delt_x6+L6)+cos(alpha4+alpha5+alpha8)*L6*delt_y6+sin(alpha4+alpha5)*(L8*delt_x8+L8)+cos(alpha8+alpha8)*L8*delt_y8+sin(alpha4)*(L5*delt_x5+L5)+cos(alpha4)*L5*delt_y5+(L4*delt_y4)-b2;
y36=alpha4+alpha5+alpha6+alpha8-Delt_theta;

y37=Delt_X-(-(a1-a2)*sin(Beta)-(b1+b2)*cos(Beta))/2;
y38=Delt_Y-((a1+a2)*cos(Beta)-(b1-b2)*sin(Beta))/2;
y39=[sin(Beta) -cos(Beta)]*[a2;b2]-([-sin(Beta) -cos(Beta)]*[a1;b1]+w1+w2*cos(Delt_theta));
y40=[cos(Beta) sin(Beta)]*[a2;b2]-([cos(Beta) -sin(Beta)]*[a1;b1]+w2*sin(Delt_theta));

y41=Fx+[-sin(Beta) cos(Beta)]*[-p1*E1*I1/L1^2;f1*E1*I1/L1^2]+[sin(Beta) cos(Beta)]*[-p4*E1*I1/L1^2;f4*E1*I1/L1^2];
y42=Fy-[-cos(Beta) -sin(Beta)]*[-p1*E1*I1/L1^2;f1*E1*I1/L1^2]-[-cos(Beta) sin(Beta)]*[-p4*E1*I1/L1^2;f4*E1*I1/L1^2];
y43=MM-m3*E1*I1/L1-m6*E6*I6/L6-w2*sin(Delt_theta)*([sin(Beta) cos(Beta)]*[-p4*E1*I1/L1^2;f4*E1*I1/L1^2])-w2*cos(Delt_theta)*([-cos(Beta) sin(Beta)]*[-p4*E1*I1/L1^2;f4*E1*I1/L1^2])-Fx*w2*sin(Delt_theta)/2+Fy*w2*cos(Delt_theta)/2;

y=[y1;y2;y3;y4;y5;y6;y7;y8;y9;y10;y11;y12;y13;y14;y15;y16;y17;y18;y19;y20;y21;y22;y23;y24;y25;y26;y27;y28;y29;y30;y31;y32;y33;y34;y35;y36;y37;y38;y39;y40;y41;y42;y43;y44;y45;y46;y47;y48;y49;y50;y51;y52;y53;y54;y55];
