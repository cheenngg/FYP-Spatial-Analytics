
% Load the Meuse data from CSV file
meuseData = readtable('meuse_data.csv'); % Adjust the filename as necessary

% Assuming the CSV has columns 'x', 'y', and 'z'
x = meuseData.x;
y = meuseData.y;
z = meuseData.zinc; % This should be your variable of interest, e.g., lead concentration

% Generate random shuffle index
numData = height(meuseData);
idx_rand_full = randperm(numData);

% Shuffle data according to the random index
x_shuffled = x(idx_rand_full);
y_shuffled = y(idx_rand_full);
z_shuffled = z(idx_rand_full);

% Define calibration sizes
calibration_sizes = [30,50,70];

% Split data into calibration, validation, and test sets
% Assuming the first part is for calibration, second for validation, third for testing
numValidation = 30;
numTest = 55;

% Use the first part of the shuffled data for calibration subsets
idx_cal = idx_rand_full(1:max(calibration_sizes));
x_cal = x_shuffled(1:max(calibration_sizes));
y_cal = y_shuffled(1:max(calibration_sizes));
z_cal = z_shuffled(1:max(calibration_sizes));

% Next part for validation
idx_val = idx_rand_full(max(calibration_sizes)+1 : max(calibration_sizes)+numValidation);
x_val = x_shuffled(max(calibration_sizes)+1 : max(calibration_sizes)+numValidation);
y_val = y_shuffled(max(calibration_sizes)+1 : max(calibration_sizes)+numValidation);
z_val = z_shuffled(max(calibration_sizes)+1 : max(calibration_sizes)+numValidation);

% Last part for testing
idx_test = idx_rand_full(max(calibration_sizes)+numValidation+1 : max(calibration_sizes)+numValidation+numTest);
x_test = x_shuffled(max(calibration_sizes)+numValidation+1 : max(calibration_sizes)+numValidation+numTest);
y_test = y_shuffled(max(calibration_sizes)+numValidation+1 : max(calibration_sizes)+numValidation+numTest);
z_test = z_shuffled(max(calibration_sizes)+numValidation+1 : max(calibration_sizes)+numValidation+numTest);

% Save dataset to .mat file (or any other format you prefer)
save('meuse_dataset.mat', 'idx_rand_full', 'calibration_sizes', 'x', 'y', 'z', 'x_cal', 'y_cal', 'z_cal', 'x_val', 'y_val', 'z_val', 'x_test', 'y_test', 'z_test', 'idx_cal', 'idx_val', 'idx_test');
