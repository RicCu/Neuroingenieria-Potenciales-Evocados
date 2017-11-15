data=csvread('alfa.csv');
[r,c]=size(data);

fs=500;
Wl=7/(fs/2);
Wu=14/(fs/2);

[b,a]=butter(6,[Wl,Wu]); %Filter design
Signal=filtfilt(b,a,data);
plot(Signal);
% 
% for i= 1:1:r
%     Signal=transpose(data(i,:));
%     FiltSignal=filtfilt(b,a,Signal);
%     DATA(:,i)=FiltSignal;
%     
% end
% 
% meanDATA=mean(DATA,2);