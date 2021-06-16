clear ;
xdel(winsid());
clc ;
exec lbp.sci
exec getmapping.sci
nb_classe =50;
nb_image =8;
nb_ima_train = 4;
//ona 25 imagette
nb_bins =255; 
Attribut = zeros(nb_ima_train * nb_classe,nb_bins);
Attributs_test=zeros(nb_ima_train * nb_classe,nb_bins);
attribut_test=zeros(1,nb_bins);
comp_train = 1;
comp_train_test=1;
inter=0;
classe_estime=zeros(nb_bins,1);
taux_de_classification=0;

img1=imread('Base_imagette/1-03-imagette1.jpg');
img2=imread('Base_imagette/1-03-imagette2.jpg');
img3=imread('Base_imagette/1-03-imagette3.jpg');
img4=imread('Base_imagette/1-03-imagette4.jpg');
img5=imread('Base_imagette/1-03-imagette5.jpg');
img6=imread('Base_imagette/1-03-imagette6.jpg');
img7=imread('Base_imagette/1-03-imagette7.jpg');
img8=imread('Base_imagette/1-03-imagette8.jpg');
img9=imread('Base_imagette/1-03-imagette9.jpg');
img10=imread('Base_imagette/1-03-imagette10.jpg');
img11=imread('Base_imagette/1-03-imagette11.jpg');
img12=imread('Base_imagette/1-03-imagette12.jpg');
img13=imread('Base_imagette/1-03-imagette13.jpg');
img14=imread('Base_imagette/1-03-imagette14.jpg');
img15=imread('Base_imagette/1-03-imagette15.jpg');
img16=imread('Base_imagette/1-03-imagette16.jpg');
img17=imread('Base_imagette/1-03-imagette17.jpg');
img18=imread('Base_imagette/1-03-imagette18.jpg');
img19=imread('Base_imagette/1-03-imagette19.jpg');
img20=imread('Base_imagette/1-03-imagette20.jpg');
img21=imread('Base_imagette/1-03-imagette21.jpg');
img22=imread('Base_imagette/1-03-imagette22.jpg');
img23=imread('Base_imagette/1-03-imagette23.jpg');
img24=imread('Base_imagette/1-03-imagette24.jpg');
img25=imread('Base_imagette/1-03-imagette25.jpg');
figure
subplot(5,5,1);
imshow(img1);
subplot(5,5,2);
imshow(img2);
subplot(5,5,3);
imshow(img3);
subplot(5,5,4);
imshow(img4);
subplot(5,5,5);
imshow(img5);
subplot(5,5,6);
imshow(img6);
subplot(5,5,7);
imshow(img7);
subplot(5,5,8);
imshow(img8);
subplot(5,5,9);
imshow(img9);
subplot(5,5,10);
imshow(img10);
subplot(5,5,11);
imshow(img11);
subplot(5,5,12);
imshow(img12);
subplot(5,5,13);
imshow(img13);
subplot(5,5,14);
imshow(img14);
subplot(5,5,15);
imshow(img15);
subplot(5,5,16);
imshow(img16);
subplot(5,5,17);
imshow(img17);
subplot(5,5,18);
imshow(img18);
subplot(5,5,19);
imshow(img19);
subplot(5,5,20);
imshow(img20);
subplot(5,5,21);
imshow(img21);
subplot(5,5,22);
imshow(img22);
subplot(5,5,23);
imshow(img23);
subplot(5,5,24);
imshow(img24);
subplot(5,5,25);
imshow(img25);

/*
nombre_image_test=nb_ima_train * nb_classe;
        Image=imread('Base2/1-03.jpg');
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
/*
for i=1:50
    if(i==21 || i==34)
    else
    for j=1:12
        if(j==1 || j==2 || j==9 || j==10)           
        else
        if(j<=9)
   
        a=sprintf('Base/%d-0%d.jpg',i,j);
        else
        
         a=sprintf('Base/%d-%d.jpg',i,j);
        end    
        Ima_train=imread(a);
        Ima_gray_train = rgb2gray(Ima_train);
  
        Attribut(comp_train,:) = lbp(Ima_gray_train,1,8, 0,'h');
        comp_train = comp_train + 1 ;
       

        
        end
    end 
    
    end
end
//apprentissage


    //extraction des attributs de texture pour les images de la base test
/*
    num_classe_test(comp_train_test)=floor((i-1)/nb_image)+1;
    num_image_test=1+ modulo (i-1,12) ;
    // le path de chaque image
    if (num_image_test <10)
    fichier_train_test=strcat(['Base\', msprintf('%d',num_classe_test(comp_train_test)),'-0',msprintf('%d',num_image_test),'.jpg']);
    else
    fichier_train_test=strcat(['Base\',msprintf('%d',num_classe_test(comp_train_test)),'-',msprintf('%d',num_image_test),'.jpg']);
    end 
    disp([fichier_train_test 'Classe' msprintf('%d',num_classe_test(comp_train_test))]);
    Ima_train_test=imread(fichier_train_test);
    Ima_gray_train_test = rgb2gray(Ima_train_test);
    //Extraction des attributs de texture
    //mapping = getmapping(16,'u2');
    Attributs_test(comp_train_test,:) = lbp(Ima_gray_train_test,1,8, 0, 'h');
    comp_train_test = comp_train_test + 1 ;
    */

//ima_test=imread('Base\21-01.jpg');
//ima_test_gray=rgb2gray(ima_test);
//imshow(ima_test);

//décision
tic
//attribut_test=lbp(ima_test_gray,1, 8, 0, 'h');
/*
compteur=zeros(nb_ima_train * nb_classe,1);
// extraire les histrogrammes
for k = 1:nb_ima_train * nb_classe
    for i = 1: nb_ima_train * nb_classe
        for j=1:nb_bins
            inter=inter+min(Attributs_test(k,j),Attribut(i,j));
        end 
        compteur(k,i)=inter;
        inter=0;
end
end


//extraction de la classe estimée pour chaque image test 
for i =1:nb_ima_train * nb_classe
    [maxi,indice]=max(compteur(i,:));
    //classe_estime(i)=(floor((indice-1)/6)) + 1;
    classe_estime(i)= num_classe(indice);
end
//comparaison 
for i =1:nb_ima_train * nb_classe
    if(classe_estime(i)==num_classe_test(i))
        taux_de_classification=taux_de_classification+1;
      end
end
taux_de_classification=taux_de_classification/nombre_image_test;
toc
/*
maxi=max(compteur);
indice=0;
for i=1:nb_ima_train * nb_classe
    if(compteur(i)==maxi)
        indice=(floor((i-1)/6)) + 1;
        return;
        end
end

*/
