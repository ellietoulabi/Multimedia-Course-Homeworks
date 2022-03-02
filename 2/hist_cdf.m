function [] = hist_cdf(ImagePath)
Image = imread(ImagePath);
[row, column]=size(Image);
pixels=numel(Image);
histogram = zeros(1,256);
img_cdf = zeros(1,256);

for r = 1:row
    for c = 1:column
        histogram(Image(r,c)+1)= histogram(Image(r,c)+1) + 1;
    end
end

for i = 1 : 256
    img_cdf(i)=sum(histogram(1,1:i));
end
img_cdf = double(img_cdf)/double(pixels);

subplot(2,2,1),bar(img_cdf),title('Bar CDF');hold  on
subplot(2,2,2),plot(img_cdf),title('Plot CDF');hold  on
subplot(2,2,3),bar(histogram),title('Bar Histogram');hold  on
subplot(2,2,4),plot(histogram),title('Plot Histogram');hold  on

end

