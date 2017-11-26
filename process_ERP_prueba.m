function [] = process_ERP_prueba(cuadros, sec)

global data1
global data2
fs=500;
d = daq.getDevices;
s = daq.createSession('ni');
addAnalogInputChannel(s,'Dev1',[0 1], 'Voltage');
s.Rate = fs;
s.DurationInSeconds=sec;

lh=addlistener(s,'DataAvailable',@(src,event)StoreDataPrueba(src, event, cuadros));

s.NotifyWhenDataAvailableExceeds = 250;
startBackground(s);

wait(s);
delete(lh);

release(s)


%% Análisis señal 
rango=25;
PromCanal1=mean(data1,2);
PromCanal2=mean(data2,2);

REFC1=PromCanal1;  %%Cambiar a 
REFC2=PromCanal2;

%CANAL 1

BASELINEPromCanal1=mean(PromCanal1);

tvect=1000*(1:length(PromCanal1))/fs; 

PromDATA(:,1:2)=[PromCanal1 , PromCanal2];
dlmwrite('prueba.csv', PromDATA');

%Find P100
[Ax1P100,Ix1P100] = min(PromCanal1(20:120)); %%Análisis señal canal 1
tx1P100=tvect(Ix1P100);

%Find N75 and N145 
[Ax1N75,Ix175] = max(PromCanal1(Ix1P100-rango:Ix1P100));

tx1N75=tvect(Ix175);


[AxN145,Ix1145] = max(PromCanal1(Ix1P100:Ix1P100+rango));
tx1N145=tvect(Ix1P100+Ix1145);


dly1P100=tx1P100-100;




Resultados=[Ax1P100 tx1P100  tx1N75 tx1N145  dly1P100; 10 20 30 40 50];

dlmwrite('resultados.csv', Resultados);
clear all
end