data=csvread('4ET4size8NE_dos.csv');
fs=500;
NumEstim=10;
totalSamples=length(data);
dt=1/fs;
TimeVECT=(dt:dt:totalSamples/fs);
plot(TimeVECT,data)
SMatrix=zeros(NumEstim, 3);
spectrogram(data,1000,2,[1:1:50],500,'yaxis')
%%
%estimData=zeros(1,(2000*NumEstim));
for i=1:1:NumEstim
    cont=i*3000;
    if i==1
       estimData=data(1,cont-1999:cont); 
    else
   
    estimData=[estimData, data(1,cont-1999:cont)];
    end
end

 

% estimData=[data(1,1001:3000),data(1,4001:6000),data(1,7001:9000),data(1,10001:12000)
[spec_raw, fspec, tspec]=spectrogram(estimData,1000,2,[1:1:50],500,'yaxis');
abs_spec_raw=abs(spec_raw); 

del_the=abs_spec_raw((1:6),:);      % Separación manal por bandas de EEG (delta+teta/alfa/beta) 
alpha=abs_spec_raw((7:9),:);
betha=abs_spec_raw((10:31),:);
clasificador_array=zeros(3,(NumEstim*2));

for i=1:1:(NumEstim*2)
    del_prom=mean(del_the(:,i));     % Al tener ocho ventas (en el tiempo) se hace el valor promedio de la señal y se guarda en
    alp_prom=mean(alpha(:,i));       % el vector de datos COMMAND_ARRAY que contenia puros ceros
    bet_prom=mean(betha(:,i));
    clasificador_array(1,i)=del_prom;
    clasificador_array(2,i)=alp_prom;
    clasificador_array(3,i)=bet_prom;
end

dlmwrite('calsificador_8_dos_dos.csv', clasificador_array);

% 
%     del_prom=mean(del_the(:,i));     % Al tener ocho ventas (en el tiempo) se hace el valor promedio de la señal y se guarda en
%     alp_prom=mean(alpha(:,i));       % el vector de datos COMMAND_ARRAY que contenia puros ceros
%     bet_prom=mean(betha(:,i));
figure
spectrogram(data(1,1001:3000),2000,2,[1:1:50],500,'yaxis')
%%
figure
spectrogram(data(1,4001:6000),2000,2,[1:1:50],500,'yaxis')
%%
figure
spectrogram(data(1,7001:9000),2000,2,[1:1:50],500,'yaxis')
%%
figure
spectrogram(data(1,10001:12000),2000,2,[1:1:50],500,'yaxis')
