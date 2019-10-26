% Read temperature for the last 10 hours from a ThingSpeak channel and 
% visualize temperature variations using the MATLAB HISTOGRAM function. 

% Channel ID to read data from 
readChannelID = 647418; 
   
% Temperature Field ID 
TemperatureFieldID = 3; 
   
% Channel Read API Key   
% If your channel is private, then enter the read API 
% Key between the '' below:   
readAPIKey = 'XXXXXXXXX'; 

% Get temperature data from field 4 for the last 10 hours = 10 x 60 
% minutes. Learn more about the THINGSPEAKREAD function by going to 
% the Documentation tab on the right side pane of this page. 
   
tempF = thingSpeakRead(readChannelID,'Fields',TemperatureFieldID,...
'NumPoints',2200, 'ReadKey',readAPIKey); 

% We will use the isoutlier function. With the default settings, this   
% calculates whether a value is more than three scaled median absolute 
% deviations away from the median. (See MATLAB documentation for the   
% isoutlier function for more details.) If any such points are found, we   
% will delete the point and the corresponding timestamp. 

% Check for outliers 
% Find the indices of elements which are outliers 
outlierDataIndex = isoutlier(tempF); 

% Find the indices of elements which are not outliers 
cleanDataIndex = ~outlierDataIndex;

% Select elements that are outliers 
% outlierData = tempF(outlierDataIndex); 

% Select elements that are not outliers 
cleanData = tempF(cleanDataIndex); 
   

histogram(cleanData,42,'Normalization','count','FaceColor','0.1 0.1 0.1','FaceAlpha',0.3); 
xlabel('Temperature (C)'); 
ylabel('Number of Measurements\newline for Each Temperature'); 
title('Histogram of Temperature Variation');
