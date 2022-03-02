function [] = attack_proj(W_image,B,a,K,W2D)

imwrite(W_image,'lenaJPEG-Quality=100.jpg','jpeg','Quality',100);
imwrite(W_image,'lenaJPEG-Quality=80.jpg','jpeg','Quality',80);
imwrite(W_image,'lenaJPEG-Quality=60.jpg','jpeg','Quality',60);

I100 = imread('lenaJPEG-Quality=100.jpg');
I80  = imread('lenaJPEG-Quality=80.jpg');
I60  = imread('lenaJPEG-Quality=60.jpg');

[I_row, I_col]=size(W_image);
rowBlockCnt = floor(I_row / B);
colBlockCnt = floor(I_col / B);

watermark100=zeros([rowBlockCnt,colBlockCnt]);
watermark80=zeros([rowBlockCnt,colBlockCnt]);
watermark60=zeros([rowBlockCnt,colBlockCnt]);
inline=zeros([1,rowBlockCnt*colBlockCnt]);
tmp=zeros([1,rowBlockCnt*colBlockCnt]);

Logo = im2bw(imresize(W2D,[rowBlockCnt,colBlockCnt]));

rand('seed',K);
randomSequence = randperm(rowBlockCnt*colBlockCnt);


dct_coefs100 = zeros([rowBlockCnt*B,colBlockCnt*B]);
for i = 1 : rowBlockCnt
    for j = 1 : colBlockCnt
        dct_coefs100((i-1)*B +1:i*B ,(j-1)*B +1:j*B) = dct2( I100((i-1)*B +1:i*B ,(j-1)*B +1:j*B) );   
    end
end


dct_coefs80 = zeros([rowBlockCnt*B,colBlockCnt*B]);
for i = 1 : rowBlockCnt
    for j = 1 : colBlockCnt
        dct_coefs80((i-1)*B +1:i*B ,(j-1)*B +1:j*B) = dct2( I80((i-1)*B +1:i*B ,(j-1)*B +1:j*B) );   
    end
end


dct_coefs60 = zeros([rowBlockCnt*B,colBlockCnt*B]);
for i = 1 : rowBlockCnt
    for j = 1 : colBlockCnt
        dct_coefs60((i-1)*B +1:i*B ,(j-1)*B +1:j*B) = dct2( I60((i-1)*B +1:i*B ,(j-1)*B +1:j*B) );   
    end
end




for i = 1 : rowBlockCnt
    for j = 1 : colBlockCnt
        if dct_coefs100((i-1)*B +a+1 ,(j-1)*B +a) > dct_coefs100((i-1)*B +a ,(j-1)*B +a+1)
            watermark100(i,j)=255;
        else
            watermark100(i,j)=0;
        end
        
    end
end
tmp = reshape(watermark100,[1,rowBlockCnt*colBlockCnt]);
inline (randomSequence) = tmp;
watermark100 =reshape(inline,[rowBlockCnt,colBlockCnt]);
v=rescale(watermark100);



for i = 1 : rowBlockCnt
    for j = 1 : colBlockCnt
        if dct_coefs80((i-1)*B +a+1 ,(j-1)*B +a) > dct_coefs80((i-1)*B +a ,(j-1)*B +a+1)
            watermark80(i,j)=255;
        else
            watermark80(i,j)=0;
        end
        
    end
end
tmp = reshape(watermark80,[1,rowBlockCnt*colBlockCnt]);
inline (randomSequence) = tmp;
watermark80 =reshape(inline,[rowBlockCnt,colBlockCnt]);
u=rescale(watermark80);



for i = 1 : rowBlockCnt
    for j = 1 : colBlockCnt
        if dct_coefs60((i-1)*B +a+1 ,(j-1)*B +a) > dct_coefs60((i-1)*B +a ,(j-1)*B +a+1)
            watermark60(i,j)=255;
        else
            watermark60(i,j)=0;
        end
        
    end
end
tmp = reshape(watermark60,[1,rowBlockCnt*colBlockCnt]);
inline (randomSequence) = tmp;
watermark60 =reshape(inline,[rowBlockCnt,colBlockCnt]);
w=rescale(watermark60);

NC100 = sum(and(~(and(im2bw(v),~and(im2bw(v),Logo))),~(and(Logo,~and(im2bw(v),Logo)))),'all')/numel(Logo);
NC80  = sum(and(~(and(im2bw(u),~and(im2bw(u),Logo))),~(and(Logo,~and(im2bw(u),Logo)))),'all')/numel(Logo);
NC60  = sum(and(~(and(im2bw(w),~and(im2bw(w),Logo))),~(and(Logo,~and(im2bw(w),Logo)))),'all')/numel(Logo);

fprintf('\n [+] The NC value for Quality = 100 is %f', NC100);
fprintf('\n [+] The NC value for Quality = 80 is %f', NC80);
fprintf('\n [+] The NC value for Quality = 60 is %f', NC60);


subplot(1,3,1),imshow(v),title("NC100 = " + NC100);hold  on
subplot(1,3,2),imshow(u),title("NC80 = " + NC80);hold  on
subplot(1,3,3),imshow(w),title("NC60 = " + NC60);hold  on


end

