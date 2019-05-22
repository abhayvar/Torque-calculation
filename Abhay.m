wo=2.616;
ao=1;
g=9.8;
H=30*cos(18*pi/180)/100;
m1 = 97.8/1000; l1 = 9.3356/100;
m2 = 114.8/1000; l2 = 15/100;
m3 = 159.5/1000; l3 = 15/100;
m4 = 1230/1000; l4 = 16/100;
m5 = 159.5/1000; l5 = 15/100;
m6 = 114.8/1000; l6 = 15/100;
m7 = 97.8/1000; l7 = 9.3356/100;
h  = 2.8/100; k =6.34/100;
l1c=l1;
l2c=l2;
l3c=l3;
l4c=l4;
l5c=l5;
l6c=l6;
l7c=l7;
I1=m1*l1*l1;
I2=m2*l2*l2;
I3=m3*l3*l3;
I4=m4*l4*l4;
I5=m5*l5*l5;
I6=m6*l6*l6;
I7=m7*l7*l7;
Torque=zeros(10,400);
for t = 1:40
    if (t<11)   
        x1=0;y1=0;z1=h;
        x2=-5;y2=10;z2=k;
        X=-2.5+t/10;Y=5;Z=H;
        q1i=0;q2i=pi/2-AngleB(X, Z, x1, z1);q3i=q2i+pi-AngleC(X, Z, x1, z1);
        q4i=pi/2;
        q6i=pi/2+AngleB(X, Z, x2, z2);q5i=AngleC(X, Z, x1, z1)+q6i-pi;q7i=0;
        x1=0;y1=0;z1=h;
        x2=-5;y2=10;z2=k;
        X=-2.5+(t+1)/10;Y=5;Z=H;
        q1f=0;q2f=pi/2-AngleB(X, Z, x1, z1);q3f=q2f+pi-AngleC(X, Z, x1, z1);
        q4f=pi/2;
        q6f=pi/2+AngleB(X, Z, x2, z2);q5f=AngleC(X, Z, x1, z1)+q6f-pi;q7f=0;
    elseif (t<31)
        x1=0;y1=0;z1=h;
        x2=-5 + (t-10)*5/10;y2=10;z2=k+cubiceqn2(x2+5);
        X=-1.5+(t-10)*1.5/10;Y=5;Z=H+cubiceqn1(X+1.5);
        q1i=0;q2i=pi/2-AngleB(X, Z, x1, z1);q3i=q2i+pi-AngleC(X, Z, x1, z1);
        q4i=pi/2;
        q6i=pi/2+AngleB(X, Z, x2, z2);q5i=AngleC(X, Z, x1, z1)+q6i-pi;q7i=0;
        x1=0;y1=0;z1=h;
        x2=-5 + (t-9)*5/10;y2=10;z2=k+cubiceqn2(x2+5);
        X=-1.5+(t-9)*1.5/10;Y=5;Z=H+cubiceqn1(X+1.5);
        q1f=0;q2f=pi/2-AngleB(X, Z, x1, z1);q3f=q2f+pi-AngleC(X, Z, x1, z1);
        q4f=pi/2;
        q6f=pi/2+AngleB(X, Z, x2, z2);q5f=AngleC(X, Z, x1, z1)+q6f-pi;q7f=0;
    else
        x1=0;y1=0;z1=h;
        x2=5;y2=10;z2=k;
        X=1.5+(t-30)/10;Y=5;Z=H;
        q1i=0;q2i=pi/2-AngleB(X, Z, x1, z1);q3i=q2i+pi-AngleC(X, Z, x1, z1);
        q4i=pi/2;
        q6i=pi/2+AngleB(X, Z, x2, z2);q5i=AngleC(X, Z, x1, z1)+q6i-pi;q7i=0;
        x1=0;y1=0;z1=h;
        x2=5;y2=10;z2=k;
        X=1.5+(t-29)/10;Y=5;Z=H;
        q1f=0;q2f=pi/2-AngleB(X, Z, x1, z1);q3f=q2f+pi-AngleC(X, Z, x1, z1);
        q4f=pi/2;
        q6f=pi/2+AngleB(X, Z, x2, z2);q5f=AngleC(X, Z, x1, z1)+q6f-pi;q7f=0;
    end
    
        for i=1:10
            N1 = intermediate(q1i, q1f, i, wo, ao);
            N2 = intermediate(q2i, q2f, i, wo, ao);
            N3 = intermediate(q3i, q3f, i, wo, ao);
            N4 = intermediate(q4i, q4f, i, wo, ao);
            N5 = intermediate(q5i, q5f, i, wo, ao);
            N6 = intermediate(q6i, q6f, i, wo, ao);
            N7 = intermediate(q7i, q7f, i, wo, ao);
            a1 = N1(1); w1 = N1(2); q1 = N1(3);
            a2 = N2(1); w2 = N2(2); q2 = N2(3);
            a3 = N3(1); w3 = N3(2); q3 = N3(3);
            a4 = N4(1); w4 = N4(2); q4 = N4(3);
            a5 = N5(1); w5 = N5(2); q5 = N5(3);
            a6 = N6(1); w6 = N6(2); q6 = N6(3);
            a7 = N7(1); w7 = N7(2); q7 = N7(3);

        M1 = a1*(m1*l1c*l1c + I1  + (m2+m3+m4+m5+m6+m7)*(l1*l1 + h*h)) + a2*((m2*l2c/l2+m3+m4+m5+m6+m7)*l1*l2*cos(q1+q2) - (m2*l2c/l2+m3+m4+m5+m6+m7)*h*l2*sin(q1+q2)) + a3*((m3*l3c/l3 +m4+m5+m6+m7)*l1*l3*cos(q1+q3) - (m3*l3c/l3+m4+m5+m6+m7)*h*l3*sin(q1+q3)) + a4*(m4*l1*l4c*cos(q1+q4) - m4*h*l4c*sin(q1+q4)) + a5*((-m5+m5*l5c/l5-m6-m7)*l1*l5*cos(q1-q5) + (m5-m5*l5c/l5 + m6+m7)*h*l5*sin(q1-q5)) + a6*((-m6+m6*l6c/l6-m7)*l1*l6*cos(q1-q6) + (m6-m6*l6c/l6 +m7)*h*l6*sin(q1-q6)) +              a7*((m7*l1*l7c + m7*h*k)*cos(q1+q7) + (m7*l1*k - m7*h*l7c)*sin(q1+q7)) +              w2*w2*(-(m2*l2c/l2+m3+m4+m5+m6+m7)*l1*l2*sin(q1+q2) - (m2*l2c/l2+m3+m4+m5+m6+m7)*h*l2*cos(q1+q2)) +             w3*w3*(-(m3*l3c/l3 +m4+m5+m6+m7)*l1*l3*sin(q1+q3) - (m3*l3c/l3+m4+m5+m6+m7)*h*l3*cos(q1+q3)) +              w4*w4*(-m4*l1*l4c*sin(q1+q4) - m4*h*l4c*cos(q1+q4)) +              w5*w5*((-m5+m5*l5c/l5-m6-m7)*l1*l5*sin(q1-q5) - (m5-m5*l5c/l5 + m6+m7)*h*l5*cos(q1-q5)) +  w6*w6*((-m6+m6*l6c/l6-m7)*l1*l6*sin(q1-q6) - (m6-m6*l6c/l6 +m7)*h*l6*cos(q1-q6)) + w7*w7*((m7*l1*k + m7*h*l7c)*cos(q1+q7) - (m7*l1*l7c + m7*h*k)*sin(q1+q7)) + g*cos(q1)*l1*(m1*l1c/l1+m3+m4+m5+m6+m7) - g*sin(q1)*h*(m2+m3+m4+m5+m6+m7);

        Torque(1,10*t+i)=M1;
    
        
        plot(10*t+i,Torque(1,10*t+i),'.');
        hold on;
        
        end

    end

     