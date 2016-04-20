%% Part 1 Getting the Data

% The first difficulty of real data is that it comes from many different
% sources, which may not be optimized for MATLAB. This part will cover some
% basic tricks for automatically reading in large amounts of data

%% Folder Structures

% Do you have too much data to spend hours double clicking different files
% and uploading them manually? MATLAB can automatically read in data from
% lots of different folders on your computer, even if they have really
% confusing names

%% CHALLENGE ONE
% Use a loop to read in the first file in each folder

% Extension: use two loops to read in all the files in all the folders

%% File Names

% If your looking for particular file names the functions strcmp and
% strfind can be useful!

%% CHALLENGE TWO

% Work out the difference between strcmp and strfind

% If you need to get particular dates, numbers or names from a file name
% the function regexp might help.

%% CHALLENGE THREE
% Can you use regexp to find:

% 1)

% 2)

% 3)

%% CHALLENGE
% loop through the files and read in the four excel datasheets
% save each dataset as a matlab file called HousingPrices_01,
% HousingPrices_02, etc in chronological order (ie you will need
% to read and use the date from the file name)
% HINT: the function datenum is very useful for sorting dates into
% chronological order

%% Converting Data


%% CHALLENGE
% the variables in HousingPrices need to be converted to something we can
% work with
% the column called 'Sold at Auction' contains variations of yes and no and
% n/a. It is sometimes blank (which is the same as n/a). Convert this
% variable into 0 = no, 1 = yes and -1 = n/a.