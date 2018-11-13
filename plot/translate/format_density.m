% format density file to plot in paraview
% result format :
% x0  y0  z0  gra0
% x1  y1  z1  grav1
%   ...
% xn  yn  zn  gravn
meshfile='../input/mesh32x32x32';
formatout='../output/density_formated.txt';
densityfile='../output/gravity_density.txt';
%[meshInfo, NN, EE, VV, cell_dn, cell_de, cell_dv] = Mesh3D(meshfile);
[NN, EE, VV]=density_add_coordinate(meshfile);
grav=importdata(densityfile);

VV=-1.*VV; % because vertical is directored to top.
data_format=[NN,EE,VV,grav];
save(formatout,'data_format','-ascii');
