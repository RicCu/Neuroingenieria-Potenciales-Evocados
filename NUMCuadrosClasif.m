close all
clear all

data4=csvread('calsificador_4ET4size20NE_uno.csv');
data8=csvread('calsificador_4ET8size20NE_uno.csv');
data16=csvread('calsificador_4ET16size20NE_uno.csv');
data32=csvread('calsificador_4ET32size20NE_uno.csv');

x(1,:)=data4(1,:);
y(1,:)=data4(2,:);
z(1,:)=data4(3,:);

scatter3(x,y,z, 'filled');


x1(1,:)=data32(1,:);
y1(1,:)=data32(2,:);
z1(1,:)=data32(3,:);

hold on
scatter3(x1,y1,z1, 'filled');



PromData4=mean(data4,2);
PromData8=mean(data8,2);
PromData16=mean(data16,2);
PromData32=mean(data32,2);

Prom=[PromData4 PromData8 PromData16 PromData32];