function output_data = OutlierRemoval(input_data, confidence, option)
%{ 
  2.3.3 Outlier detection and removal
  input: 2-D feature matrix,
         confidence: p-value in inverse chi-square cdf, it ranges [0,1] 
         option (1~2): apply which mahalanobis distance
         option = 1: apply the normal mahalanobis distance to remove the outlier
         option = 2: apply the robust mahalanobis distance to remove the outlier
  output: a matrix without outlier samples
%}

healthy_sample = input_data(find(input_data(:,6) == 1),:); %identify the healthy samples
cancer_sample = input_data(find(input_data(:,6) == 2),:); %identify the cancer samples

%apply the normal or robust mahalanobis distance according to the option
switch option
    case 1
        %respectively compute the normal mahalanobis distance for healthy and
        %cancer samples
        healthy_mahal_distance = sqrt(mahal(healthy_sample(:,1:5), healthy_sample(:,1:5))); 
        cancer_mahal_distance = sqrt(mahal(cancer_sample(:,1:5), cancer_sample(:,1:5)));
        
    case 2
        %respectively compute the robust mahalanobis distance for healthy
        %and cancer samples
        [sig, mu, healthy_mahal_distance] = robustcov(healthy_sample(:,1:5));
        [sig, mu, cancer_mahal_distance] = robustcov(cancer_sample(:,1:5));
end

threshold = sqrt(chi2inv(confidence, 5)); %determine the chi-square value according to the confidence

%respectively remove the outliers for healthy and cancer samples
new_healthy_index = find(healthy_mahal_distance <= threshold);  
new_cancer_index = find(cancer_mahal_distance <= threshold);

%identify the samples after removing the outliers according to the index
new_healthy_sample = healthy_sample(new_healthy_index,:);
new_cancer_sample = cancer_sample(new_cancer_index,:);

output_data = [new_healthy_sample;new_cancer_sample]; %combine the samples after removing outliers together

end