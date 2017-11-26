%%PRUEBA de codigo para deteccion de picos con señal real
data=csvread('pruebaREAL.csv');
PromCanal1=transpose(data(1,:));
PromCanal1=PromCanal1-mean(PromCanal1);
PromCanal2=transpose(data(2,:));
PromCanal2=PromCanal2-mean(PromCanal2);
fs=500;
[b,a]=butter(6,30/(fs/2),'low'); %Filter design



%% Análisis señal 
rango=25;

% [s,e]=size(data1);

% BlackDATA1=data1(:,1); %get sample of black screen data to calculate gain 
% BASEBlackDATA1=mean(BlackDATA1);
% BlackDATA2=data2(:,1); %get sample of black screen data to calculate gain 
% BASEBlackDATA2=mean(BlackDATA2);
% 
% REFC1=BASEBlackDATA1;  %%Cambiar a real
% REFC2=BASEBlackDATA2;
% 
% Gain1=BASEBlackDATA1/REFC1;  %change to baseblack data when gain is zero
% Gain2=BASEBlackDATA2/REFC2;  %change to baseblack data when gain is zero
% 
% FiltData1=filtfilt(b,a,data1(:,4:e));
% FiltData2=filtfilt(b,a,data2(:,4:e));
% 
% 
% PromCanal1=mean(FiltData1);
% PromCanal2=mean(FiltData2);
% 
% PromDATA(:,1:2)=[PromCanal1 , PromCanal2];
% dlmwrite('prueba.csv', PromDATA');

tvect=1000*(1:length(PromCanal1))/fs; 

%Canal 1
%Find P100
[Ax1P100,Ix1P100] = min(PromCanal1(20:120)); %%Análisis señal canal 1
Ix1P100=Ix1P100+20;
tx1P100=tvect(Ix1P100);

%Find N75 and N145 
[Ax1N75,Ix175] = max(PromCanal1(Ix1P100-rango:Ix1P100));

tx1N75=tvect(Ix175+Ix1P100-rango);


[AxN145,Ix1145] = max(PromCanal1(Ix1P100:Ix1P100+rango));
tx1N145=tvect(Ix1P100+Ix1145);


dly1P100=tx1P100-100;

%Canal 2
%Find P100
[Ax2P100,Ix2P100] = min(PromCanal2(20:120)); %%Análisis señal canal 2
Ix2P100=Ix2P100+20;
tx2P100=tvect(Ix2P100);

%Find N75 and N145 
[Ax2N75,Ix275] = max(PromCanal2(Ix2P100-rango:Ix2P100));

tx2N75=tvect(Ix275+Ix2P100-rango);


[Ax2N145,Ix2145] = max(PromCanal2(Ix2P100:Ix2P100+rango));
tx2N145=tvect(Ix2P100+Ix2145);


dly2P100=tx2P100-100;

figure
plot(tvect,PromCanal2, tx2P100,Ax2P100,'+',tx2N75, Ax2N75, '+',tx2N145,Ax2N145,'+' )
figure
plot(tvect,PromCanal1, tx1P100,Ax1P100,'+',tx1N75, Ax1N75, '+',tx1N145,AxN145,'+' )

Resultados=[Ax1P100 tx1P100  tx1N75 tx1N145  dly1P100; Ax2P100 tx2P100 tx2N75 tx2N145 dly2P100];
