% close all
% clear all



data4C2=csvread('clasificadorcanal2:4seg4cuad15EstimPabloJuev3.csv');
% data4Comp=csvread('clasificadorcanal2:4seg4cuad8EstimPabloJuev.csv');
% data4C2=[data4C2, data4Comp];

data32C2=csvread('clasificadorcanal2:4seg32cuad15EstimPabloJuev3.csv');
% data32Comp=csvread('clasificadorcanal2:4seg32cuad8EstimPabloJuev.csv');
% data32C2=[data32C2,data32Comp];

 xC3(1,:)=data4C2(1,:);
 yC3(1,:)=data4C2(2,:);
 zC3(1,:)=data4C2(5,:);
 hold on
 scatter3(xC3,yC3, zC3, '+');
 
 x2C3(1,:)=data32C2(1,:);
 y2C3(1,:)=data32C2(2,:);
 z2C3(1,:)=data32C2(5,:);
 hold on
 scatter3(x2C3, y2C3,z2C3, '+');
 
 Data4=[xC3;yC3;zC3];
 Data32=[x2C3;y2C3;z2C3];
 
 Total=length(Data4)+length(Data32);
 Casos2=zeros(2,Total);
 
 ClasifDATA2=[Data4,Data32];
 Casos2(1, 1:length(Data4))=1;
 Casos2(2, length(Data4)+1:Total)=1;
 