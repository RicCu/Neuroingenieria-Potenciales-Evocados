close all;
clear all;
data=csvread('4   4   4  32  32  32   4   4  32  32   4   4   4   4  32  32  332seq4sec_uno2   4   4  32  _4sec_Pab_Jueves.csv');
data=data(2,:);
fs=500;

totalSamples=length(data);
NumEstim=(totalSamples/2000)/2;

dt=1/fs;
TimeVECT=(dt:dt:totalSamples/fs);
plot(TimeVECT,data)
SMatrix=zeros(NumEstim, 3);
EstimSamp=2000;
Estim=0;
EstimVECT= zeros (NumEstim, 1);


for i = 1:1:NumEstim
    cont=i*4000;
    if i ==1
       Estim= data(1,cont-1999:cont);
       EstimVECT(i,1:2000)=Estim;
    else
        EstimPR= data(1,cont-1999:cont);
        Estim= [Estim, EstimPR];
        
        EstimVECT(i,:)=EstimPR;
    end

end




% CUATRO=[EstimVECT(1,:), EstimVECT(3,:), EstimVECT(5,:), EstimVECT(6,:), EstimVECT(9,:), EstimVECT(10,:)];
% TREINTAYDOS=[EstimVECT(2,:), EstimVECT(4,:), EstimVECT(7,:), EstimVECT(8,:)];

CUATRO=[EstimVECT(1,:), EstimVECT(2,:), EstimVECT(3,:), EstimVECT(7,:), EstimVECT(8,:), EstimVECT(11,:),EstimVECT(12,:),EstimVECT(13,:),EstimVECT(14,:),EstimVECT(18,:),EstimVECT(19,:)];
TREINTAYDOS=[EstimVECT(4,:), EstimVECT(5,:), EstimVECT(6,:), EstimVECT(9,:),EstimVECT(10,:),EstimVECT(15,:),EstimVECT(16,:), EstimVECT(17,:),EstimVECT(20,:),EstimVECT(21,:)];


% dlmwrite('clasificador_seq1_4.csv',CUATRO);
% dlmwrite('clasificador_seq1_32.csv',TREINTAYDOS);

spectrogram(CUATRO,2000,20,[1:1:100],500,'yaxis')
[spec_raw1, fspec1, tspec1]=spectrogram(CUATRO,2000,20,[1:1:100],500,'yaxis');
abs_spec_raw1=abs(spec_raw1); 

figure
spectrogram(TREINTAYDOS,2000,20,[1:1:100],500,'yaxis')
[spec_raw2, fspec2, tspec2]=spectrogram(TREINTAYDOS,2000,20,[1:1:100],500,'yaxis');
abs_spec_raw2=abs(spec_raw2); 

figure
spectrogram(Estim,2000,20,[1:1:100],500,'yaxis')
[spec_raw, fspec, tspec]=spectrogram(Estim,2000,20,[1:1:100],500,'yaxis');
abs_spec_raw=abs(spec_raw); 

del_the1=abs_spec_raw1((1:7),:);      % Separación manal por bandas de EEG (delta+teta/alfa/beta) 
alpha1=abs_spec_raw1((8:13),:);
betha1=abs_spec_raw1((14:31),:);
ABetha1=abs_spec_raw1((32:59),:);
BBetha1=abs_spec_raw1((61:80),:);

del_the2=abs_spec_raw2((1:7),:);      % Separación manal por bandas de EEG (delta+teta/alfa/beta) 
alpha2=abs_spec_raw2((8:13),:);
betha2=abs_spec_raw2((14:31),:);
ABetha2=abs_spec_raw2((32:59),:);
BBetha2=abs_spec_raw2((61:80),:);


del_the=abs_spec_raw((1:7),:);      % Separación manal por bandas de EEG (delta+teta/alfa/beta) 
alpha=abs_spec_raw((8:13),:);
betha=abs_spec_raw((14:31),:);
ABetha=abs_spec_raw((32:59),:);
BBetha=abs_spec_raw((61:80),:);

NumEstim4=length(CUATRO)/2000;
NumEstim32=length(TREINTAYDOS)/2000;

clasificador_array4=zeros(5,NumEstim4);
clasificador_array32=zeros(5,NumEstim32);
clasificador_array=zeros(5,NumEstim);

for i=1:1:(NumEstim4)
    
    del_prom1=mean(del_the1(:,i));     % Al tener varias ventas (en el tiempo) se hace el valor promedio de la señal y se guarda en
    alp_prom1=mean(alpha1(:,i));       % el vector de datos clasificador_array que contenia puros ceros
    bet_prom1=mean(betha1(:,i));
    ABetha_prom1=mean(ABetha1(:,i));
    BBetha_prom1=mean(BBetha1(:,i));

    
    clasificador_array4(1,i)=del_prom1;
    clasificador_array4(2,i)=alp_prom1;
    clasificador_array4(3,i)=bet_prom1;
    clasificador_array4(4,i)=ABetha_prom1;
    clasificador_array4(5,i)=BBetha_prom1;
    
    
end

for i=1:1:(NumEstim32)
    del_prom2=mean(del_the2(:,i));     % Al tener varias ventas (en el tiempo) se hace el valor promedio de la señal y se guarda en
    alp_prom2=mean(alpha2(:,i));       % el vector de datos clasificador_array que contenia puros ceros
    bet_prom2=mean(betha2(:,i));
    ABetha_prom2=mean(ABetha2(:,i));
    BBetha_prom2=mean(BBetha2(:,i));

    
    clasificador_array32(1,i)=del_prom2;
    clasificador_array32(2,i)=alp_prom2;
    clasificador_array32(3,i)=bet_prom2;
    clasificador_array32(4,i)=ABetha_prom2;
    clasificador_array32(5,i)=BBetha_prom2;
    
    
end

for i=1:1:(NumEstim)
    del_prom=mean(del_the(:,i));     % Al tener varias ventas (en el tiempo) se hace el valor promedio de la señal y se guarda en
    alp_prom=mean(alpha(:,i));       % el vector de datos clasificador_array que contenia puros ceros
    bet_prom=mean(betha(:,i));
    ABetha_prom=mean(ABetha(:,i));
    BBetha_prom=mean(BBetha(:,i));

    
    clasificador_array(1,i)=del_prom;
    clasificador_array(2,i)=alp_prom;
    clasificador_array(3,i)=bet_prom;
    clasificador_array(4,i)=ABetha_prom;
    clasificador_array(5,i)=BBetha_prom;
    
    
end


