data=csvread('4ET32size10NE_uno.csv');
fs=500;
totalSamples=length(data);
dt=1/fs;
TimeVECT=(dt:dt:totalSamples/fs);
plot(TimeVECT,data)
