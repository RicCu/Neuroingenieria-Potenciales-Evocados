function [] = process_ERP(size, sec)
%UNTITLED2 Summary of this function goes here
%   Args:
%       size (number of tiles in checkerboard)
%       sec (real scalar): duration of experiment

%clear all
%close all
global data1
global data2

global s2
global c0
global c1
global img
global cumAvg
global n_cum
z=0;
s2 = 0;
c0 = -1;
c1 = -1;
img = -1;
cumAvg = zeros(1, 250);
n_cum = 0;

fs=500;
d = daq.getDevices;
s = daq.createSession('ni');
addAnalogInputChannel(s,'Dev1',[0 1], 'Voltage');
s.Rate = fs;
s.DurationInSeconds=sec;

[b,a]=butter(6,2/(fs/2),'high'); %Filter design

lh=addlistener(s,'DataAvailable',@(src,event)StoreData(src, event, size));
%lh2=addlistener(s,'DataAvailable',@(src,event)StimulateVision(s2, c0, c1, img));


s.NotifyWhenDataAvailableExceeds = 250;
startBackground(s);

while(~s.IsDone)
    z=z+1;
    s2 = xor(s2, 1);
    %timepre(z)=s.ScansAcquired;
    [c0, c1, img] = StimulateVision(s2, c0, c1, img, size);
    time(z)=(s.ScansAcquired);
     pause(.5)
end

wait(s);
delete(lh);
release(s)

FiltData1=filtfilt(b,a,data1);
FiltData2=filtfilt(b,a,data2);


PromCanal1=mean(FiltData1,2);
PromCanal2=mean(FiltData2,2);


%sprom=mean(data,2);
%figure
%plot(sprom)
%figure
%plot(cumAvg)
PromDATA(:,1:2)=[PromCanal1 , PromCanal2];
dlmwrite('prueba.csv', PromDATA');

% dlmwrite('average.csv', sprom, '-append');
% plot(time)
% 
% FiltData=filtfilt(b,a,data);
% 
% spromFilt=mean(FiltData,2);
figure
plot(sprom)
% hold on
% plot (spromFilt)
%clear all
%exit
Resultados=[ 1 2 3 4 5; 10 20 30 40 50];

dlmwrite('resultados.csv', Resultados);
clear all
end

