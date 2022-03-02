function [nearest_mse,bilinear_mse,bicubic_mse]= question4(img)

I = uint8(imread(img)) ;
I1 = imresize(I,0.8,'nearest');
I2 = imresize(I,0.8,'bilinear');
I3 = imresize(I,0.8,'bicubic');

Nearest = imresize(I1,[450,450],'nearest');
Bilinear = imresize(I2,[450,450],'bilinear');
Bicubic = imresize(I3,[450,450],'bicubic');

%or this one 
% Nearest = imresize(I1,1.25);
% Bilinear = imresize(I2,1.25);
% Bicubic = imresize(I3,1.25);

nmse = question2(I,Nearest);
lmse = question2(I,Bilinear);
cmse = question2(I,Bicubic);


figure,imshow(Nearest),title([' large Nearest mse = '  num2str(nmse)]);
figure,imshow(Bilinear),title(['large Bilinear mse = ' num2str(lmse)]);
figure,imshow(Bicubic),title(['large Bicubic mse = '   num2str(cmse)]);



% subplot(1,3,1),imshow(Nearest),title([' large Nearest mse = '  num2str(nmse)]);
% subplot(1,3,2),imshow(Bilinear),title(['large Bilinear mse = ' num2str(lmse)]);
% subplot(1,3,3),imshow(Bicubic),title(['large Bicubic mse = '   num2str(cmse)]);
nearest_mse = nmse;
bilinear_mse = lmse;
bicubic_mse = cmse;
end

