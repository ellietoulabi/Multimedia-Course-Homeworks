I = imread('color_change.jpg');
w=75;
new_color=[248, 176, 254];
color_changeRGB(I,w,new_color);

function [] = color_changeRGB(I,w,new_color)

%Image =m2double(I);
[row,column] = size(I);
column = uint8(column/3);
imshow(I);
% let the user pick one point
[col,ro] = ginput(1);
c = round(col);
r = round(ro);
result = im2uint8(zeros(row,column));
old_r=double(I(r,c,1));
old_g=double(I(r,c,2));
old_b=double(I(r,c,3));


redChannel = I(:, :, 1);
greenChannel = I(:, :, 2);
blueChannel = I(:, :, 3);

% gray = rgb2gray(I);
% blues = blueChannel-gray;
% reds = redChannel-gray ;
% greens = greenChannel-gray  ;

% blues = gray-blueChannel;
% reds = gray-redChannel ;
% greens = gray-greenChannel  ;
% 
% med =  medfilt2(gray,[3 3]);

% 
% mreds = redChannel >= (old_r - w) & redChannel <= (old_r+w);
% mgreens = greenChannel >= (old_g - w) & greenChannel <= (old_g+w);
% mblues = blueChannel >= (old_b - w) & blueChannel <= (old_b+w);
% mreds = reds >= (old_r - w) & reds <= (old_r+w);
% mgreens = greens >= (old_g - w) & greens <= (old_g+w);
% mblues = blues >= (old_b - w) & blues <= (old_b+w);
mask =  sqrt((double(redChannel) - old_r).^2 + (double(greenChannel) - old_g).^2 + (double(blueChannel) - old_b).^2) <= w ;


% mask = mreds & mgreens & mblues;
redChannel(mask)= new_color(1);
greenChannel(mask)=new_color(2);
blueChannel(mask)=new_color(3);

% redChannel(reds)=0;
% greenChannel(greens)=250;
% blueChannel(blues)=0;
rgbImageFixed = cat(3, redChannel, greenChannel, blueChannel)
%//rgbImageFixed = cat(3, reds, greens, blues);



imshow(rgbImageFixed);hold on
plot(c,r,'xg','MarkerSize',20,'LineWidth',2);


end

