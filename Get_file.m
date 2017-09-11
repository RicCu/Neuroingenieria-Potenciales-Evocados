function [ estimulo, senal] = Get_file()
%This function will get the file contatining the signal to analyze
%Erase this function when getting singal in real time 

[f,p]= uigetfile('*.txt');
path=strcat(p,f);
data=load(path);
senal=data(1:15000,2);
estimulo=data(1:15000,3);
end

