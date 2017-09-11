function [ infgraph, infreal, dlyP100] = VEP_analysis( senal2,estimulo2, tvect, rango )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

%Time variables
tP100=100;
tN75=75;
tN145=145;

infgraph=zeros(3,2);
infreal=zeros(3,1);
%Find P100
[AxP100,IxP100] = min(senal2); 

txP100=tvect(IxP100);
infgraph(1,:)=[txP100,AxP100];
%Find N75 and N145 
[AxN75,I75] = max(senal2(IxP100-rango:IxP100));

txN75=tvect(I75);
infgraph(2,:)=[txN75,AxN75,];

[AxN145,I145] = max(senal2(IxP100:IxP100+rango));
txN145=tvect(IxP100+I145);
infgraph(3,:)=[txN145,AxN145];

[h,I2] = max(estimulo2);
IxEst=I2;
txEst=tvect(IxEst);

txP100R=txP100-txEst; %Calculate time of P100 = timeminpi - timeestim
txN75R=txN75-txEst; %Calculate time of P100 = timeminpi - timeestim
txN145R=txN145-txEst; %Calculate time of P100 = timeminpi - timeestim

infreal=[txP100R;txN75R;txN145R];


%Calculate delays 

dlyP100=tP100-txP100R;
end

