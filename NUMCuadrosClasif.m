close all
clear all

data4=csvread('calsificador_4ET4size20NE_uno_4sec.csv');
data32=csvread('calsificador_4ET32size20NE_uno_4sec.csv');
data4P=csvread('calsificador_4ET4size15NE_uno_4secPAB.csv');
data32P=csvread('calsificador_4ET32size20NE_uno_4secPAB.csv');

x(1,:)=data4(1,:);
y(1,:)=data4(2,:);
z(1,:)=data4(3,:);

xr(1,:)=data4(4,:);
yr(1,:)=data4(5,:);
zr(1,:)=data4(6,:);

x3(1,:)=data4P(4,:);
y3(1,:)=data4P(5,:);
z3(1,:)=data4P(6,:);

scatter3(x,y,z, 'o');


x1(1,:)=data32(1,:);
y1(1,:)=data32(2,:);
z1(1,:)=data32(3,:);

hold on
scatter3(xr,yr,zr, '+');

hold on
scatter3(x1,y1,z1, '.');

PromData4=mean(data4,2);
PromData8=mean(data8,2);
PromData16=mean(data16,2);
PromData32=mean(data32,2);

Prom=[PromData4 PromData8 PromData16 PromData32];