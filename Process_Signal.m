function [senal, estimulo ] = Process_Signal( senal,estimulo, fs, fd)
%This function will process the signal, absolute of signal, downsample,
%reshape and fast fourier transformation 
%downsample

fact=fs/fd;
size=length(senal);
fact2=size/fact;

%fact2=round(size/fact); in case they are not exact
%newlength=fact2*fact;
%senal=senal(1:newlength);

%downsample signlas to 2000Hz
senal2= reshape(senal,[fact, fact2]);
senal=trapz(senal2);
senal=senal';

estimulo2= reshape(estimulo,[fact, fact2]);
estimulo=trapz(estimulo2);
estimulo=estimulo';

% senal=downsample(sgnlvtr,fact);
% estimulo=downsample(estimulo,fact);




end

