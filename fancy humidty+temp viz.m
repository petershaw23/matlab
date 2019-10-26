% Read temperature and humidity from a ThingSpeak channel and visualize the 
% relationship between them using the SCATTER plot 

% Channel 12397 contains data from the MathWorks Weather Station, located 
% in Natick, Massachusetts. The data is collected once every minute. Field 
% 3 contains the humidity data and field 4 contains temperature data. 

% Channel ID to read data from 
readChannelID = 647418; 
% Temperature Field ID 
TemperatureFieldID = 3; 
% Humidity Field ID 
HumidityFieldID = 5; 

% Channel Read API Key   
% If your channel is private, then enter the read API 
% Key between the '' below:   
readAPIKey = 'XXXXXXXX'; 

% Read Temperature and Humidity Data. Learn more about the THINGSPEAKREAD function by 
% going to the Documentation tab on the right side pane of this page. 

data = thingSpeakRead(readChannelID,'Fields',[TemperatureFieldID HumidityFieldID], ...
                                               'NumPoints',2200, ...
                                               'ReadKey',readAPIKey); 

                                           
% Read Temperature Data 
temperatureDataDirty = data(:,1);

% Read Humidity Data 
humidityDataDirty = data(:,2);




% Visualize the data
c = linspace(15,29,length(data(:,2)));
scatter(temperatureDataDirty,humidityDataDirty,90,c,'marker','.');
xlabel('Temperature');
ylabel('Humidity');
%colorbar;
%xlim([17 23]);
%ylim([40 70]);
