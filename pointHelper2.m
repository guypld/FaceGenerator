% pointer program helper to set source cordinates
name= 4;

A = imread(['myImg\' num2str(name) '.pgm'], 'pgm');

putImage(A);
hold on; 
IMAGE_DB(i+1,:,:) = A;

dots = 71;

Ox = zeros(10,1);
Oy = zeros(10,1);  
i = 1;

while i <= dots
    [x, y] = ginput(1);
    
    if x > 0 && y > 0
        Ox(i) = x;
        Oy(i) = y;
        
        %putImage(A);
        image(A);
        hold on;
        for tmp = 1 : i
            plot(Ox(tmp),Oy(tmp),'r.','MarkerSize',10) ;
            t(1) = text(Ox(tmp),Oy(tmp),num2str(tmp));
            set(t(:),'fontw','bold','fonts',10)             
        end    
        
        i= i + 1;
    else
        i = i - 1;
        if i < 1
            i = 1;
        end
        
        image(A);
        hold on;
        for tmp = 1 : i - 1
            plot(Ox(tmp),Oy(tmp),'r.','MarkerSize',10) ;
            t(1) = text(Ox(tmp),Oy(tmp),num2str(tmp));
            set(t(:),'fontw','bold','fonts',10)             
        end    
        
    end
end

save(['newPoints\' num2str(name) '.mat'],'Ox','Oy');
