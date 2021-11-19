% Euclidean Distance Calculation Function
% Euclidean Distance equation => 
% distance = sqrt(sum((s[i]-r[i])^2))

function distance = dist_calc(s,r)
    sumD = 0;
    for i = 1:length(s)
        d1 = s(i) - r(i);
        sumD = sumD + (d1^2);
    end
    distance = sqrt(sumD);
end