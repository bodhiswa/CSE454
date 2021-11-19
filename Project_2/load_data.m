function [x_val,y_val] = load_data(filename)
% This function loads the data from the dataset. 
x_val = load(filename)                 % This will load the file 'filename'
y_val = 5;                            % Number of data points.
end