% Enter your MATLAB code below
readChId = 647418              % Your Channel ID					
readKey = 'XXXXXXXX' %Your Read API Key
[dewPointData,timeStamps] = thingSpeakRead(readChId,'fields',[3,5,6],...
    'NumPoints',2200,'ReadKey',readKey);

plot(timeStamps,dewPointData);
%xlabel('TimeStamps');
%ylabel('Measured Values');
title('Dew Point Measurement');
legend({'Temperature','Humidity','Dew Point'});
grid on;
