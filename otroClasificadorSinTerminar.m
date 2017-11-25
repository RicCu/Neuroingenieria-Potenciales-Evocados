close all
clear all

% data4=csvread('clasificadorcanal1:4seg4cuad8EstimPabloJuev.csv');
% data32=csvread('clasificadorcanal1:4seg32cuad8EstimPabloJuev.csv');


% data4C2=csvread('clasificadorcanal2:4seg4cuad15EstimPabloJuev.csv');
% data4Comp=csvread('clasificadorcanal2:4seg4cuad8EstimPabloJuev2.csv');
% data4Comp2=csvread('clasificadorcanal2:4seg4cuad15EstimPabloJuev3.csv');
data4Comp3=csvread('Clasificador_Secuencia1_4.csv');
data4Comp4=csvread('Clasificador_Secuencia2_4.csv');


data4C2=[data4Comp3, data4Comp4];

%data4C2=[data4C2(1:5,:), data4Comp(1:5,:), data4Comp2(1:5,:), data4Comp3, data4Comp4];
% 
% data32C2=csvread('clasificadorcanal2:4seg32cuad15EstimPabloJuev.csv');
% data32Comp=csvread('clasificadorcanal2:4seg32cuad8EstimPabloJuev2.csv');
% data32Comp2=csvread('clasificadorcanal2:4seg32cuad15EstimPabloJuev3.csv');
data32Comp3=csvread('Clasificador_Secuencia1_32.csv');
data32Comp4=csvread('Clasificador_Secuencia2_32.csv');

data32C2=[ data32Comp3, data32Comp4];

%data32C2=[data32C2(1:5,:),data32Comp(1:5,:), data32Comp2(1:5,:), data32Comp3, data32Comp4];

 xC2(1,:)=data4C2(1,:);
 yC2(1,:)=data4C2(2,:);
 zC2(1,:)=data4C2(5,:);
 hold on
 scatter3(xC2,yC2, zC2, '+');
 
%  xC2(1,:)=data4Comp(1,:);
%  yC2(1,:)=data4Comp(2,:);
%  zC2(1,:)=data4Comp(5,:);
%  hold on
%  scatter3(xC2,yC2, zC2, '+');
 
 x2C2(1,:)=data32C2(1,:);
 y2C2(1,:)=data32C2(2,:);
 z2C2(1,:)=data32C2(5,:);
 hold on
 scatter3(x2C2, y2C2,z2C2, '+');
 
%  x2C2(1,:)=data32Comp(1,:);
%  y2C2(1,:)=data32Comp(2,:);
%  z2C2(1,:)=data32Comp(5,:);
%  hold on
%  scatter3(x2C2, y2C2,z2C2, '+');
%  
 Data4=[xC2;yC2;zC2];
 Data32=[x2C2;y2C2;z2C2];
 
 Total=length(Data4)+length(Data32);
 Casos=zeros(2,Total);
 
 ClasifDATA=[Data4,Data32];
 Casos(1, 1:length(Data4))=1;
 Casos(2, length(Data4)+1:Total)=1;
 
 