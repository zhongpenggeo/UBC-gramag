function [NN1, EE1, VV1]= density_add_coordinate(
FI='mesh32x32x32';
fid=fopen (FI, 'rt');  %打开文档

line1 = fgetl(fid); 	%获取文档第一行
data1=str2num(line1);
DN=data1(1);DE=data1(2);DV=data1(3);
line2= fgetl(fid);
data2=str2num(line2);
BN=data2(1);BE=data2(2);BV=data2(3);
line_num=3;
while ~feof(fid)
    if line_num == 3
        tmp=zeros(1,DN);
    elseif line_num == 4
        tmp=zeros(1,DE);
    elseif line_num == 5
        tmp=zeros(1,DV);
    else
        print(" more than 5 lines");
    end
        line3=fgetl(fid);
        data3=regexp(line3,' ','split');
        data_num=1;temp=0;
        for i=1:length(data3)
            if sum(ismember(char(data3(i)),'*')) > 0
                tmp2=regexp(char(data3(i)),'*','split');
                tmp2_1=cellfun(@str2num,tmp2(1));
                tmp2_2=cellfun(@str2num,tmp2(2));
                for ii=1:tmp2_1
                    tmp(data_num)=temp+tmp2_2/2;
                    data_num=data_num+1;
                    temp=tmp(data_num-1)+tmp2_2/2;
                end
            else
                tmp3=cellfun(@str2num,data3(i));
                tmp(data_num)=temp+tmp3/2;
                data_num=data_num+1;
                temp=tmp(data_num-1)+tmp3/2;
            end
        end
    if line_num == 3
        NN=tmp+BN;
    elseif line_num == 4
        EE=tmp+BE;
    elseif line_num == 5
        % beacuse the vertical is directed to top, so data is nagtive.
        VV=-tmp+BV;
    else
        print(" more than 5 lines");
    end
    line_num=line_num+1;

        
        
      
end
NN=reshape(NN,1,1,DN);
NN=repmat(NN,DV,DE,1);
NN1=reshape(NN,DN*DE*DV,1);
EE=repmat(EE,DV,1,DN);
EE1=reshape(EE,DN*DE*DV,1);
VV=repmat(VV',1,DE,DN);
VV1=reshape(VV,DN*DE*DV,1);
fclose(fid);

