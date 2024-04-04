
set(figure(1), 'Renderer', 'painters'); % Other options include 'opengl' and 'zbuffer'
drawnow;
fprintf('Correl Test: %.4f\n', perf.correl_test);
fprintf('DKL_score_mean_test: %.4f\n', perf.DKL_score_mean_test);
%fprintf('perf.error_sign_test: %.4f\n', perf.error_sign_test);
fprintf('perf.RMSE_test: %.4f\n', perf.RMSE_test);
fprintf('perf.ME_test: %.4f\n', perf.ME_test);
fprintf('perf.MAE_test: %.4f\n', perf.MAE_test);
fprintf('perf.NSE_test: %.4f\n', perf.NSE_test);

fprintf('Correl Val: %.4f\n', perf.correl_val);
fprintf('DKL_score_mean_val: %.4f\n', perf.DKL_score_mean_val);
%fprintf('perf.error_sign_val: %.4f\n', perf.error_sign_val);
fprintf('perf.RMSE_val: %.4f\n', perf.RMSE_val);
fprintf('perf.ME_val: %.4f\n', perf.ME_val);
fprintf('perf.MAE_val: %.4f\n', perf.MAE_val);
fprintf('perf.NSE_val: %.4f\n', perf.NSE_val);