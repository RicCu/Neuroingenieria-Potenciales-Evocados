close all
clear all

data4=csvread('clasificadorcanal2:4seg32cuad20Estim.csv');
data32=csvread('clasificadorcanal2:4seg4cuad20Estim.csv');
data4P=csvread('clasificadorcanal2:4seg4cuad15EstimPAB.csv');
data32P=csvread('clasificadorcanal2:4seg32cuad15EstimPAB.csv');



% x(1,:)=[data4P(1,:),data32P(1,:)] ;
% y(1,:)=[data4P(2,:),data32P(2,:)]  ;
% z(1,:)=[data4P(3,:),data32P(3,:)] ;


x(1,:)=[data4(1,:),data32(1,:)] ;
y(1,:)=[data4(2,:),data32(2,:)]  ;
z(1,:)=[data4(3,:),data32(3,:)] ;

Data4=[x;y;z];
% Caso4(1,1:length(Data4))=1;


% xw(1,:)=[data4P(4,:),data32P(4,:)];
% yw(1,:)=[data4P(5,:),data32P(5,:)];
% zw(1,:)=[data4P(6,:),data32P(6,:)];

xw(1,:)=[data4(4,:),data32(4,:)];
yw(1,:)=[data4(5,:),data32(5,:)];
zw(1,:)=[data4(6,:),data32(6,:)];

Data4W=[xw;yw;zw];
% Caso4W(1,1:length(Data4W))=1;

x2(1,:)=data32P(1,:);
y2(1,:)=data32P(2,:);
z2(1,:)=data32P(3,:);

% Data32=[x2;y2;z2];
% 
scatter3(x,y,z, 'o');


xw2(1,:)=data32P(4,:);
yw2(1,:)=data32P(5,:);
zw2(1,:)=data32P(6,:);

Data32W=[xw2;yw2;zw2];


%  hold on
%   scatter3(xw2,yw2,zw2, '+');

  
hold on
scatter3(xw,yw,zw, '*');



Total=length(Data4)+length(Data4W)+length(Data32)+length(Data32W);
Casos=zeros(3,Total);

% hold on
% scatter3(xw,yw,zw, 'filled');

ClasifDATA=[Data4,Data4W,Data32W,Data32];
Casos(1, 1:length(Data4))=1;
Casos(2, length(Data4)+1:length(Data4)+length(Data4W)+length(Data32W))=1;
Casos(3, Total-length(Data32)+1:Total)=1;

