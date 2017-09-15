function [ P100delayMean, VEPdataMean,VECTsenal, VECTestim,tvect] = Main_VEP(size, N)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

%Variables para estimulación
%size=4;
%N=6;
state=1;
img_handle=-1;
chkb0=0;
chkb1=0;
dWidth=2;
dLength=10;

VEPdata=zeros(N,6);
NoPot=zeros(N,1);
TData=zeros(N,3);
P100delay=zeros(N,1);

fs=50000; %Sampling frequency
fd=2000; %Desired frequency
samplesms=fd*.001; %samples per ms

infgraph=zeros(3,2);
infreal=zeros(3,1);
dlyP100=0;

rango=samplesms*50; %buscar en los próximos 50 ms

%variables de VEP
VEP=0;
contador=0;

[f,p]= uigetfile('*.txt');
path=strcat(p,f);
data=load(path);
senal=data(1:15000,2);
estimulo=data(1:15000,3);

[senal2, estimulo2 ] = Process_Signal( senal,estimulo, fs, fd);

%[ senal2nueva, estimulo2nuevo,tvectnuevo] = create_longvector(senal2,estimulo2,samplesms,fd );
senal2relleno=senal2(samplesms*200:99+samplesms*200);
senalvect200=[senal2relleno; senal2relleno; senal2relleno; senal2relleno];
senalvecto500=[senal2;senalvect200];
estimulovector200= estimulo2(samplesms*100:399+samplesms*100);
estimulovector500=[estimulo2;estimulovector200];

VECTsenal=[0 ;0; 0 ;0];
VECTestim=[0; 0 ;0 ;0];

for i=1:1:N
    
[ chkb0, chkb1, img_handle ] = StimulateVision(state, chkb0, chkb1, img_handle, size, dWidth, dLength);
VECTsenal=[VECTsenal;senalvecto500];
VECTestim=[VECTestim;estimulovector500];
state=xor(state,1);
pause(.5)
end
tvect=1000*(1:length(VECTsenal))/fd; %Create time vector and change to ms
[VEPdata,TData, P100delay, NoPot, Nreal] = VEP_analysis2( VECTsenal, VECTestim,tvect, rango);
VEPdataMean=sum(TData)/Nreal;
P100delayMean=sum(P100delay)/Nreal;
end

