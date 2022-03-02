Image = imread ( 'hi.tif');
[row, column ] = size(Image);
Second = uint8(zeros(row,column));

for r = 1 : row
    for c = 1 : column
        if Image(r,c)-20 < 0
            Second ( r, c) = 0;
        else
            Second ( r, c) = Image(r,c)-20;
        end
    end
end

% figure, imshow(Image);
% figure, imshow(Second);
disp(' -20 change: ');
disp(question2(Image,Second));
%disp(immse(Image,Second));

I1 = imread('rightshift.tif');
I2 = imread('leftshift.tif');
I3 = uint8(zeros(row,column));
I3 = (Image + I1 + I2 )/3;
%imwrite (I3, 'meanof3.tif');
disp(' min images: ');
disp(question2(Image,I3));
