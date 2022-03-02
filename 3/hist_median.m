function [] = hist_median2(image)

I = imread(image);
[row, column] = size(I);

result = im2uint8(zeros([row, column]));
ihistogram = zeros(1,256);
cnt = numel ( I );
index = uint16 ( 0 );
med1 = 0;
med2 = 0;
med3 = 0;

for r = 1:row
    for c = 1:column
        if I(r,c) == 255
             ihistogram(256)= ihistogram(256) + 1;
        else
            index = uint16 (I(r,c) + 1 );
            ihistogram(index)= ihistogram(index) + 1;
        end     
    end
end

c = 0;
for i = 1 : 256
    n = ceil (cnt / 2 );
    if  c > n
        med2 = i ;
        break;
    end
    c = ihistogram(i) + c;
end


cc = 0;
for i = 1 : med2 - 1
    n = ceil( sum(ihistogram(1:med2-1)) / 2 );
    if  cc > n
        med1 = i ;
        break;
    end
    cc = ihistogram(i) + cc;
end

ccc = 0;
for i = med2 : 256
    n = ceil( sum(ihistogram(med2:256)) / 2 );
    if  ccc > n
        med3 = i ;
        break;
    end
    ccc = ihistogram(i) + ccc;
end


for r = 1:row
    for c = 1:column
        if I(r,c) >= 0 && I(r,c)<= med1
            result(r,c)=0;
        elseif I(r,c) > med1 && I(r,c)<= med2
            result(r,c)=1;
        elseif I(r,c) > med2 && I(r,c)<= med3
            result(r,c)=2;
        elseif I(r,c) > med3 && I(r,c)<= 256
            result(r,c)=3;
        end     
    end
end



disp(['Median 1 = ' num2str(med1)]);
disp(['[0 , ' num2str(med1) ') :' num2str(sum(ihistogram(1:med1-1)))]);
disp(['[' num2str(med1) ', ' num2str(med2) ' ) :' num2str(sum(ihistogram(med1:med2-1)))]);

disp(['Median 2 = ' num2str(med2)]);
disp(['[0 , ' num2str(med2) ') :' num2str(sum(ihistogram(1:med2-1)))]);
disp(['[' num2str(med2) ' , 256] :' num2str(sum(ihistogram(med2:256)))]);

disp(['Median 3 = ' num2str(med3)]);
disp(['[' num2str(med2) ' , ' num2str(med3) ') :'  num2str(sum(ihistogram(med2:med3-1)))]);
disp(['[' num2str(med3) ' , 256] :'  num2str(sum(ihistogram(med3:256)))]);


%if 'im2uint8' is deleted from declaration of result different double image will be shown 
figure,imshow(result);

end

