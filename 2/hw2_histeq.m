function [x] = hw2_histeq(ImagePath)
Image = imread(ImagePath);
[row, column]=size(Image);
pixels = numel(Image);
result = double(zeros(row,column));
dImage = im2double(Image);
histogram = zeros(1,256);
final_histogram = zeros(1,256);

img_cdf = zeros(1,256);
fimg_cdf = zeros(1,256);

for r = 1:row
    for c = 1:column
        histogram(Image(r,c)+1)= histogram(Image(r,c)+1) + 1;
    end
end

for i = 1 : 256
    img_cdf(i)=sum(histogram(1,1:i));
end
img_cdf = double(img_cdf)/double(pixels);

%equalize:
for r = 1 : row
    for c = 1 : column
        result(r,c)=img_cdf(Image(r,c)+1);
        
    end
end
ss = uint8(result*255);

for r = 1:row
    for c = 1:column
        final_histogram(ss(r,c)+1)= final_histogram(ss(r,c)+1) + 1;
    end
end
for i = 1 : 256
    fimg_cdf(i)=sum(final_histogram(1,1:i));
end
fimg_cdf = double(fimg_cdf)/double(pixels);

subplot (2,3,1),imshow(Image),title('Initial Image');hold  on
subplot (2,3,2),bar(histogram),title('Initial Histogram');hold  on
subplot (2,3,3),plot(img_cdf),title('Initial CDF');hold  on
subplot (2,3,4),imshow(ss),title('Equalized Image');hold  on
subplot (2,3,5),bar(final_histogram),title('Equalized Histogram');hold  on
subplot (2,3,6),plot(fimg_cdf),title('Equalized CDF');hold  on

disp (["MSE:",immse(Image,ss)]);


end

