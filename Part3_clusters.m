clear
close all
clc

x = [-10+5*randn(100,1) ; 10+5*randn(100,1)];
%plot(x,'x')
idx = kmeans(x,2);
plot(x(idx==1),'rx');
hold on;
plot(x(idx==2),'bo');

[idx,C] = kmeans(x,2);
line([0 100],[C(1) C(1)],'color','k')
line([0 100],[C(2) C(2)],'color','k')

%%

clear
close all
clc

load('PedCounts.mat')

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

figure;
for k = 2:10
   subplot(2,5,k);
   idx = kmeans(Flinders8,k);
   histogram(idx);
end

figure;
dendrogram(linkage(Flinders8))
hold on;
line([1 50],[60 60],'color','red')