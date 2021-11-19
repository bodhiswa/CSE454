clc
clear
close all
data = load("synthetic_control.data");
train_label0 = zeros(6,60);
% Creating PAA segments


train_label1 = data(1,:);
train_label2 = data(101,:);
train_label3 = data(201,:);
train_label4 = data(301,:);
train_label5 = data(401,:);
train_label6 = data(501,:);

train_label0(1, :) = train_label1;
train_label0(2, :) = train_label2;
train_label0(3, :) = train_label3;
train_label0(4, :) = train_label4;
train_label0(5, :) = train_label5;
train_label0(6, :) = train_label6;


test_label1 = data(1:100,:);
test_label2 = data(101:200,:);
test_label3 = data(201:300,:);
test_label4 = data(301:400,:);
test_label5 = data(401:500,:);
test_label6 = data(501:600,:);


c = 6; 
                                    % number of windows
PAA_train = generate_PAA(c, train_label1);
PAA_train2 = generate_PAA(c, train_label2);
PAA_train3 = generate_PAA(c, train_label3);
PAA_train4 = generate_PAA(c, train_label4);
PAA_train5 = generate_PAA(c, train_label5);
PAA_train6 = generate_PAA(c, train_label6);

PAA_test1 = generate_PAA(c, test_label1);
PAA_test2 = generate_PAA(c, test_label2);
PAA_test3 = generate_PAA(c, test_label3);
PAA_test4 = generate_PAA(c, test_label4);
PAA_test5 = generate_PAA(c, test_label5);
PAA_test6 = generate_PAA(c, test_label6);

% plot_PAA(PAA_test1,data,c,2);
% plot_PAA(PAA_test2,data,c,2);
% plot_PAA(PAA_test3,data,c,2);
% plot_PAA(PAA_test4,data,c,2);
% plot_PAA(PAA_test5,data,c,2);
% plot_PAA(PAA_test6,data,c,2);
hold on

% --------------------------- class 1 ----------------------------

for i = 1:size(test_label1,1)
    for j = 1:size(train_label1,2)
        orgD1(i, j) = dist_calc(test_label1(i), train_label1(j));
    end
end

c1 = class_labels(orgD1, test_label1, train_label1);
fin1 = zeros();
for i1 = 1:size(c1,2)
     val1 = 1;
     fin1(i1) = val1;
     i1 = i1 + 1;
end
e1(:,1) = fin1;

% --------------------------- class 2 ----------------------------

for i = 1:size(test_label2,1)
    for j = 1:size(train_label2,2)
        orgD2(i, j) = dist_calc(test_label2(i), train_label2(j));
    end
end

c2 = class_labels(orgD2, data, train_label2);
fin2 = zeros();
for i2 = 1:size(c2,2)
     val2 = 2;
     fin2(i2) = val2;
     i2 = i2 + 1;
end
e2(:,1) = fin2;
% --------------------------- class 3 ----------------------------

for i = 1:size(test_label3,1)
    for j = 1:size(train_label3,2)
        orgD3(i, j) = dist_calc(test_label3(i), train_label3(j));
    end
end

c3 = class_labels(orgD3, data, train_label3);
fin3 = zeros();
for i3 = 1:size(c3,2)
     val3 = 3;
     fin3(i3) = val3;
     i3 = i3 + 1;
end
e3(:,1) = fin3;
% --------------------------- class 4 ----------------------------


for i = 1:size(test_label4,1)
    for j = 1:size(train_label4,2)
        orgD4(i, j) = dist_calc(test_label4(i), train_label4(j));
    end
end
c4 = class_labels(orgD4, data, train_label4);
fin4 = zeros();
for i4 = 1:size(c4,2)
     val4 = 4;
     fin4(i4) = val4;
     i4 = i4 + 1;
end
e4(:,1) = fin4;
    % --------------------------- class 5 ----------------------------


for i = 1:size(test_label5,1)
    for j = 1:size(train_label5,2)
        orgD5(i, j) = dist_calc(test_label5(i), train_label5(j));
    end
end
c5 = class_labels(orgD5, data, train_label5);
fin5 = zeros();
for i5 = 1:size(c5,2)
     val5 = 5;
     fin5(i5) = val5;
     i5 = i5 + 1;
end
e5(:,1) = fin5;

% --------------------------- class 6 ----------------------------


for i = 1:size(test_label6,1)
    for j = 1:size(train_label6,2)
        orgD6(i, j) = dist_calc(test_label6(i), train_label6(j));
    end
end
c6 = class_labels(orgD6, data, train_label6);
fin6 = zeros();
for i6 = 1:size(c6,2)
     val6 = 6;
     fin6(i6) = val6;
     i6 = i6 + 1;
end
e6(:,1) = fin6;

final_classes(1:100,1) = e1;
final_classes(101:200,1) = e2;
final_classes(201:300,1) = e3;
final_classes(301:400,1) = e4;
final_classes(401:500,1) = e5;
final_classes(501:600,1) = e6;

testing1(1:100,:) = test_label1;
testing1(101:200,:) = test_label2;
testing1(201:300,:) = test_label3;
testing1(301:400,:) = test_label4;
testing1(401:500,:) = test_label5;
testing1(501:600,:) = test_label6;


data1 = load("synthetic_control.data");
sax_demo(data1);