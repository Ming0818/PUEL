function normalized_feature = fn2(feature)
%FN2 此处显示有关此函数的摘要
%   此处显示详细说明
normalized_feature = (feature - min(feature))/(max(feature) - min(feature));
end

