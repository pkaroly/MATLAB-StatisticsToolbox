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
% count 11 - 12pm
Flinders11 = Count_Flinders(Hour_Flinders == 11);

% weekdays at FLinders at 8 in the morning
FlindersWeekday = Count_Flinders(Hour_Flinders == 8 ...
    & ismember(Weekday_Flinders,2:6));

FlindersWeekend = Count_Flinders(Hour_Flinders == 8 ...
    & ismember(Weekday_Flinders,[1,7]));

X = [FlindersWeekday ; FlindersWeekend];
Y = [zeros(size(FlindersWeekday)) ; ...
    ones(size(FlindersWeekend))];

rand_ind = randperm(length(X));
X = X(rand_ind);
Y = Y(rand_ind);

Ntest = floor(0.2 * length(X));

for partitions = 1:5
    
    % create 
    test_ind0 = Ntest*(partitions-1) + 1;
    test_ind1 = Ntest*partitions;
    
    % set aside test data and labels
    test_data = X(test_ind0:test_ind1);
    test_labels = Y(test_ind0:test_ind1);
    % initialzie training data
    train_data = X;
    train_labels = Y;
    % remove teh test cases
    train_data(test_ind0:test_ind1) = [];
    train_labels(test_ind0:test_ind1) = [];
    
    log_model = glmfit(train_data,...
        [train_labels ones(size(train_labels))], ...
    'binomial','link','logit');

    
    % test our model
    input = log_model(1) + log_model(2)*test_data;
    output = 1 ./ (1 + exp(-input));
    
    Nright = sum(output > 0.5 & test_labels == 1) + ...
        sum(output <= 0.5 & test_labels == 0);
    
    100 * Nright / length(test_labels)

end