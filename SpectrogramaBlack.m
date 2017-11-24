close all;
clear all;
data=csvread('clasificador_seq1_4.csv');
data=data(2,:);
fs=500;

NumEstim=15;
totalSamples=length(data);
dt=1/fs;
TimeVECT=(dt:dt:totalSamples/fs);
plot(TimeVECT,data)
SMatrix=zeros(NumEstim, 3);
spectrogram(data(1,12001:14000),2000,20,[1:1:100],500,'yaxis')
figure
spectrogram(data(1,14001:16000),2000,20,[1:1:100],500,'yaxis')

for i=1:1:NumEstim 
    cont=i*4000;
    if i==1
    estimDATA=data(1,cont-1999:cont);
    blackDATA=data(1,cont-3999:cont-2000);
    else
    estimDATA=[estimDATA, data(1,cont-1999:cont)]; 
    blackDATA=[blackDATA, data(1,cont-3999:cont-2000)];
    end
end

figure
spectrogram(estimDATA,2000,20,[1:1:100],500,'yaxis');
[spec_raw1, fspec1, tspec1]=spectrogram(estimDATA,2000,20,[1:1:100],500,'yaxis');
abs_spec_raw1=abs(spec_raw1); 


del_the1=abs_spec_raw1((1:7),:);      % Separación manal por bandas de EEG (delta+teta/alfa/beta) 
alpha1=abs_spec_raw1((8:13),:);
betha1=abs_spec_raw1((14:31),:);
ABetha=abs_spec_raw1((32:59),:);
BBetha=abs_spec_raw1((61:80),:);

figure
spectrogram(blackDATA,2000,20,[1:1:100],500,'yaxis');
[spec_raw2, fspec2, tspec2]=spectrogram(blackDATA,2000,20,[1:1:100],500,'yaxis');
abs_spec_raw2=abs(spec_raw2); 


del_the2=abs_spec_raw2((1:7),:);      % Separación manal por bandas de EEG (delta+teta/alfa/beta) 
alpha2=abs_spec_raw2((8:13),:);
betha2=abs_spec_raw2((14:31),:);
ABetha2=abs_spec_raw2((32:59),:);
BBetha2=abs_spec_raw2((61:80),:);


clasificador_array=zeros(10,(NumEstim));

for i=1:1:(NumEstim)
    del_prom=mean(del_the1(:,i));     % Al tener varias ventas (en el tiempo) se hace el valor promedio de la señal y se guarda en
    alp_prom=mean(alpha1(:,i));       % el vector de datos clasificador_array que contenia puros ceros
    bet_prom=mean(betha1(:,i));
    ABetha_prom=mean(ABetha(:,i));
    BBetha_prom=mean(BBetha(:,i));
 
    del_prom2=mean(del_the2(:,i));    
    alp_prom2=mean(alpha2(:,i));       
    bet_prom2=mean(betha2(:,i));
    ABetha_prom2=mean(ABetha2(:,i));
    BBetha_prom2=mean(BBetha2(:,i));
    
    clasificador_array(6,i)=del_prom2;
    clasificador_array(7,i)=alp_prom2;
    clasificador_array(8,i)=bet_prom2;
    clasificador_array(9,i)=ABetha_prom2;
    clasificador_array(10,i)=BBetha_prom2;
   
    
    clasificador_array(1,i)=del_prom;
    clasificador_array(2,i)=alp_prom;
    clasificador_array(3,i)=bet_prom;
    clasificador_array(4,i)=ABetha_prom;
    clasificador_array(5,i)=BBetha_prom;
    
    
end







% clasificador_array1=zeros(3,(NumEstim*2));
% 
% [spec_raw1, fspec1, tspec1]=spectrogram(estimData,2000,2,[1:1:50],500,'yaxis');
% abs_spec_raw1=abs(spec_raw1); 
% 
% 
% del_the1=abs_spec_raw1((1:6),:);      % Separación manal por bandas de EEG (delta+teta/alfa/beta) 
% alpha1=abs_spec_raw1((7:9),:);
% betha1=abs_spec_raw1((10:31),:);


% 
% for i=1:1:NumEstim
%     cont=i*2500;
%     estimData(
%     
% end