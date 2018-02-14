close all
clear all

data4=csvread('clasificadorcanal1:4seg34uad20EstimRi.csv');
data32=csvread('clasificadorcanal1:4seg32cuad20EstimRi.csv');

% data48EST=csvread('clasificadorcanal1:4seg4cuad8EstimPAB.csv');
% data328EST=csvread('clasificadorcanal1:4seg32cuad8EstimPAB.csv');

data4C2=csvread('clasificadorcanal2:4seg32cuad20EstimRi.csv');
data32C2=csvread('clasificadorcanal2:4seg34uad20EstimRi.csv');

% data4C28EST=csvread('clasificadorcanal2:4seg4cuad8EstimPAB.csv');
% data32C28EST=csvread('clasificadorcanal2:4seg32cuad8EstimPAB.csv');

%  x(1,:)=[data4(1,:),data48EST(1,:)];
%  y(1,:)=[data4(2,:),data48EST(2,:)];
%  z(1,:)=[data4(3,:),data48EST(3,:)];
%  scatter3(x,y,z, 'o');
 %%
 x(1,:)=data4(1,:);
 y(1,:)=data4(2,:);
 z(1,:)=data4(5,:);
 scatter3(x,y,z, 'o');
%%
% xw(1,:)=[data4(4,:),data48EST(4,:)];
% yw(1,:)=[data4(5,:),data48EST(5,:)];
% zw(1,:)=[data4(6,:),data48EST(6,:)];
% hold on
% scatter3(xw,yw,zw, '*');

xw(1,:)=data4(6,:);
yw(1,:)=data4(9,:);
zw(1,:)=data4(10,:);
hold on
scatter3(xw,yw,zw, '*');
%%

 xC2(1,:)=data4C2(1,:);
 yC2(1,:)=data4C2(2,:);
 zC2(1,:)=data4C2(5,:);
 hold on
 scatter3(xC2,yC2, zC2, '+');
 
%%
% xwC2(1,:)=[data4C2(4,:), data4C28EST(4,:)];
% ywC2(1,:)=[data4C2(5,:), data4C28EST(5,:)];
% zwC2(1,:)=[data4C2(6,:), data4C28EST(6,:)];
% hold on
% scatter3(xwC2,ywC2,zwC2, '*');

xwC2(1,:)=data4C2(6,:);
ywC2(1,:)=data4C2(9,:);
zwC2(1,:)=data4C2(10,:);
hold on
scatter3(xwC2,ywC2,zwC2, '+');


%%
 x2(1,:)=data32(1,:);
 y2(1,:)=data32(2,:);
 z2(1,:)=data32(5,:);
 hold on
 scatter3(x2,y2,z2, '+');
 
%%
xw2(1,:)=data32(8,:);
yw2(1,:)=data32(9,:);
zw2(1,:)=data32(10,:);
hold on
scatter3(xw2,yw2,zw2, '*');
%%

 x2C2(1,:)=data32C2(1,:);
 y2C2(1,:)=data32C2(2,:);
 z2C2(1,:)=data32C2(5,:);
 hold on
 scatter3(x2C2, y2C2,z2C2, '+');
 
%%
xw2C2(1,:)=data32C2(6,:);
yw2C2(1,:)=data32C2(9,:);
zw2C2(1,:)=data32C2(10,:);
hold on
scatter3(xw2C2,yw2C2,zw2C2, '+');

%%
% x(1,:)=[data4P(1,:),data32P(1,:)] ;
% y(1,:)=[data4P(2,:),data32P(2,:)]  ;
% z(1,:)=[data4P(3,:),data32P(3,:)] ;

% 
% x(1,:)=[data4(1,:),data32(1,:)] ;
% y(1,:)=[data4(2,:),data32(2,:)]  ;
% z(1,:)=[data4(3,:),data32(3,:)] ;

% Data4=[x;y;z];
% Caso4(1,1:length(Data4))=1;


% xw(1,:)=[data4P(4,:),data32P(4,:)];
% yw(1,:)=[data4P(5,:),data32P(5,:)];
% zw(1,:)=[data4P(6,:),data32P(6,:)];

% xw(1,:)=[data4(4,:),data32(4,:)];
% yw(1,:)=[data4(5,:),data32(5,:)];
% zw(1,:)=[data4(6,:),data32(6,:)];
% 
% Data4W=[xw;yw;zw];
% Caso4W(1,1:length(Data4W))=1;
% 
% x2(1,:)=data32P(1,:);
% y2(1,:)=data32P(2,:);
% z2(1,:)=data32P(3,:);

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

