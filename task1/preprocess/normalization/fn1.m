function normalized_feature = fn1(feature)
%FN1 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
normalized_feature = (feature - mean(feature))/std(feature);
end

