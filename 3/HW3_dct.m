function [] =HW3_dct(I,K,t)
image = imread(I);
[m,n] = size(image);
row = 0; column = 0;
dctCoef_zero = 0;
    
if rem(m, K) ~= 0 
    row = m + (K - rem(m,K));
else
    row = m;
end

if rem(n, K) ~= 0 
    column = n + (K - rem(n,K));
else
    column = n;
end

J = imresize (image,[row,column]);
dct_coefs = zeros([row,column]);
reconstructed = zeros([row,column]);

for i = 1 : (row / K)
    for j = 1 : (column / K)
        tmp = zeros ([K,K]);
        tmp = dct2( J((i-1)*K +1:i*K ,(j-1)*K +1:j*K) );
        %disp(tmp);
        for x = 1 : K
            for y = 1 : K
                if abs(tmp(x,y)) < t
                    dct_coefs ((i-1)*K + x ,(j-1)*K +y ) = 0;
                    dctCoef_zero = dctCoef_zero + 1;
                else
                    dct_coefs ((i-1)*K + x ,(j-1)*K +y  ) = tmp(x,y);
                end
                %disp(dct_coefs ((i-1)*K +1:i*K ,(j-1)*K +1:j*K));
            end
        end
        
    end
end


for i = 1 : (row / K)
    for j = 1 : (column / K)
        reconstructed ((i-1)*K +1:i*K ,(j-1)*K +1:j*K ) = idct2(dct_coefs((i-1)*K +1:i*K ,(j-1)*K +1:j*K));   
    end
end

v = rescale(reconstructed);
J = rescale(J);
psnr_val = psnr(J,v);
disp('PSNR = ');
disp(psnr_val);
disp('No. DCT Coefficients that bacame 0 :');
disp(dctCoef_zero);
disp('No. DCT Coefficients  :');
disp(row * column);
disp('Percantage :');
disp((100*dctCoef_zero) /(row * column));
subplot (1,3,1),imshow(J),title('Original'),hold on
subplot (1,3,2),imshow(v),title(['Reconstructed PSNR =' num2str(psnr_val)]),hold on
subplot (1,3,3),imshow(abs(J-v)),title('Difference');



end

