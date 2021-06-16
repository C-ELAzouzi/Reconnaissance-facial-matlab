clear all;
clc;
xdel(winsid());
/*
id=fix(n/2);
idd=fix(m/2);

im1=Image(1:id,1:idd);
im2=Image(id+1:2*id,1:idd);
im3=Image(1:id,idd+1:idd*2);
im4=Image(id+1:2*id,idd+1:idd*2);

im1=Image(1:id,1:idd);
im2=Image(id+1:2*id,1:idd);

//im3=Image(2*id+1:n,:);
figure
imshow(Image)
figure
imshow(im1);
figure
imshow(im2);
figure
imshow(im3);
figure
imshow(im4)
*/
for x=1:50
    if(x==21 || x==34)
    else
    for y=1:12
        if(y==1 || y==2 || y==9 || y==10)           
        else
        if(y<=9)
   
        a=sprintf('Base2/%d-0%d.jpg',x,y);
        else
         a=sprintf('Base2/%d-%d.jpg',x,y);
        end    
        
        Image=imread(a);
        [n,m]=size(Image);
            val_i=n/5;
            val_j=m/5;
            cmp=1;
            
                for i=0:4
                    for j=0:4
                       img=Image(i*val_i+1:(i+1)*val_i,j*val_j+1:(j+1)*val_j);
                       b=sprintf('%d-0%d-imagette%d.jpg',x,y,cmp);
                       cmp=cmp+1;
                       folder = 'C:\Users\azouz\Desktop\TP TM\Base_imagette';
                       fullFileName = fullfile(folder,b);
                       imwrite(img,fullFileName);
                       end
                       
                end
                
                cmp=1;

       
        end
    end 
    
    end
end






