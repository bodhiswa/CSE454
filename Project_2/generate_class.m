function generate_class(class_label,data, train_label)
% Class 1
for i = 1:size(data,1)
    for j = 1:size(class_label,1)
            orgD(i, j) = dist_calc(data(i), train_label(j));
    end
end

for i = 1:size(orgD, 1)
    [orgClass(i)] = min(orgD(i,:));
end

count1 = 0;
len = length(orgClass);
for i= 1:len
     d = orgClass(i) - label_class1(i);
     if d == 0
         count1 = count1 + 1;
     end
end

    if(len >= 101 & len < 201)
        d = orgClass(i) - label_class2(i);
     if d == 0
         count1 = count1 + 1;
     end
    end
    if(len >= 201 & len < 301)
        d = orgClass(i) - label_class3(i);
     if d == 0
         count1 = count1 + 1;
     end
    end
    if(len >= 301 & len < 401)
        d = orgClass(i) - label_class4(i);
     if d == 0
         count1 = count1 + 1;
     end
    end    
    if(len >= 301 & len < 401)
        d = orgClass(i) - label_class4(i);
     if d == 0
         count1 = count1 + 1;
     end
    end
    if(len >= 401 & len < 501)
        d = orgClass(i) - label_class5(i);
     if d == 0
         count1 = count1 + 1;
     end
    end
    if(len >= 501 & len < 601)
        d = orgClass(i) - label_class6(i);
     if d == 0
         count1 = count1 + 1;
     end
    end
accuracy = count1/length(orgClass);

c = confusionmat(label, orgClass);
confusionchart(c);
end