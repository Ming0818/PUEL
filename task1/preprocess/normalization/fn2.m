function normalized_feature = fn2(feature)
%FN2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
normalized_feature = (feature - min(feature))/(max(feature) - min(feature));
end

