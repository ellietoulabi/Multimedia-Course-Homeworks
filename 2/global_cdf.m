function [eqaulized] = global_cdf(Image)


[row, column]=size(Image);
pixels = numel(Image);
result = double(zeros(row,column));
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

%equalize:
for r = 1 : row
    for c = 1 : column
        result(r,c)=img_cdf(Image(r,c)+1);   
    end
end
ss = uint8(result*255);

eqaulized = ss;

end

