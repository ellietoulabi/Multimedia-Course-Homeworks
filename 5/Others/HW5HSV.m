%main HSV

I = imread('color_change.jpg');
w=15;



new_color=[248, 176, 254];
color_change(I,w,new_color);

function [] = color_change(I,w,new_color)

imshow(I);

[col,ro] = ginput(1);
c = round(col);
r = round(ro);

redChannel   = I(:,:,1);
greenChannel = I(:,:,2);
blueChannel  = I(:,:,3);

Im = rgb2hsv(I);

old_h=Im(r,c,1);
old_s=Im(r,c,2);
old_v=Im(r,c,3);


x=0;
if (old_h- w/256 < 0)
    x = 1 - w/256;
else
    x=old_h- w/256 ;
end

m1 = ( Im(:,:,1) <= old_h + w/256)&(Im(:,:,1) >= x);
m2 = ( Im(:,:,2)>= 0.5) & (Im(:,:,2) <= 1);
m3 = ( Im(:,:,3)>= 0.5) & (Im(:,:,3 )<= 0.95);


mask = m1 & m2 & m3;

redChannel(mask)= new_color(1);
greenChannel(mask)=new_color(2);
blueChannel(mask)=new_color(3);

rgbImageFixed = cat(3, redChannel, greenChannel, blueChannel);
imshow(rgbImageFixed,'InitialMagnification', 'fit');hold on
plot(c,r,'xg','MarkerSize',20,'LineWidth',2);



end

