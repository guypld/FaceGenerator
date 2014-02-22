% Students: Ron Yanovich 038059747 , Guy Peled 029992930
function h = histImage( img)
%This routine builds the normalized histogram of image img.
   
    h = zeros( 1 , 256);
    
    % fill the histogram vector with pixels count
    for i=0:255
        count = size ( find(img == i)  );  %count(1) will get the pixel number in gray scale (i)
        h(i+1) = count(1);
    end
    
    %normalize histogram vector
    count = sum (h);
    if count > 0        % to avoid devide by zero
        h = h ./ count;      
    end

        
     