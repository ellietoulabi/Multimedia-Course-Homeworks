function [W_image] = embed_proj(I,B,a,W2D,K,alpha)
Result = I;

% I = double(I);
[I_row, I_col]=size(I);

rowBlockCnt = floor(I_row / B);
colBlockCnt = floor(I_col / B);

Logo = im2bw(imresize(W2D,[rowBlockCnt,colBlockCnt]));
W1D = reshape(Logo,[1,rowBlockCnt*colBlockCnt]);

rand('seed',K);
randomSequence = randperm(rowBlockCnt*colBlockCnt);
randW1D = W1D(randomSequence);

randLogo =  reshape(randW1D,[rowBlockCnt,colBlockCnt]);


dct_coefs = zeros([rowBlockCnt*B,colBlockCnt*B]);

for i = 1 : rowBlockCnt
    for j = 1 : colBlockCnt
        dct_coefs((i-1)*B +1:i*B ,(j-1)*B +1:j*B) = dct2( I((i-1)*B +1:i*B ,(j-1)*B +1:j*B) );   
    end
end

for i = 1 : rowBlockCnt
    for j = 1 : colBlockCnt
        if randLogo(i,j) == 1
            if dct_coefs((i-1)*B +a+1 ,(j-1)*B +a) > dct_coefs((i-1)*B +a ,(j-1)*B +a+1)
               dct_coefs((i-1)*B +a ,(j-1)*B +a+1) = dct_coefs((i-1)*B +a ,(j-1)*B +a+1) - (alpha/2); 
               dct_coefs((i-1)*B +a+1 ,(j-1)*B +a) = dct_coefs((i-1)*B +a+1 ,(j-1)*B +a) + (alpha/2);
            else
               dct_coefs((i-1)*B +a ,(j-1)*B +a+1) = dct_coefs((i-1)*B +a+1 ,(j-1)*B +a) - (alpha/2); 
               dct_coefs((i-1)*B +a+1 ,(j-1)*B +a) = dct_coefs((i-1)*B +a ,(j-1)*B +a+1)+ (alpha/2);
            end
        elseif randLogo(i,j)==0
            if dct_coefs((i-1)*B +a+1 ,(j-1)*B +a) > dct_coefs((i-1)*B +a ,(j-1)*B +a+1)
               dct_coefs((i-1)*B +a ,(j-1)*B +a+1) = dct_coefs((i-1)*B +a+1 ,(j-1)*B +a) + (alpha/2); 
               dct_coefs((i-1)*B +a+1 ,(j-1)*B +a) = dct_coefs((i-1)*B +a ,(j-1)*B +a+1)- (alpha/2);
            else
               dct_coefs((i-1)*B +a ,(j-1)*B +a+1) = dct_coefs((i-1)*B +a ,(j-1)*B +a+1) + (alpha/2); 
               dct_coefs((i-1)*B +a+1 ,(j-1)*B +a) = dct_coefs((i-1)*B +a+1 ,(j-1)*B +a) - (alpha/2);
            end
        end
        
    end
end

for i = 1 : rowBlockCnt
    for j = 1 : colBlockCnt
        rec((i-1)*B +1:i*B ,(j-1)*B +1:j*B) = idct2( dct_coefs((i-1)*B +1:i*B ,(j-1)*B +1:j*B) );   
    end
end

% 
% extractedLogo =  zeros([rowBlockCnt,colBlockCnt]);
% 
% for i = 1 : rowBlockCnt
%     for j = 1 : colBlockCnt
%         if dct_coefs((i-1)*B +a+1 ,(j-1)*B +a) > dct_coefs((i-1)*B +a ,(j-1)*B +a+1)
%             extractedLogo(i,j)=255;
% %             disp(dct_coefs((i-1)*B +a+1 ,(j-1)*B +a) );
% %             disp( dct_coefs((i-1)*B +a ,(j-1)*B +a+1));
% %             disp('**********');
%             
%         else
%             extractedLogo(i,j)=0;
% %             disp('0 applied');
%         end
%         
%     end
% end
% 
% 

% rec = rescale(rec);
Result(1:rowBlockCnt*B,1:colBlockCnt*B) = rec;
% Result = im2double(I);

[peaksnr, snr] = psnr(Result, I);
  
fprintf('\n [+] The PSNR value is %f', peaksnr);
% imshow(Result);

W_image=Result;

end

