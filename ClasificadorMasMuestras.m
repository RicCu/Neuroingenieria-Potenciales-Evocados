close all
clear all



data4C2=csvread('clasificadorcanal2:4seg4cuad15EstimPabloJuev.csv');
% data4Comp=csvread('clasificadorcanal2:4seg4cuad8EstimPabloJuev.csv');
% data4C2=[data4C2, data4Comp];

data32C2=csvread('clasificadorcanal2:4seg32cuad15EstimPabloJuev.csv');
% data32Comp=csvread('clasificadorcanal2:4seg32cuad8EstimPabloJuev.csv');
% data32C2=[data32C2,data32Comp];

 xC2(1,:)=data4C2(1,:);
 yC2(1,:)=data4C2(2,:);
 zC2(1,:)=data4C2(5,:);
 hold on
 scatter3(xC2,yC2, zC2, '+');
 
 x2C2(1,:)=data32C2(1,:);
 y2C2(1,:)=data32C2(2,:);
 z2C2(1,:)=data32C2(5,:);
 hold on
 scatter3(x2C2, y2C2,z2C2, '+');
 
 Data4=[xC2;yC2;zC2];
 Data32=[x2C2;y2C2;z2C2];
 
 Total=length(Data4)+length(Data32);
 Casos2=zeros(2,Total);
 
 ClasifDATA2=[Data4,Data32];
 Casos2(1, 1:length(Data4))=1;
 Casos2(2, length(Data4)+1:Total)=1;
 