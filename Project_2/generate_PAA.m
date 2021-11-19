function PAA = generate_PAA(c, data)
% c = number of segments
% data = load("synthetic_control.data")
s = size(data);
% need s[1] to check data size
dt = s(2);

len_ofseg = dt/c;                             % length of segment
len_ofseg = ceil(len_ofseg);

for i= 1:s(1)                                 % going through all samples
    for N = 1:c
        samples = [];
        counter = 1;                          % setting up a counter
        if ((N-1)*len_ofseg) < s(2)
            lower_bound = (N - 1)* len_ofseg;
            upper_bound = N * len_ofseg;
            for j = 1:s(2)                                  % checking to see if observation is in window segment
                if(j > lower_bound)                         % if observation greater than lower bound
                    if (j < upper_bound)                    % if observation lesser than upper bound
                        samples(counter) = data(i, j);      % First index of sample will now contain observation
                        counter = counter + 1;              % Increment sample index
                    end
                end
            end
        end
        PAA(i, N) = mean(samples);                          % Storing aggregrate of the observation piece in 'samples'                     
    end
end

end

