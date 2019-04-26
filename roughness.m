%code to calculate Average and RMS roughness of a sample using date from 2D
%surface profilometer (stylus profilometer)
%raw data is loaded into 2 arrays, lateral(mm) and height(um)

%code by Aakash Dammala

%clearing command window
clc
close all

%calculating RMS roughness
squared_height=height.*height;  %multiplying each element with itself
sum_squared=squared_height'*ones(length(height), 1);    %multiplying by matrix with 1 to sum them
RMS_roughness=sqrt(sum_squared/length(height))

%calculating average roughness
for i=1:1:length(height)
  if(height(i)<0)
      height(i)=-height(i);
  end
end
sum=height'*ones(length(height), 1);
Avg_roughness=sum/length(height)

%plotting
plot([0, lateral(length(height))], [Avg_roughness, Avg_roughness], 'g')
hold on
plot([0, lateral(length(height))], [RMS_roughness, RMS_roughness], 'r')
plot(lateral, height, 'b')

title('Roughness')
xlabel('lateral')
ylabel('height')
legend({'Average roughness','RMS roughness'},'Location','northeast')
%msgbox(sprintf('RMS roughness of the sample is %.4d', RMS_roughness));
