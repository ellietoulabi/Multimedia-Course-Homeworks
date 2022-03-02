% sd_low = 4 , sd_high= 100

% I = imread('Low.bmp');
% J = imread('High.bmp');
% sd_low = 4;
% sd_high= 100;
% k = H4_hybrid(I,J,sd_low,sd_high);

function [k] = H4_hybrid(I,J,m,n)

face1 = uint8(I);
face2 = uint8(J);

lowfreq = imgaussfilt(face1,m);
f2 = imgaussfilt(face2,n);

highf = (255-face2) -(255- f2);
k = 255-((highf) +(255-lowfreq));
imshow( 255-((highf) +(255-lowfreq)) );
 
end

