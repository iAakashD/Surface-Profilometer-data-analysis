%code to calculate the thickness of a coating using surface profilometer
%code to calculate thickness of a coating using date from 2D surface 
%profilometer (stylus profilometer)

%raw data is loaded into 2 arrays, lateral(mm) and height(um)
%click on the point where the coating started and the point where coating
%is fully applied

%code by Aakash Dammala

%clearing command window
clc
close all

%plot the graph and take input of 2 points to calculate linear regression
plot(lateral, height)
[x_left, y]=ginput(1);
[x_right, y]=ginput(1);

%saperate points to the left and right of selected points
position_r=find(lateral > x_right, 1);
lateral_right=lateral(position_r : length(lateral));
height_right=height(position_r : length(height));

position_l=find(lateral < x_left, 1, 'last');
lateral_left=lateral(1 : position_l);
height_left=height(1 : position_l);

%calculate linear regression of left and right region and plot them
%linear regression is calculated to represent entire left or right with a
%single line
a_right=polyfit(lateral_right, height_right, 1);
plot(lateral, height, lateral_right, polyval(a_right, lateral_right), '-g');
hold on
a_left=polyfit(lateral_left, height_left, 1);
plot(lateral_left, polyval(a_left, lateral_left), '-r');
title('Thickness')
xlabel('lateral')
ylabel('height')

%calculate thickness (height difference of 2 linear regressions) 
height_difference = (a_right(1)*x_right + a_right(2)) - (a_left(1)*x_left + a_left(2))
%msgbox( sprintf('the thickness of the coating is %.4d units', height_difference));
