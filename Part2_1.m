clear
close all
clc

load('C:\Users\pkaroly\Documents\GitHub\MATLAB-StatisticsToolbox\PedCounts.mat')

nans = find(isnan(Sensor_ID));

Sensor_ID(nans) = [];
Hourly_Counts(nans) = [];
Date_Time(nans) = [];

% get dates for bourke st north and south
Dates_BourkeN = Date_Time(Sensor_ID == 1);
Dates_BourkeS = Date_Time(Sensor_ID == 2);

% get counts for bourke st north and south
BourkeN = Hourly_Counts(Sensor_ID == 1);
BourkeS = Hourly_Counts(Sensor_ID == 2);

% find out whcih dates we have both measurements for
same_dateS = ismember(Dates_BourkeS,Dates_BourkeN);
same_dateN = ismember(Dates_BourkeN,Dates_BourkeS);

% let's select the data that is common to both
BourkeN = BourkeN(same_dateN);
BourkeS = BourkeS(same_dateS);

s = scatter(BourkeN,BourkeS,'markerfacecolor',[76 153 0]/255,...
    'markerfacealpha',0.5);
set(gca,'fontname','arial','fontsize',8)
% plot(BourkeN,BourkeS,'rx')
xlabel('N people per hour - Bourke St North')
ylabel('N people per hour - Bourke St South')

% get the corrleation
[corr_val, p_val] = corr(BourkeN,BourkeS)
