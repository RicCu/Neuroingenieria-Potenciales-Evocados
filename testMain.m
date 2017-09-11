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

tvect=1000*(1:length(senal2))/fd; %Create time vector and change to ms


%% Get events of signal

[ infgraph, infreal, dlyP100] = VEP_analysis( senal2, estimulo2,tvect, rango);

%% Plot results
%subplot(2,1,1); plot(tvect,senal2,'*','MarkerIndices',[IxP100 I75 I145]);subplot(2,1,2); plot(t2vect,estimulo2);

subplot(2,1,1); plot(tvect,senal2,infgraph(1,1),infgraph(1,2),'*',infgraph(2,1),infgraph(2,2),'*',infgraph(3,1),infgraph(3,2),'*' );

set(gca, 'XGrid', 'on' );
set(gca,'GridLineStyle',':');
subplot(2,1,2); plot(tvect,estimulo2);

set(gca, 'XGrid', 'on' ); % To do.. change trasparency
set(gca,'GridLineStyle',':');

%size=length(senal);
%fct= factores(size);
