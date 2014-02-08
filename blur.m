% IP HW 3
% Students: Ron Yanovich 038059747 , Guy Peled 029992930
%
% 3)    function    nim = blur(im,strength)
% 
%       Input:      im - a grayscale image (values in [0,255])
%                        strength - the strength of the blur (a value in [0..1] with 0 = no blur and 1= maximum blur).
%         Output:   nim - a grayscale image (values in [0,255]) which is the blurred version of im.
%                       Image nim is of the same size as im. 
function nim = blur(im, strength)

    if strength < 0 || strength > 1
        %legal check
        disp('strength should be between [0..1]');
        nim = im;
        return
    else
        %set kernal size & sigma acording to strength
        %kernel [1 - max_img_size]
        kernel = floor(max(size(im)) * (strength)) + 1;
        %sigma [1 - 51]
        sigma = (50 * strength) + 1;
    end

    x = 1 : kernel;
    %gousian
    d = exp( -((x - (kernel / 2) - 0.5) ./ sigma) .^ 2);
    mask = d' * d;
    mask = mask ./ sum(sum(mask));
    %convolusion
    nim = conv2(double(im),mask,'same');

