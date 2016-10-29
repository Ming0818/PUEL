%This is the main script of Task1
load('dataset')
original_sample = cellfun(@(x) GetFeature(x.Image, x.LabelsA, x.LabelsB), dataset, 'UniformOutput', false);

%combine 14 groups of samples into 1 group
combined_sample = [];
for n = 1:14
    combined_sample = [combined_sample; original_sample{n,1}];
end
combined_feature = combined_sample(:, 1:5);
label = combined_sample(:,6);

%feature normalization
normalized_feature = varfun(@(x) fn1(x), combined_feature);