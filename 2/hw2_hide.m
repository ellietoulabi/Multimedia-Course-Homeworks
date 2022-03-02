function [] = hw2_hide(ImagePath,LogoPath,L)
Image = imread(ImagePath);
[row,column]=size(Image);
Logo = imread(LogoPath);
Logo = imresize(Logo,[row,column]);
binaryLogo = dither(Logo);
result = uint8(zeros(row,column));

for r = 1 : row
    for c = 1 : column
       result(r,c)= bitset(Image(r,c),L,binaryLogo(r,c)); 
    end
end

mse = immse(Image,result);


subplot (1,3,1),imshow(Image),title('Image');hold  on
subplot (1,3,2),imshow(Logo),title('Logo');hold  on
subplot (1,3,3),imshow(result),title(['Watermarked with MSE=' num2str(mse)]);hold  on
end

