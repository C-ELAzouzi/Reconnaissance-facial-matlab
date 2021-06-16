faceDetector = vision.CascadeObjectDetector;
for i=1:50
    if(i==21 || i==34)
    else
    for j=1:12
        if(j==1 || j==2 || j==9 || j==10)           
        else
        if(j<=9)
   
        a=sprintf('Base/%d-0%d.jpg',i,j);
        b=sprintf('%d-0%d.jpg',i,j);
        else
        
         a=sprintf('Base/%d-%d.jpg',i,j);
         b=sprintf('%d-%d.jpg',i,j);
        end    
        I=imread(a);
        bboxes = faceDetector(I);
    IFaces = insertObjectAnnotation(I,'rectangle',bboxes,'Face');
    image=imcrop(IFaces,bboxes);
    folder = 'C:\Users\azouz\Desktop\TP TM\Base2';
    fullFileName = fullfile(folder,b);
    imwrite(image,fullFileName);
        
        end
    end 
    
    end
end


