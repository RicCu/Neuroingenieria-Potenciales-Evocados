DATA=csvread('experiment70_16_2.5.csv');
fs=500;
[p,ms]=size(DATA);
BlackData=DATA(1:5,:);
StimData=DATA(6:p,:);
[p2,ms2]=size(StimData);
[b,a]=butter(6,20/(fs/2),'low'); %Filter design
FiltData=filtfilt(b,a,transpose(StimData));

meanData=mean(StimData);
meanFilt=mean(FiltData,2);
figure
plot(meanFilt)
for i=1:1:p2
cont=i*250;
s=StimData(i,:);
Signal(1, (cont-249):cont)=s;
end

%S=spectrogram(Signal);
