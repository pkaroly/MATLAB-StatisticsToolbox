clear
close all
clc

load('C:\Users\pkaroly\Documents\GitHub\MATLAB-StatisticsToolbox\PedCounts.mat')

nans = find(isnan(Sensor_ID));

Sensor_ID(nans) = [];
Hourly_Counts(nans) = [];
Date_Time(nans) = [];

Dates_Flinders = Date_Time(Sensor_ID == 6);
Weekday_Flinders = weekday(Dates_Flinders);
Count_Flinders = Hourly_Counts(Sensor_ID==6);

% convert dates to date-vectors
Dates_Flinders = datevec(Dates_Flinders);
Hour_Flinders = Dates_Flinders(:,4);

% count at 8 - 9am
Flinders8 = Count_Flinders(Hour_Flinders == 8);
% count 11 - 12pm
Flinders11 = Count_Flinders(Hour_Flinders == 11);

% weekdays at FLinders at 8 in the morning
FlindersWeekday = Count_Flinders(Hour_Flinders == 8 ...
    & ismember(Weekday_Flinders,2:6));

FlindersWeekend = Count_Flinders(Hour_Flinders == 8 ...
    & ismember(Weekday_Flinders,[1,7]));

% plot the histograms
histogram(FlindersWeekday,0:100:max(FlindersWeekday));
% leave the plot on
hold on
histogram(FlindersWeekend,0:100:max(FlindersWeekend));
% legend 
legend({'8am-9am','11am-12pm'})
xlabel('Pedestrian Numbers')
ylabel('PDF')


