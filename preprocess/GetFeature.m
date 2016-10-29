function original_sample = GetFeature(image, A, B)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
%check the validation of input variable
if(size(A) ~= size(B))
    error('size of two matrix must be equal.');
end

%keep the common elements of two matrix A and B
%different elements are set zero
common_labeled_sample = zeros(size(A));
diff = A - B;
zero_index = find(diff == 0);
common_labeled_sample(zero_index) = A(zero_index);
tissue_index = find(common_labeled_sample ~= 0);

%extract the 3d matrix of the certain feature from the 4d image
ACD_matrix = image(:,:,:,1);
Ktrans_matrix = image(:,:,:,2);
Kep_matrix = image(:,:,:,3);
PET_matrix = image(:,:,:,4);
T2_matrix = image(:,:,:,5);

%identify the prostate region with 5 features
%feature T2 is normalized to range [0,1]
ACD = ACD_matrix(tissue_index);
Ktrans = Ktrans_matrix(tissue_index);
Kep = Kep_matrix(tissue_index);
PET = PET_matrix(tissue_index);
T2_original = T2_matrix(tissue_index);
T2_normalized = (T2_original - min(T2_original))/(max(T2_original) - min(T2_original));
Label = common_labeled_sample(tissue_index);

%return the table of the samples with 5 features
original_sample = table(ACD, Ktrans, Kep, PET, T2_normalized, Label);
end

