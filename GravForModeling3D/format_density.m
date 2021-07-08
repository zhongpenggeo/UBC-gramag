% format density file to plot in paraview
% result format :
% x0  y0  z0  gra0
% x1  y1  z1  grav1
%   ...
% xn  yn  zn  gravn
meshfile='../input/mesh.txt';    
formatout='../output/density_formated.txt';
densityfile='../output/gravity_density.txt';

%[meshInfo, NN, EE, VV, cell_dn, cell_de, cell_dv] = Mesh3D(meshfile);
[NN, EE, VV]=density_add_coordinate(meshfile);
grav=importdata(densityfile);

data_format=[EE,NN,VV,grav];
[m,n]=size(data_format);
iflag=fopen(formatout,'w');
for i=1:m
    fprintf(iflag,'%f %f %f  %f',data_format(i,:));
    fprintf(iflag,'\n');
end
fclose(iflag);
