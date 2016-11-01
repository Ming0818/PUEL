%{
  2.3.3 Outlier Detection and Removal
  input: 2-D data matrix, value(0~1) which indicates the percentage of remaining data,
         option (1~2): apply which outlier removal method
         option = 1: classical mean and covariance
         option = 2: robust estimator
  output: 2-D data matrix with outlier removed
%}
function [output_data] = OutlierDetectionAndRemoval(input_data, value, option)
group = 2;
dimension = 5;
remaining_data = cell(group,1);
% compute the cutoff
cutoff = sqrt(chi2inv(value, dimension));

for i = 1:group
  % group the input data by its label
  grouped_index = find(input_data(:,6) == i);
  grouped_data = input_data(grouped_index,:);
  grouped_feature = grouped_data(:,1:dimension);
  
  % detect and remove outlier if mahalanobis distance >= cutoff
  mahal_distance = sqrt(mahal(grouped_feature, grouped_feature));
  remaining_index = find(mahal_distance - cutoff < 0);
  remaining_data{i,1} = grouped_data(remaining_index,:);
end

% output the result data
output_data = cell2mat(remaining_data);