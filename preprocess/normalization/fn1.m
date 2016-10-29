function normalized_feature = fn1(feature)
%FN1 此处显示有关此函数的摘要
%   此处显示详细说明
normalized_feature = (feature - mean(feature))/std(feature);
end

