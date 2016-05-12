clear
close
clc

Data = dir('HousePriceData');

for idx = 3:length(Data)
   file_name = Data(idx).name;
   display(file_name)
   
   % use regexp to find the date
   [first last] = regexp(file_name,'\d+- ?\d+- ?\d+');
   
   date_store{idx} = file_name(first(1):last(1));
   date_num_store(idx) = datenum(date_store{idx});
   
   % save the dates HINT: datenum
   
end

% get them into chronological order
sort(date_num_store)