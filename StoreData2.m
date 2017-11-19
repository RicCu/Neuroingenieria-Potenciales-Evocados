function StoreData2(src, evt, size)
%n=s.ScansAquired;
global data
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
%p=(n/250)*2;

p=(n/2000);
%data(:,p-1:p)=tempData;
data(:,p)=tempData;
%[cumAvg, n_cum] = cum_avg(tempData', cumAvg, n_cum);
%figure
%plot(evt.Data)
%dlmwrite('experiment_average.csv', cumAvg, '-append');
dlmwrite('experiment.csv', tempData', '-append');
% s2 = xor(s2, 1);
% [c0, c1, img] = StimulateVision(s2, c0, c1, img, size);
%toc
end