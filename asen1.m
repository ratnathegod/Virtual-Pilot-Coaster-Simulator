%{
Author: [Your Name]
Assignment: ASEN2012 - In-Class Coding 1
Creation Date: [Today's Date]
Inputs: sanitas_times.csv
Outputs: Histogram, PDF comparison, statistics results
Purpose: Analyze Sanitas Climb time data using statistical methods, including 
         mean, standard deviation, SEM, and comparison with a normal distribution.
%}

clear
clc
close all

%% Section 1: Read in and clean the data set, compute number of elements

% Define the correct file path
file_path = '/mnt/data/sanitas_times.csv';

% Check if file exists before reading
if isfile(file_path)
    fprintf('File found! Reading data...\n');
    data = readmatrix(file_path);
else
    error('File not found: %s. Please check if it is uploaded.', file_path);
end

% Display first few values for verification
disp('First few data values:');
disp(data(1:min(10, length(data)))); % Show first 10 values

% Remove NaN values
data = data(~isnan(data));

% Compute the number of valid elements
answers.elements = length(data);
fprintf('Total valid elements: %d\n', answers.elements);

% Plot basic histogram
figure('units','inch','position',[1,1,7,6]);
histogram(data);
ylabel('# of Counts')
xlabel('Time (min)')
legend('Distribution')

%% Section 2: Calculate statistical quantities 3 different ways

% Method 1: Using a for loop
tic
sum_for = 0;
for i = 1:length(data)
    sum_for = sum_for + data(i);
end
mean_for = sum_for / length(data);

sum_sq_diff = 0;
for i = 1:length(data)
    sum_sq_diff = sum_sq_diff + (data(i) - mean_for)^2;
end
stdev_for = sqrt(sum_sq_diff / (length(data) - 1));
time_for = toc;

% Method 2: Using sum() function
tic
mean_sum = sum(data) / length(data);
stdev_sum = sqrt(sum((data - mean_sum).^2) / (length(data) - 1));
time_sum = toc;

% Method 3: Using mean() and std() functions
tic
mean_builtin = mean(data);
stdev_builtin = std(data);
time_builtin = toc;

% Store results in the answers structure
answers.meanMin = mean_builtin;
answers.stdevMin = stdev_builtin;

% Display execution times for comparison
fprintf('Execution Times:\n');
fprintf('For-loop method: %.6f seconds\n', time_for);
fprintf('Sum function method: %.6f seconds\n', time_sum);
fprintf('Built-in mean/std functions: %.6f seconds\n', time_builtin);

%% Section 3: Calculate the SEM
answers.semMin = stdev_builtin / sqrt(answers.elements);
fprintf('SEM (Standard Error of the Mean): %.6f\n', answers.semMin);

%% Section 4: Compare data with the PDF

% Create a normalized histogram
figure('units','inch','position',[1,1,7,6]);
hold on;
histogram(data, 'Normalization', 'pdf');

% Generate PDF from normal distribution
x_range = linspace(min(data), max(data), 1000);
pdf_values = (1 / (stdev_builtin * sqrt(2 * pi))) * exp(-0.5 * ((x_range - mean_builtin) / stdev_builtin).^2);
plot(x_range, pdf_values, 'g', 'LineWidth', 2);

% Add mean and standard deviation lines
xline(mean_builtin, 'k', 'LineWidth', 2); % Mean
xline(mean_builtin + stdev_builtin, 'k--', 'LineWidth', 2); % +1 SD
xline(mean_builtin - stdev_builtin, 'k--', 'LineWidth', 2); % -1 SD

ylabel('Probability Density Function')
xlabel('Time (min)')
legend('Data', 'Gaussian PDF', 'Mean', '+/- 1 SD')
print('data_comparison_icc1', '-dpng', '-r300'); % Save image

%% Display final results
disp('Final answers structure:');
disp(answers);
