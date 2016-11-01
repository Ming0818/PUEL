load('test_outlier');

norm_cov = cov(test);
norm_mean = mean(test);

[robust_cov, robust_mean] = robustcov(test);

figure;
subplot(1,2,1);
scatter(test(:,1), test(:,2));
hold on;
title('Mahal Distance with NORMAL covariance matrix');
xlabel('log body');
ylabel('log brain');
error_ellipse(norm_cov, norm_mean, 0.95);
error_ellipse(norm_cov, norm_mean, 0.9);
error_ellipse(norm_cov, norm_mean, 0.8);
error_ellipse(norm_cov, norm_mean, 0.7);
error_ellipse(norm_cov, norm_mean, 0.6);

subplot(1,2,2);
scatter(test(:,1), test(:,2));
hold on;
title('Mahal Distance with ROBUST covariance matrix');
xlabel('log body');
ylabel('log brain');
error_ellipse(robust_cov, robust_mean, 0.95);
error_ellipse(robust_cov, robust_mean, 0.9);
error_ellipse(robust_cov, robust_mean, 0.8);
error_ellipse(robust_cov, robust_mean, 0.7);
error_ellipse(robust_cov, robust_mean, 0.6);