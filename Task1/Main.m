%{
  Task1: Prostate cancer segmentation based on MRI and PET images
  author: Shou,Zhenkai  Yang,Jiahuan  Yang,Lirong
  Purpose: Build a classifier to automatically separate the cancer region
  Date: 31-10-2016 ¡ª¡ª 10-02-2017
%}
load('dataset.mat');

%{ 
  2.3.1 Extract Prostate Region
  input: given dataset
  output: a 2-D matrix with attributes (ADC, KTrans, Kep, PET, T2, label, patient)
%}
data_original = ExtractProstateRegion(dataset);

feature_original = data_original(:,1:5);

%{ 
  2.3.2 Feature Normalization
  input: 2-D feature matrix, option (1~3): apply which normalization method
         option = 1: scale each dimension of the feature vector to zero mean and unit variance
         option = 2: scale each dimension of the feature vector to unit dynamic range [0, 1]
         option = 3: scale the feature vector to unit vector length
  output: a normalized 2-D feature matrix
%}
feature_normalized = FeatureNormalization(feature_original,1);

data_normalized = [feature_normalized, data_original(:,6:7)];

%{
  2.3.3 Outlier Detection and Removal
  input: 2-D data matrix, threshold(0~1) which indicates the percentage of remaining data,
         option (1~2): apply which outlier removal method
         option = 1: classical mean and covariance
         option = 2: robust estimator
  output: 2-D data matrix with outlier removed
%}
data_without_outlier = OutlierDetectionAndRemoval(data_normalized, 0.95, 1);




