
function [err]= HW1_MSE(img1, img2)
I1 = double(img1);
I2 = double(img2);
[row, column] = size(img1);

error = double(0);
for i = 1:row
    for j = 1:column
        error = error +double(( I1(i,j) - I2(i,j))^2);
    end
end
myMSE = double(0);
myMSE = double(error) / double(row * column);

%built-in result :
%disp(immse(I1,I2));


%my result
err = myMSE;
end
