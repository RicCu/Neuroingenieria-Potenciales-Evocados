close all;
clear all;
%Frecuency variables
fs=50000; %Sampling frequency
fd=2000; %Desired frequency
samplesms=fd*.001; %samples per ms



%VEPdata
infgraph=zeros(3,2);
infreal=zeros(3,1);
dlyP100=0;

rango=samplesms*50; %buscar en los próximos 50 ms

[ estimulo, senal] = Get_file();


[senal2, estimulo2 ] = Process_Signal( senal,estimulo, fs, fd);
%% Create long vector
% senal2relleno=senal2(samplesms*200:99+samplesms*200);
% senalvect200=[senal2relleno; senal2relleno; senal2relleno; senal2relleno];
% estimulovector200= estimulo2(samplesms*100:399+samplesms*100);
% senalvecto500=[senal2;senalvect200];
% estimulovector500=[estimulo2;estimulovector200];
% senal2nueva=[senalvecto500;senalvecto500;senalvecto500;senalvecto500;senalvecto500];
% estimulo2nuevo=[estimulovector500;estimulovector500;estimulovector500;estimulovector500;estimulovector500];
% 
% t=length(senal2nueva)/fd;
% t2=length(estimulo2nuevo)/fd;
% tvect=1000*(1:length(senal2))/fd; %Create time vector and change to ms
% tvectnuevo=1000*(1:length(senal2nueva))/fd; %Create time vector and change to ms
[ senal2nueva, estimulo2nuevo,tvectnuevo] = create_longvector(senal2,estimulo2,samplesms,fd );
figure
plot(tvectnuevo,senal2nueva)
figure
plot(tvectnuevo,estimulo2nuevo)
%% Promediate signal 




%% Get events of signal
%infgraph, infreal, dlyP100] = VEP_analysis( senal2nueva, estimulo2nuevo,tvectnuevo, rango);
%[ infgraph, infreal, dlyP100] = VEP_analysis( senal2, estimulo2,tvect, rango);
[ VEPdata,TData, P100delay, NoPot, Nreal] = VEP_analysis2( senal2nueva, estimulo2nuevo,tvectnuevo, rango);
%[ VEPdata,TData, P100delay, NoPot, Nreal] = VEP_analysis2( senal2nueva, estimulo2nuevo,tvectnuevo, rango);
 VEPdataMean=sum(TData)/Nreal;
 
%% Plot results
%subplot(2,1,1); plot(tvect,senal2,'*','MarkerIndices',[IxP100 I75 I145]);subplot(2,1,2); plot(t2vect,estimulo2);
figure
subplot(2,1,1); 
plot(tvectnuevo,senal2nueva); hold on
for i = 1:1:5
plot(VEPdata(i,1),VEPdata(i,2),'*',VEPdata(i,3),VEPdata(i,4),'*',VEPdata(i,5),VEPdata(i,6),'*' );
hold on 
end

set(gca, 'XGrid', 'on' );
set(gca,'GridLineStyle',':');
subplot(2,1,2); plot(tvectnuevo,estimulo2nuevo);

set(gca, 'XGrid', 'on' ); % To do.. change trasparency
set(gca,'GridLineStyle',':');

%size=length(senal);
%fct= factores(size);
