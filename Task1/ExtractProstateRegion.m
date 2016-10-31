%{ 
  2.3.1 Extract Prostate Region
  input: given dataset
  output: a 2-D matrix with attributes (ADC, KTrans, Kep, PET, T2, label, patient)
%}
function [output_data] = ExtractProstateRegion(input_data)
structured_data = cell(size(input_data,1), 1);
for i = 1: size(input_data,1)
  % get ground truth from LabelsA and LabelsB
  label = input_data{i,1}.LabelsA;
  different_index = find(input_data{i,1}.LabelsA - input_data{i,1}.LabelsB);
  label(different_index) = 0;
  
  % extract 5 features
  ADC = input_data{i,1}.Image(:,:,:,1);
  KTrans = input_data{i,1}.Image(:,:,:,2);
  Kep = input_data{i,1}.Image(:,:,:,3);
  PET = input_data{i,1}.Image(:,:,:,4);
  T2 = input_data{i,1}.Image(:,:,:,5);
  
  % rescale feature T2 weighted MR image to range [0, 1]
  T2_max = max(T2(:));
  T2_min = min(T2(:));
  T2 = (T2 - T2_min) / (T2_max - T2_min);

  % remove tissues with Label = 0
  remaining_index = find(label);
  ADC = ADC(remaining_index);
  KTrans = KTrans(remaining_index);
  Kep = Kep(remaining_index);
  PET = PET(remaining_index);
  T2 = T2(remaining_index);
  label = label(remaining_index);
  patient = zeros(size(remaining_index));
  patient(:,1) = i;
  structured_data{i,1} = [ADC, KTrans, Kep, PET, T2, label, patient];
end

% output the result data
output_data = cell2mat(structured_data);


