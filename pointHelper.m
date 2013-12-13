% pointer program helper to set source cordinates


IMAGE_DB = zeros(38, 192,168);

for i = 0:0
    disp(['myImg\' num2str(i) '.pgm']);
    A = imread(['myImg\' num2str(i) '.pgm'], 'pgm');
    IMAGE_DB(i+1,:,:) = A;
    % display image
    showImage(A);
    
    [x, y] = ginput();

    Ox = x'
    Oy = y'
    
    save(['myPoint\' num2str(i) '.mat'],'Ox','Oy');
end