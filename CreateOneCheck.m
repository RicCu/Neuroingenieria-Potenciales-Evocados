   function CreateOneCheck(time, size, NumEstim)
%tipo=1 cuando solo quire pantalla negra y un checkboard
%tipo=2 cuando quiere pantalla negra y dos checkboard ... se puede cambiar
%si se desean mas checkboards
global data1
global data2
inf=strcat(num2str(time),'ET',num2str(size),'size',num2str(NumEstim),'NE_uno_4secPAB2.csv');
%seq=seq/2;
dWidth = 1; %Inicializacion de valores para Checkboard
dLength = 5;
%NumEstim=length(seq);
%Sequence=cell(NumEstim, 3); %Matriz donde se guardarán datos de CreateCheckboard:  [ chb0, chb1, black ]
img = -1;
blacktime= NumEstim*4; %Empieza con pantalla negra un segundo luego un segundo despues de cada checkboard
fs=500;


d = daq.getDevices;
s = daq.createSession('ni');
addAnalogInputChannel(s,'Dev1',[0 1], 'Voltage');
s.Rate = fs;
TotalTime=(NumEstim*time)+blacktime;
s.DurationInSeconds=TotalTime;
lh=addlistener(s,'DataAvailable',@(src,event)StoreData2(src, event,inf));

s.NotifyWhenDataAvailableExceeds = fs*TotalTime;

i=1;
[ c0,c1,black] =   CreateCheckboard( size/2, dWidth, dLength ); %[ chb0, chb1, black ] = CreateCheckboard(  size, dWidth, dLength )
startBackground(s);
while(~s.IsDone)
    
    [x, y, img]=StimulateVision(0, black, c1, img);
    pause(4)
    [x, y , img]=StimulateVision(0, c0, c1, img);
    pause(time)

end

wait(s);
delete(lh);
release(s)


figure
plot(data1)
figure
plot(data2)
end