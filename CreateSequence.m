
function CreateSequence (time, seq, tipo)
%tipo=1 cuando solo quire pantalla negra y un checkboard
%tipo=2 cuando quiere pantalla negra y dos checkboard ... se puede cambiar
%si se desean mas checkboards

dWidth = 1; %Inicializacion de valores para Checkboard
dLength = 5;
NumEstim=length(seq);
Sequence=cell(NumEstim, 3); %Matriz donde se guardarán datos de CreateCheckboard:  [ chb0, chb1, black ]
img = -1;
blacktime= NumEstim+1; %Empieza con pantalla negra un segundo luego un segundo despues de cada checkboard
fs=500;
d = daq.getDevices;
s = daq.createSession('ni');
addAnalogInputChannel(s,'Dev2',0, 'Voltage');
s.Rate = fs;
s.DurationInSeconds=(NumEstim*tipo*time)+blacktime;
lh=addlistener(s,'DataAvailable',@(src,event)StoreData2(src, event, size));

for i= 1:1:NumEstim
  
 [ Sequence{i,1},Sequence{i,2},Sequence{i,3}] =   CreateCheckboard( seq(1,i), dWidth, dLength ); %[ chb0, chb1, black ] = CreateCheckboard(  size, dWidth, dLength )
 [c0, c1 , img]=StimulateVision(0, Sequence{i,3}, Sequence{i,1}, img);
 pause(2)
 [c0, c1 , img]=StimulateVision(0, Sequence{i,1}, Sequence{i,1}, img);
  pause(2)
 [c0, c1 , img]=StimulateVision(0, Sequence{i,2}, Sequence{i,1}, img);
   pause(2)
   
end




end