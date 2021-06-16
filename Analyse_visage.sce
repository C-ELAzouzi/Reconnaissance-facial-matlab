clear ;
xdel(winsid());
clc ;
exec lbp.sci
exec getmapping.sci
nb_classe =50;
nb_image =12;
nb_ima_train = 4 ;
nb_bins =255; 
Attribut = zeros(nb_ima_train * nb_classe,nb_bins);
Attributs_test=zeros(nb_ima_train * nb_classe,nb_bins);
attribut_test=zeros(1,nb_bins);
comp_train = 1;
comp_train_test=1;
inter=0;
classe_estime=zeros(nb_bins,1);
taux_de_classification=0;
nombre_image_test=nb_ima_train * nb_classe;
tic
//apprentissage
for i = 1: nb_image * nb_classe
    //extraction des attributs de texture pour les images de la base d'apprentissage
if(modulo(i,2)~= 0) 
    num_classe(comp_train)=floor((i-1)/nb_image)+1;
    if(num_classe(comp_train)~=21 && num_classe(comp_train)~=34)
        then
    num_image=1+ modulo (i-1,12) ;
    // le path de chaque image
    if(num_image<9 & num_image>2)
        fichier_train=strcat(['Base2\', msprintf('%d',num_classe(comp_train)),'-0',msprintf('%d',num_image),'.jpg']);
        disp([fichier_train 'Classe' msprintf('%d',num_classe(comp_train))]);
    Ima_train=imread(fichier_train);
    Ima_gray_train = rgb2gray(Ima_train);
    //Extraction des attributs de texture
    mapping = getmapping(8,'riu2');
     //X = lbp(Ima_gray_train,1,8, mapping,'h');
    Attribut(comp_train,:) = lbp(Ima_gray_train,1,8,0,'h');
    comp_train = comp_train + 1 ;
    //extraction des attributs de texture pour les images de la base test
    elseif(num_image>10)
        
        fichier_train=strcat(['Base2\',msprintf('%d',num_classe(comp_train)),'-',msprintf('%d',num_image),'.jpg']);
        disp([fichier_train 'Classe' msprintf('%d',num_classe(comp_train))]);
    Ima_train=imread(fichier_train);
    Ima_gray_train = rgb2gray(Ima_train);
    //Extraction des attributs de texture
    mapping = getmapping(8,'riu2');
     //X = lbp(Ima_gray_train,1,8, mapping,'h');
    Attribut(comp_train,:) = lbp(Ima_gray_train,1,8,0,'h');
    comp_train = comp_train + 1 ;
    //extraction des attributs de texture pour les images de la base test
    else        
    end   
    end
else
    
    num_classe_test(comp_train_test)=floor((i-1)/nb_image)+1;
    if(num_classe(comp_train_test)~=21 && num_classe(comp_train_test)~=34)
        then
    num_image_test=1+ modulo (i-1,12) ;
    // le path de chaque image
    if (num_image <9 & num_image>2)
    fichier_train_test=strcat(['Base2\', msprintf('%d',num_classe_test(comp_train_test)),'-0',msprintf('%d',num_image_test),'.jpg']);
    disp([fichier_train_test 'Classe' msprintf('%d',num_classe_test(comp_train_test))]);
    Ima_train_test=imread(fichier_train_test);
    Ima_gray_train_test = rgb2gray(Ima_train_test);
    
    Attributs_test(comp_train_test,:) = lbp(Ima_gray_train_test,1, 8,0,'h');
    comp_train_test = comp_train_test + 1 ;
elseif(num_image>10)
    fichier_train_test=strcat(['Base2\',msprintf('%d',num_classe_test(comp_train_test)),'-',msprintf('%d',num_image_test),'.jpg']);
    disp([fichier_train_test 'Classe' msprintf('%d',num_classe_test(comp_train_test))]);
    Ima_train_test=imread(fichier_train_test);
    Ima_gray_train_test = rgb2gray(Ima_train_test);
    
    Attributs_test(comp_train_test,:) = lbp(Ima_gray_train_test,1, 8,0,'h');
    comp_train_test = comp_train_test + 1 ;
    else
    end
    
    end
end
end
t1=toc()
//ima_test=imread('Base\21-01.jpg');
//ima_test_gray=rgb2gray(ima_test);
//imshow(ima_test);

//décision
tic
//attribut_test=lbp(ima_test_gray,1, 8, 0, 'h');
n=255;
compteur=zeros(nb_ima_train * nb_classe,1);
// extraire les histrogrammes
for k = 1:nb_ima_train * nb_classe
    for i = 1: nb_ima_train * nb_classe
        for j=1:n
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
t2=toc()

