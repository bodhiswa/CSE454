function [class_org] = class_labels(org, data, train_data)
        for i = 1:size(org,1)
                [class_org(i), throwAway] = min(org(i,:));
        end
end