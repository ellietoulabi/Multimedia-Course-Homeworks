
function [] = question1(Input_image)

I0 = imread(Input_image) ;%original image
[row, column] = size(I0);

%horizental flip
I1= uint8(zeros(row,column));
for r = 1 : row
    for c = 1 : column
       I1(r, c) = I0(r,column - c + 1);
    end
end


%transpose
I2 = uint8(zeros(column,row));
for r = 1 : row
    for c = 1 : column
       I2(c, r) = I0(r,c);
    end
end

% 25% crop
I3 = uint8(zeros(column * 0.5, row * 0.5));

for r = ceil(row * 0.25) : ceil(row * 0.75)
    for c = ceil(column*0.25) : ceil(column*0.75)
       I3(c -ceil(column*0.25) +1, r -ceil(row * 0.25)+1) = I0(c,r);
    end
end


% Right shift
I4 = uint8(zeros(row , column ));
for r = 1 : row
    for c = 3 : column 
       I4(r, c) = I0(r , c - 2);
    end
end
for r = 1 : row 
    for c = 1 : 2
       I4(r, c) = I0(r , column - 2 + c);
    end
end
%imwrite(I4,'rightshift.tif');
% Left shift
I5 = uint8(zeros(row , column ));
for r = 1 : row
    for c = 1 : column -3
       I5(r, c) = I0(r , c + 2);
    end
end
for r = 1 : row
    for c = column - 1 : column 
       I5(r, c) = I0(r , c-column +2 );
    end
end
%imwrite(I5,'leftshift.tif');

%Down shift
I6 = uint8(zeros(row , column ));
for c = 1 : column 
    for r = 3 : row
       I6(r, c) = I0(r - 2 , c);
    end
end
for c = 1 : column
    for r = 1 : 2 
       I6(r, c) = I0(row + r - 2 , c);
    end
end

%Up shift
I7 = uint8(zeros(row , column ));
for c = 1 : column
    for r = 1 : row - 2
       I7(r, c) = I0(r + 2 , c);
    end
end
for c = 1 : column
    for r = row - 1 : row
       I7(r,c) = I0(r - row + 2,c);
    end
end

%Diagonal Up Right
I8 = uint8(zeros(row , column ));
tmp = uint8(zeros(row , column ));

% for c =  1: column-3
%     for r = 3 : row 
%        I8(r-2, c+2) = I0(r  , c);
%     end
% end
for c = 1 : column
    for r = 1 : row - 2
       tmp(r, c) = I0(r + 2 , c);
    end
end
for c = 1 : column
    for r = row - 1 : row
       tmp(r,c) = I0(r - row + 2,c);
    end
end
for r = 1 : row
    for c = 3 : column 
       I8(r, c) = tmp(r , c - 2);
    end
end
for r = 1 : row 
    for c = 1 : 2
       I8(r, c) = tmp(r , column - 2 + c);
    end
end

%Diagonal Up Left
I9 = uint8(zeros(row , column ));
tmp = uint8(zeros(row , column ));
for c = 1 : column
    for r = 1 : row - 2
       tmp(r, c) = I0(r + 2 , c);
    end
end
for c = 1 : column
    for r = row - 1 : row
       tmp(r,c) = I0(r - row + 2,c);
    end
end
for r = 1 : row
    for c = 1 : column -3
       I9(r, c) = tmp(r , c + 2);
    end
end
for r = 1 : row
    for c = column - 1 : column 
       I9(r, c) = tmp(r , c-column +2 );
    end
end

%Diagonal Down Right
I10 = uint8(zeros(row , column ));
tmp = uint8(zeros(row , column ));
for c = 1 : column 
    for r = 3 : row
       tmp(r, c) = I0(r - 2 , c);
    end
end
for c = 1 : column
    for r = 1 : 2 
       tmp(r, c) = I0(row + r - 2 , c);
    end
end
for r = 1 : row
    for c = 3 : column 
       I10(r, c) = tmp(r , c - 2);
    end
end
for r = 1 : row 
    for c = 1 : 2
       I10(r, c) = tmp(r , column - 2 + c);
    end
end
%Diagonal Down Left
I11 = uint8(zeros(row , column ));
tmp = uint8(zeros(row , column ));
for c = 1 : column 
    for r = 3 : row
       tmp(r, c) = I0(r - 2 , c);
    end
end
for c = 1 : column
    for r = 1 : 2 
       tmp(r, c) = I0(row + r - 2 , c);
    end
end
for r = 1 : row
    for c = 1 : column -3
       I11(r, c) = tmp(r , c + 2);
    end
end
for r = 1 : row
    for c = column - 1 : column 
       I11(r, c) = tmp(r , c-column +2 );
    end
end


subplot(4,3,1),  imshow(I0),title('Original image');hold  on
subplot(4,3,2),  imshow(I1),title('a: horizental flip');hold  on
subplot(4,3,3),  imshow(I2),title('b: transpose');hold  on
subplot(4,3,4),  imshow(I3),title('c: crop');hold  on
subplot(4,3,5),  imshow(I4),title('d: Right Shift');hold  on
subplot(4,3,6),  imshow(I5),title('e: Left Shift');hold  on
subplot(4,3,7),  imshow(I6),title('f: Down Shift');hold  on
subplot(4,3,8),  imshow(I7),title('g: Up Shift');hold  on
subplot(4,3,9),  imshow(I8),title('h: Diagonal Up Right Shift');hold  on
subplot(4,3,10), imshow(I9),title('i: Diagonal Up Left Shift');hold  on
subplot(4,3,11), imshow(I10),title('j: Diagonal Down Right Shift');hold  on
subplot(4,3,12), imshow(I11),title('k: Diagonal Down Left Shift');hold  on

figure,imshow(I0),title('Original image');hold  on
figure,imshow(I1),title('a: horizental flip');hold  on
figure,imshow(I2),title('b: transpose');hold  on
figure,imshow(I3),title('c: crop');hold  on
figure,imshow(I4),title('d: Right Shift');hold  on
figure,imshow(I5),title('e: Left Shift');hold  on
figure,imshow(I6),title('f: Down Shift');hold  on
figure,imshow(I7),title('g: Up Shift');hold  on
figure,imshow(I8),title('h: Diagonal Up Right Shift');hold  on
figure,imshow(I9),title('i: Diagonal Up Left Shift');hold  on
figure,imshow(I10),title('j: Diagonal Down Right Shift');hold  on
figure,imshow(I11),title('k: Diagonal Down Left Shift');hold  on


end

