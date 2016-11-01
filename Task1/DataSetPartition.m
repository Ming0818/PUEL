function [train_set, validation_set] = DataSetPartition(input_data)
%{
  2.2.4 Data set partitioning
  Partition the data set into a training set(patient 1~11) and a validation set( patient 12~14)
%}

%identify the index for training set and validation set
patient_index = input_data(:,7); 
train_index = find(patient_index >= 1 & patient_index <= 11);
validation_index= find(patient_index >= 12 & patient_index <= 14);

%partition the data set according to the respective index
train_set = input_data(train_index, 1:6);
validation_set = input_data(validation_index, 1:6);
end

