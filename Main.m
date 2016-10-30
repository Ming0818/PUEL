load('dataset.mat');

% 2.3.1 Extract Prostate Region
% input: given dataset
% output: a 2-D matrix with attributes (ADC, KTrans, Kep, PET, T2, label)
data = ExtractProstateRegion(dataset);

feature = data(:,1:5);
label = data(:,6);

% 2.3.2 Feature Normalization
% input: 2-D feature matrix, option (1~3): apply which normalization method
%        option = 1: scale each dimension of the feature vector to zero mean and unit variance
%        option = 2: scale each dimension of the feature vector to unit dynamic range [0, 1]
%        option = 3: scale the feature vector to unit vector length
% output: a normalized 2-D feature matrix
normalized_feature = FeatureNormalization(feature,3);



