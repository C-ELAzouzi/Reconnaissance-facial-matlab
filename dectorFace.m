
faceDetector = vision.CascadeObjectDetector;
I = imread('Base/1-11.jpg');
bboxes = faceDetector(I);
IFaces = insertObjectAnnotation(I,'rectangle',bboxes,'Face');  
image=imcrop(IFaces,bboxes);
folder='C:\Users\azouz\Desktop\TP TM\Base2';
fullFileName=fullfile(folder,'img.jpg');
imwrite(image,fullFileName);