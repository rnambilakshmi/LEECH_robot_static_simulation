function y=fsolvefuncl_7(x)
global t1 t2 t3 t4 t5 t6 L1 L2 L3 L4 L5 L6 E6 E1 E2 E3 E4 E5 I6 I1 I2 I3 I4 I5 L LO beta beta0 t7 E7 I7 L7
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

m7=x(37);
f7=x(38);
p7=x(39);
delt_y7=x(40);
delt_x7=x(41);
alpha7=x(42);

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

y40=[12 -6]*[delt_y7;alpha7]+p7*[1.2 -0.1]*[delt_y7;alpha7]-f7+p7^2*[-1/700 1/1400]*[delt_y7;alpha7];
y41=[-6 4]*[delt_y7;alpha7]+p7*[-0.1 2/15]*[delt_y7;alpha7]-m7+p7^2*[1/1400 -11/6300]*[delt_y7;alpha7];
y42=t7^2*p7/(12*L7^2)+[delt_y7 alpha7]*[-0.6 0.05;0.05 -1/15]*[delt_y7;alpha7]-delt_x7+p7*[delt_y7 alpha7]*[1/700 -1/1400;-1/1400 11/6300]*[delt_y7;alpha7];


y19=(cos(alpha1)*p2-sin(alpha1)*f2)*E2*I2/L2^2-p1*E1*I1/L1^2;
y20=(cos(alpha1)*f2+sin(alpha1)*p2)*E2*I2/L2^2-f1*E1*I1/L1^2;
y21=m1*E1*I1/L1-(m2*E2*I2/L2+f2*E2*I2/L2*(1+delt_x2)-p2*E2*I2/L2*(delt_y2));
y22=(cos(alpha1+alpha2)*p3-sin(alpha1+alpha2)*f3)*E3*I3/L3^2-p1*E2*I2/L2^2;
y23=(cos(alpha1+alpha2)*f3+sin(alpha1+alpha2)*p3)*E3*I3/L3^2-f1*E2*I2/L2^2;
y24=m2*E2*I2/L2-(m3*E3*I3/L3+f3*E3*I3/L3*(1+delt_x3)-p3*E3*I3/L3*(delt_y3));
y25=(cos(alpha1+alpha2+alpha3)*p4-sin(alpha1+alpha2+alpha3)*f4)*E4*I4/L4^2-p1*E3*I3/L3^2;
y26=(cos(alpha1+alpha2+alpha3)*f4+sin(alpha1+alpha2+alpha3)*p4)*E4*I4/L4^2-f1*E3*I3/L3^2;
y27=m3*E3*I3/L3-(m4*E4*I4/L4+f4*E4*I4/L4*(1+delt_x4)-p4*E4*I4/L4*(delt_y4));
y28=(cos(alpha1+alpha2+alpha3+alpha4)*p5-sin(alpha1+alpha2+alpha3+alpha4)*f5)*E5*I5/L5^2-p1*E4*I4/L4^2;
y29=(cos(alpha1+alpha2+alpha3+alpha4)*f5+sin(alpha1+alpha2+alpha3+alpha4)*p5)*E5*I5/L5^2-f1*E4*I4/L4^2;
y30=m4*E4*I4/L4-(m5*E5*I5/L5+f5*E5*I5/L5*(1+delt_x5)-p5*E5*I5/L5*(delt_y5));
y31=(cos(alpha1+alpha2+alpha3+alpha4+alpha5)*p6-sin(alpha1+alpha2+alpha3+alpha4+alpha5)*f6)*E6*I6/L6^2-p1*E4*I4/L4^2;
y32=(cos(alpha1+alpha2+alpha3+alpha4+alpha5)*f6+sin(alpha1+alpha2+alpha3+alpha4+alpha5)*p6)*E6*I6/L6^2-f1*E4*I4/L4^2;
y33=m5*E5*I5/L5-(m6*E6*I6/L6+f6*E6*I6/L6*(1+delt_x6)-p6*E6*I6/L6*(delt_y6));

y37=(cos(alpha1+alpha2+alpha3+alpha4+alpha5+alpha6)*p7-sin(alpha1+alpha2+alpha3+alpha4+alpha5+alpha6)*f7)*E7*I7/L7^2-p1*E4*I4/L4^2;
y38=(cos(alpha1+alpha2+alpha3+alpha4+alpha5+alpha6)*f7+sin(alpha1+alpha2+alpha3+alpha4+alpha5+alpha6)*p7)*E7*I7/L7^2-f1*E4*I4/L4^2;
y39=m6*E6*I6/L6-(m7*E7*I7/L7+f7*E7*I7/L7*(1+delt_x7)-p7*E7*I7/L7*(delt_y7));

y34=cos(alpha1+alpha2+alpha3+alpha4+alpha5+alpha6)*(L7*delt_x7+L7)-sin(alpha1+alpha2+alpha3+alpha4+alpha5+alpha6)*L7*delt_y7+ cos(alpha1+alpha2+alpha3+alpha4+alpha5)*(L6*delt_x6+L6)-sin(alpha1+alpha2+alpha3+alpha4+alpha5)*L6*delt_y6+cos(alpha1+alpha2+alpha3+alpha4)*(L5*delt_x5+L5)-sin(alpha1+alpha2+alpha3+alpha4)*L5*delt_y5+cos(alpha1+alpha2+alpha3)*(L4*delt_x4+L4)-sin(alpha1+alpha2+alpha3)*L4*delt_y4+cos(alpha1+alpha2)*(L3*delt_x3+L3)-sin(alpha1+alpha2)*L3*delt_y3+cos(alpha1)*(L2*delt_x2+L2)-sin(alpha1)*L2*delt_y2+(L1*delt_x1+L1)-(L-LO*cos(beta0)+LO*cos(beta));
y35=sin(alpha1+alpha2+alpha3+alpha4+alpha5+alpha6)*(L7*delt_x7+L7)+cos(alpha1+alpha2+alpha3+alpha4+alpha5+alpha6)*L7*delt_y7+ sin(alpha1+alpha2+alpha3+alpha4+alpha5)*(L6*delt_x6+L6)+cos(alpha1+alpha2+alpha3+alpha4+alpha5)*L6*delt_y6+sin(alpha1+alpha2+alpha3+alpha4)*(L5*delt_x5+L5)+cos(alpha1+alpha2+alpha3+alpha4)*L5*delt_y5+sin(alpha1+alpha2+alpha3)*(L4*delt_x4+L4)+cos(alpha1+alpha2+alpha3)*L4*delt_y4+sin(alpha1+alpha2)*(L3*delt_x3+L3)+cos(alpha1+alpha2)*L3*delt_y3+sin(alpha1)*(L2*delt_x2+L2)+cos(alpha1)*L2*delt_y2+(L1*delt_y1)-(LO*(sin(beta)-sin(beta0)));
y36=alpha1+alpha2+alpha3+alpha4+alpha5+alpha6+alpha7-beta+beta0;
y=[y1;y2;y3;y4;y5;y6;y7;y8;y9;y10;y11;y12;y13;y14;y15;y16;y17;y18;y19;y20;y21;y22;y23;y24;y25;y26;y27;y28;y29;y30;y31;y32;y33;y34;y35;y36;y37;y38;y39;y40;y41;y42];
