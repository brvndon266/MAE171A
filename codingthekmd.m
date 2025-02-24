
V3=[5.145,1896,5.696,1049,1259];
V4=[5.143, 1822,5.689 ,1021 ,1226];
V5=[ 5.142, 1830, 5.687, 1063,1276];
V6=[ 5.142,1802 ,5.688 ,1004 ,1200];
V7=[ 5.143, 1869, 5.69, 1050,1267];
n=2;
U=[3,4,5,6,7];
% T0=1 Y0=2 TN=3 YINF=4 YN=5
WD(1)=2*pi*(n/(V3(3)-V3(1)));
WD(2)=2*pi*(n/(V4(3)-V4(1)));
WD(3)=2*pi*(n/(V5(3)-V5(1)));
WD(4)=2*pi*(n/(V6(3)-V6(1)));
WD(5)=2*pi*(n/(V7(3)-V7(1)));
BWD(1)=1/(V3(3)-V3(1))*log((V3(2)-V3(4))/(V3(5)-V3(4)));
BWD(2)=1/(V4(3)-V4(1))*log((V4(2)-V4(4))/(V4(5)-V4(4)));
BWD(3)=1/(V5(3)-V5(1))*log((V5(2)-V5(4))/(V5(5)-V5(4)));
BWD(4)=1/(V6(3)-V6(1))*log((V6(2)-V6(4))/(V6(5)-V6(4)));
BWD(5)=1/(V7(3)-V7(1))*log((V7(2)-V7(4))/(V7(5)-V7(4)));
for i=1:5
    wn(i)=sqrt(WD(i).^2+BWD(i).^2);
    B(i)=BWD(i)./wn(i);
    
end
k(1)=U(1)/V3(4);
k(2)=U(2)/V4(4);
k(3)=U(3)/V5(4);
k(4)=U(4)/V6(4);
k(5)=U(5)/V7(4);
for i=1:5
    m(i)=k(i)./(wn(i).^2);
    d(i)=k(i)*2*B(i)/(wn(i));
end
kh=mean(k) %V/d.c.
m1=mean(m) %k/wn^2
d1=mean(d) %
wn1=mean(wn)
gs=tf([1],[m1,d1,kh])
B1=mean(B)
wd1=mean(WD)
figure (1)
%step(gs)
hold on
plot(time,enc1)
gr=max(enc1);
t0=time((find(gr==enc1)));
syms s
phi=atan(sqrt(1-B1^2)/B1);
y = U(3)./kh.*(1-exp(-B1.*wn1.*(time)).*sin(wd1.*(time)+phi));
plot(time+5, y)



%%
figure ()
plot (time,enc1)
% y0 = input('y0')
% yn = input('yn')
% t0=input('t0')
% yinf=input('yinf')
% tn=input('tn')
k1t=[3/1781, 4/1753,5/1763, 6/1777, 7/1783];
k1=mean(k1t)
k2=kh-k1

%%
figure ()
plot(time,enc2)
V3=[7.33, 5211, 8.131, 27, 3394];
V4=[5.242, 4308,6.04 ,-31 ,2633];
V5=[ 7.119, 4815, 7.919, -60,3009];
V6=[ 6.166,6231 ,6.964 ,12 ,4246];
n=2;
% T0=1 Y0=2 TN=3 YINF=4 YN=5
WD1(1)=2*pi*(n/(V3(3)-V3(1)));
WD1(2)=2*pi*(n/(V4(3)-V4(1)));
WD1(3)=2*pi*(n/(V5(3)-V5(1)));
WD1(4)=2*pi*(n/(V6(3)-V6(1)));
BWD1(1)=1/(V3(3)-V3(1))*log((V3(2)-V3(4))/(V3(5)-V3(4)));
BWD1(2)=1/(V4(3)-V4(1))*log((V4(2)-V4(4))/(V4(5)-V4(4)));
BWD1(3)=1/(V5(3)-V5(1))*log((V5(2)-V5(4))/(V5(5)-V5(4)));
BWD1(4)=1/(V6(3)-V6(1))*log((V6(2)-V6(4))/(V6(5)-V6(4)));
for i=1:4
    wn1(i)=sqrt(WD1(i).^2+BWD1(i).^2);
    B1(i)=BWD1(i)./wn1(i);
    
end
k(1)=U(1)/V3(4);
k(2)=U(2)/V4(4);
k(3)=U(3)/V5(4);
k(4)=U(4)/V6(4);
for i=1:4
    m(i)=k2./(wn1(i).^2);
    d(i)=k2*2*B1(i)/(wn1(i));
end

    B1=BWD1./wn1;
    m2=mean(m)
    d2=mean(d)
    % k=U(1)/V3(4);