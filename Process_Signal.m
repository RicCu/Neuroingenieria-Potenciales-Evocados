function [senal, estimulo ] = Process_Signal( sgnlvtr,estimulo, fs, fd)
%This function will process the signal, absolute of signal, downsample,
%reshape and fast fourier transformation 
%downsample

fact=fs/fd;
%fimin=fx-20;
%fimax= fx+20;

%downsample signlas to 2000Hz
senal=downsample(sgnlvtr,fact);
estimulo=downsample(estimulo,fact);
size=length(senal);

%fct= factores(size);
%senalt= reshape(senal,[fct(1,1), fct(1,2)]);
%senaltri=abs(trapz(senalt));

%t=length(senal)/fd;
%fi=1/t:1/t:(length(senal)/t);
%sifnalfft=abs(fft(senal));

%[M,I] = max(sifnalfft); in case you need the frequency analysis 

    
end

