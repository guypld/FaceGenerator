
images = [ IMAGE_DB1 ; IMAGE_DB2 ; IMAGE_DB3 ; IMAGE_DB4 ; IMAGE_DB5 ];

left_eye = 'left_eye';
right_eye = 'right_eye';
nose = 'nose';
mouth = 'mouth';

LEFT_EYES = getAllPossibaleFeatures(images, left_eye, 5, 5);
D_LEFT_EYES = getDifferentImages(LEFT_EYES, 20);

RIGHT_EYES = getAllPossibaleFeatures(images, right_eye, 5, 5);
D_RIGHT_EYES = getDifferentImages(RIGHT_EYES, 20);

NOSES = getAllPossibaleFeatures(images, nose, 5, 5);
D_NOSES = getDifferentImages(NOSES, 20);

MOUTHS = getAllPossibaleFeatures(images, mouth, 5, 5);
D_MOUTHS = getDifferentImages(MOUTHS, 20);








