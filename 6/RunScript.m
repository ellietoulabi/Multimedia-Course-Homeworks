I = imread('lena.bmp');
W2D = imread('iut5.bmp');

imshow(edge(I,'canny'));
x=((sum(edge(I,'canny'),'all')/(450*450)));
disp (x)

B = 12;
K = 19;
a = 6;
alpha =87;

alpha0=0.00*alpha;
alpha10=0.1*alpha;
alpha50=0.5*alpha;
alpha100=1.00*alpha;



W_image = embed_proj(I,B,a,W2D,K,alpha100);
% imwrite(W_image,'lena-BasicMethod.jpg');
attack_proj(W_image,B,a,K,W2D);





% W_imageA = main_Adaptive(I,B,a,W2D,K,alpha,0);
% % imwrite(W_imageA,'lena-adaptiveMethod.jpg');
% attack_proj(W_imageA,B,a,K,W2D);

%W_image = embed_proj(I,B,a,W2D,K,alpha);
% imwrite(W_image,'lena-BasicMethod.jpg');
%attack_proj(W_image,B,a,K,W2D);