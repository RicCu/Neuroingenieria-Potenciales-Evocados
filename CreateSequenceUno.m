function CreateSequenceUno (time, seq)
%tipo=1 cuando solo quire pantalla negra y un checkboard
%tipo=2 cuando quiere pantalla negra y dos checkboard ... se puede cambiar
%si se desean mas checkboards
global data1
global data2


inf=strcat(num2str(seq),'seq',num2str(time),'sec_uno_4sec_Pab_Jueves.csv');
seq=seq/2;
dWidth = 1; %Inicializacion de valores para Checkboard
dLength = 5;
NumEstim=length(seq);
Sequence=cell(NumEstim, 3); %Matriz donde se guardarán datos de CreateCheckboard:  [ chb0, chb1, black ]
img = -1;
blacktime= NumEstim*4; %Empieza con pantalla negra un segundo luego un segundo despues de cada checkboard
fs=500;


d = daq.getDevices;
s = daq.createSession('ni');
addAnalogInputChannel(s,'Dev1',[0 1], 'Voltage');
s.Rate = fs;
TotalTime=(NumEstim*1*time)+blacktime;
s.DurationInSeconds=TotalTime;
lh=addlistener(s,'DataAvailable',@(src,event)StoreData2(src, event, inf));

s.NotifyWhenDataAvailableExceeds = fs*TotalTime;

i=1;
startBackground(s);
while(~s.IsDone)
    
    
    [ Sequence{i,1},Sequence{i,2},Sequence{i,3}] =   CreateCheckboard( seq(1,i), dWidth, dLength ); %[ chb0, chb1, black ] = CreateCheckboard(  size, dWidth, dLength )
    [c0, c1 , img]=StimulateVision(0, Sequence{i,3}, Sequence{i,1}, img);
    pause(4)
    [c0, c1 , img]=StimulateVision(0, Sequence{i,1}, Sequence{i,1}, img);
    pause(time)
    %         [c0, c1 , img]=StimulateVision(0, Sequence{i,2}, Sequence{i,1}, img);
    %         pause(time)
    i=i+1;
end

wait(s);
delete(lh);
release(s)


figure
plot(data1)
figure
plot(data2)
end