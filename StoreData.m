function StoreData(src, evt, size)
%n=s.ScansAquired;
global data1
global data2

global s2
global c0
global c1
global img
global cumAvg
global n_cum
%tic
tempData= evt.Data;
%tempData=[evt.TimeStamps, evt.Data];
n=src.ScansAcquired;
%p=(n/250);

p=(n/250);
%data(:,p-1:p)=tempData;
data1(:,p)=tempData(:,1);
data2(:,p)=tempData(:,2);
%[cumAvg, n_cum] = cum_avg(tempData', cumAvg, n_cum);
%figure
%plot(evt.Data)
%dlmwrite('experiment_average.csv', cumAvg, '-append');
dlmwrite('prueba.csv', tempData');
% s2 = xor(s2, 1);
% [c0, c1, img] = StimulateVision(s2, c0, c1, img, size);
%toc
end