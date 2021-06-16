    image=imread('Base/21-07.jpg');
    R=image(:,:,1);
    G=image(:,:,2);
    B=image(:,:,3);
    subplot(2,3,1);
    imshow(R);
    subplot(2,3,2);
    imshow(G);
    subplot(2,3,3);
    imshow(B);
    subplot(2,3,4);
    imshow(image);
    
    
    
