clc;clear;
fiinput='./input/topo-plain0.txt';
fioutput='./input/topo-plain.txt';

topo00=importdata(fiinput,' ',1);
topo0=topo00.data;
data1=cell2mat(topo00.textdata);
[m,n]=size(topo0);
topo=topo0;
for i=1:m
    if  topo0(i,3)>400
        topo(i,3)=500;
    elseif topo0(i,3)<=400 && topo0(i,3)>150
            topo(i,3)=300;
    else
        topo(i,3)=0;
    end
end
iflag=fopen(fioutput,'w');
fprintf(iflag,'%s ',data1);
fprintf(iflag,'\n');
for i=1:m
    fprintf(iflag,'%f %f %f ',topo(i,:));
    fprintf(iflag,'\n');
end
fclose(iflag);