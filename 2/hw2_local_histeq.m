function [ret] = hw2_local_histeq(ImagePath,n)

Image = imread(ImagePath);
[row, column] = size(Image);
result =uint8( zeros(row,column));
% x = padarray(Image,[2,2]);
if rem(row,n)==0
    if rem(column,n)==0
        for r = 1 : row/n
           for c = 1 : column/n
                 result(((r-1)*n)+1:r*n,((c-1)*n)+1:c*n) = global_cdf( Image( ((r-1)*n)+1:r*n,((c-1)*n)+1:c*n ) );    
           end    
        end
    else
        temp1 = uint8( zeros( row,column+(n-(rem(column,n))) ) );
        temp2 = uint8( zeros( row,column+(n-(rem(column,n))) ) );
        temp1(1:row,1:column)=Image(1:row,1:column);
        [trow,tcolumn] = size(temp1);
        for r = 1 : trow/n
           for c = 1 : tcolumn/n
                 temp2(((r-1)*n)+1:r*n,((c-1)*n)+1:c*n) = global_cdf( temp1( ((r-1)*n)+1:r*n,((c-1)*n)+1:c*n ) );    
           end 
        end
        result(1:row,1:column)=temp2(1:row,1:column);
    end
end

if rem(row,n)~=0
    if rem(column,n)==0
        temp1 = uint8( zeros( row+(n-(rem(row,n))),column ) );
        temp2 = uint8( zeros( row+(n-(rem(row,n))),column ) );
        temp1(1:row,1:column)=Image(1:row,1:column);
        [trow,tcolumn] = size(temp1);
        for r = 1 : trow/n
           for c = 1 : tcolumn/n
                 temp2(((r-1)*n)+1:r*n,((c-1)*n)+1:c*n) = global_cdf( temp1( ((r-1)*n)+1:r*n,((c-1)*n)+1:c*n ) );    
           end    
        end
        result(1:row,1:column)=temp2(1:row,1:column);
    else
        temp1 = uint8( zeros( row+(n-(rem(row,n))),column+(n-(rem(column,n))) ) );
        temp2 = uint8( zeros( row+(n-(rem(row,n))),column+(n-(rem(column,n))) ) );
        temp1(1:row,1:column)=Image(1:row,1:column);
        [trow,tcolumn] = size(temp1);
        for r = 1 : trow/n
           for c = 1 : tcolumn/n
                 temp2(((r-1)*n)+1:r*n,((c-1)*n)+1:c*n) = global_cdf( temp1( ((r-1)*n)+1:r*n,((c-1)*n)+1:c*n ) );    
           end
        end
        result(1:row,1:column)=temp2(1:row,1:column);
    end
end
figure;imshow(result);title(['Locally Equalized n =' num2str(n) ' mse=' num2str(immse(Image,result))]);hold on
ret = result;
end

