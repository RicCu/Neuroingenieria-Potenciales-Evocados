function [ senal2nueva, estimulo2nuevo,tvectnuevo] = create_longvector(senal2,estimulo2,samplesms,fd )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

senal2relleno=senal2(samplesms*200:99+samplesms*200);
senalvect200=[senal2relleno; senal2relleno; senal2relleno; senal2relleno];
estimulovector200= estimulo2(samplesms*100:399+samplesms*100);
senalvecto500=[senal2;senalvect200];
estimulovector500=[estimulo2;estimulovector200];
senal2nueva=[senalvecto500;senalvecto500;senalvecto500;senalvecto500;senalvecto500];
estimulo2nuevo=[estimulovector500;estimulovector500;estimulovector500;estimulovector500;estimulovector500];

t=length(senal2nueva)/fd;
t2=length(estimulo2nuevo)/fd;
tvect=1000*(1:length(senal2))/fd; %Create time vector and change to ms
tvectnuevo=1000*(1:length(senal2nueva))/fd; %Create time vector and change to ms

figure
plot(tvectnuevo,senal2nueva)
figure
plot(tvectnuevo,estimulo2nuevo)

end

