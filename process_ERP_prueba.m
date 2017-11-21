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
% pruebas=
% 
%  for i=1:1:prueb
%      cont=250*i;
%      cont2=i*2;
%      canal1(cont-249:cont,1)=data(:,cont2-1);
%      canal2(cont-249:cont,1)=data(:,cont2);
%  end
PromCanal1=mean(data1,2);
PromCanal2=mean(data2,2);

PromDATA(:,1:2)=[PromCanal1 , PromCanal2];
dlmwrite('prueba.csv', PromDATA');


Resultados=[ 1 2 3 4 5; 10 20 30 40 50];

dlmwrite('resultados.csv', Resultados);
clear all
end