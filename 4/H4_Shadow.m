% I = imread('IUT_H4.bmp');
% H4_Shadow(I,10,10);

function [] = H4_Shadow(I,s,d)

Image = I;
[row, column] = size(Image);
result = uint8(zeros([row, column]));


G = uint8(imgaussfilt(Image,d));

tmp = uint8(zeros(row , column ));

for c = 1 : column
    for r = 1 : row - s
       tmp(r, c) = Image(r + s , c);
    end
end
for c = 1 : column
    for r = row - s-1 : row
       tmp(r,c) = 255;
    end
end
for r = 1 : row
    for c = 1 : column -s-1
       Image(r, c) = tmp(r , c + s);
    end
end
for r = 1 : row
    for c = column - s-1 : column 
       Image(r, c) = 255;
    end
end


G = 255 - G;
Image = 255-Image;
result = 255-(G+Image);


imshow(result);
end

