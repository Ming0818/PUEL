% 2.3.2 Feature Normalization
% input: 2-D feature matrix, option (1~3): apply which normalization method
%        option = 1: scale each dimension of the feature vector to zero mean and unit variance
%        option = 2: scale each dimension of the feature vector to unit dynamic range [0, 1]
%        option = 3: scale the feature vector to unit vector length
% output: a normalized 2-D feature matrix

function [output_feature] = FeatureNormalization(input_feature, option)
output_feature = zeros(size(input_feature));
switch option
  case 1
    % scale each dimension of the feature vector to zero mean and unit variance
    for i = 1:size(input_feature,2)
      feature = input_feature(:,i);
      average = mean(feature);
      standard_deviation = std(feature);
      output_feature(:,i) = (feature - average) / standard_deviation;
    end
  
  case 2
    % scale each dimension of the feature vector to unit dynamic range [0, 1]
    for i = 1:size(input_feature,2)
      feature = input_feature(:,i);
      feature_max = max(feature);
      feature_min = min(feature);
      output_feature(:,i) = (feature - feature_min) / (feature_max - feature_min);
    end
    
  case 3
    % scale the feature vector to unit vector length
    for i = 1:size(input_feature,2)
      vector = input_feature(:,i);
      output_feature(:,i) = vector / norm(vector);
    end
   
  otherwise
    warning('Unexpected input during step Feature Normalization.');
end
