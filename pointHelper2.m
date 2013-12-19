% pointer program helper to set source cordinates
name= 0;

A = imread(['myImg\' num2str(name) '.pgm'], 'pgm');

putImage(A);
hold on; 
IMAGE_DB(i+1,:,:) = A;

dots = 36;

Ox = zeros(10,1);
Oy = zeros(10,1);  
i = 1;

while i <= dots
    [x, y] = ginput(1);
    plot(x,y,'r.','MarkerSize',10) 

    t(1) = text(x,y,num2str(i));
    set(t(:),'fontw','bold','fonts',12) 

    Ox(i) = x;
    Oy(i) = y;
    i= i + 1;
end

save(['newPoints\' num2str(name) '.mat'],'Ox','Oy');
