allMyData = dir('MyData');

file_number = find(strcmp({allMyData.name},'Patient3'));
xlsread(['MyData/' allMyData(file_number).name '/data1.xls']);

% PATIENT LOOP
for idx = 3:length(allMyData)

        
        file_name = allMyData(idx).name;
        file_number = file_name(regexp(file_name,'\d'));
        
        if sum(str2num(file_number) == 1:2:10)
            PatientData = dir(['MyData/' file_name]);
            % use strcmp to only load data for Patient 3
            
            % DATA LOOP
            for pt_idx = 3:length(PatientData)
                
                data = PatientData(pt_idx).name;
                display([file_name data])
                patient = xlsread(['MyData/' file_name '/' data]);
            end
            
        end
end