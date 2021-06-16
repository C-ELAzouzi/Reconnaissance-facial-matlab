function attribut =ExtractionLbpCouleur(image,rayon,nb_voisin)
    //extraction des compsosnates RGB
    R=image(:,:,1);
    G=image(:,:,2);
    B=image(:,:,3);
    //extraction lbp
    attribut_R=lbp(R,rayon,nb_voisin,0,'h');
    attribut_G=lbp(G,rayon,nb_voisin,0,'h');
    attribut_B=lbp(B,rayon,nb_voisin,0,'h');
    taille_lbp=size(attribut_R);
    taille=taille_lbp(2);
    attribut=zeros(1,taille*3);
    attribut(1,1:taille)=attribut_R;
    attribut(1,taille+1:taille*2)=attribut_G;
    attribut(1,taille*2+1:taille*3)=attribut_B;
    
endfunction
