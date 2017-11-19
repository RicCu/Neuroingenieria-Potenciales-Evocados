
function CreateSequence (time, seq)
dWidth = 1; %Inicializacion de valores para Checkboard
dLength = 5;
NumEstim=length(seq);
Sequence=cell(NumEstim, 3); %Matriz donde se guardarán datos de CreateCheckboard:  [ chb0, chb1, black ]
img = -1;

for i= 1:1:NumEstim
  
 [ Sequence{i,1},Sequence{i,2},Sequence{i,3}] =   CreateCheckboard( seq(1,i), dWidth, dLength ); %[ chb0, chb1, black ] = CreateCheckboard(  size, dWidth, dLength )
 [c0, c1 , img]=StimulateVision(0, Sequence{i,3}, Sequence{i,1}, img);
 pause(2)
 [c0, c1 , img]=StimulateVision(0, Sequence{i,1}, Sequence{i,1}, img);
  pause(2)
%  [c0, c1 , img]=StimulateVision(0, Sequence{i,2}, Sequence{i,1}, img);
%   pause(2)
%   
end




end