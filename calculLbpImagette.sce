clear ;
xdel(winsid());
clc ;
exec lbp.sci
exec getmapping.sci
nb_imagette =25;
nb_image=400;
nb_bins =255*25; 
Attribut = zeros(nb_image,nb_bins);
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
            taille=255;
            
                for i=0:4
                    for j=0:4
                       img=Image(i*val_i+1:(i+1)*val_i,j*val_j+1:(j+1)*val_j);
                       //Ima_train=imread(img);
                       //Ima_gray_train = rgb2gray(img);
                       Attribut(1,cmp*taille+1:(cmp+1)*taille) = lbp(img,1,8, 0,'h');
                       cmp=cmp+1;
                       end
                end
                cmp=1;
        end
    end 
    
    end
end






