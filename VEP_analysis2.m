function [ VEPdata,TData, P100delay, NoPot, Nreal] = VEP_analysis2( senal2nueva, estimulo2nuevo,tvectnuevo, rango)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here



[Ax,Ix] = findpeaks( estimulo2nuevo,'MinPeakHeight',3);
Cont=length(Ax);
Nreal=Cont;
VEPdata=zeros(Cont,6);
NoPot=zeros(Cont,1);
TData=zeros(Cont,3);
P100delay=zeros(Cont,1);

for i =1:1:Cont
    
    index=Ix(i);
    if i==Cont
    indexsup=length(estimulo2nuevo);
    else
    indexsup=Ix(i+1);
    end
    
    estTime=tvectnuevo(index);
    %Find P100
    [AxP100,IxP100] = min(senal2nueva(index:indexsup));
    if(AxP100<-10)
         
    IxP100=IxP100+index;
    txP100=tvectnuevo(IxP100);
    TData(i,2)=txP100-estTime;
    VEPdata(i,1:2)=[txP100,AxP100];
    %Find N75 and N145
    
    [AxN75,I75] = max(senal2nueva(IxP100-rango:IxP100));
    txN75=tvectnuevo(I75+index);
    VEPdata(i,3:4)=[txN75,AxN75,];
    TData(i,1)=txN75-estTime;

    [AxN145,I145] = max(senal2nueva(IxP100:IxP100+rango));
    txN145=tvectnuevo(IxP100+I145);
    VEPdata(i,5:6)=[txN145,AxN145];
    TData(i,3)=txN145-estTime;
    



    %Calculate delays 

    P100delay(i,1)=estTime-txP100;  
    NoPot(i)=0;
    
    else
        
      VEPdata(i,:) =0;
      NoPot(i)=1;
      Nreal=Nreal-1;
      TData(i)=0;
      
    
    end


end


end

