%% Download data here https://www.usap-dc.org/view/dataset/601213
% These files are very large, so run quite slowly, and maybe not great to
% keep sitting on your hard drive full time.
clear

% I converted Lat/Lon files to PS coordinates and stored direct at matlab
% file. 

load PS.mat
xx = x(:);  % make vectors for scattered interpolant
yy = y(:);

% I converted the master file to binar using python so I can open by column:
%   import pandas as pd
%   import numpy as np
% 
%   a = pd.read_csv('Smooth_topographic_realization_50.csv',usecols = [3])
%   np.array(a).astype('double').tofile('MattsFile3.b')

f = fopen('MattsFile3.b');
depth = [NaN; fread(f,'double')]; %somehow 1 data point got lost

% Set bounds of area of interest
xmin = -1790000;
xmax = -1090000;
ymin =  -945000;
ymax =    55000;

%% downsize to just Thaites Basin Area, and make a grid

dx = 2e3;
smth = 6e3;
xi = xmin:dx:xmax;
yi = ymin:dx:ymax;
[Xi, Yi] = meshgrid(xi,yi);



x_th        =    xx((xx < xmax) & (xx > xmin) & (yy < ymax) & (yy > ymin));
y_th        =    yy((xx < xmax) & (xx > xmin) & (yy < ymax) & (yy > ymin));
depth_th    = depth((xx < xmax) & (xx > xmin) & (yy < ymax) & (yy > ymin));


depth_interp = scatteredInterpolant(x_th,y_th,depth_th);

bed_depth = depth_interp(Xi,Yi);
save('Instance3','Xi','Yi','bed_depth')

figure(1)
clf
surf(Xi,Yi,bed_depth,'edgecolor','none')
view(2)