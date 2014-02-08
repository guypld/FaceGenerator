
images = [ IMAGE_DB1 ; IMAGE_DB2 ; IMAGE_DB3 ; IMAGE_DB4 ; IMAGE_DB5 ];

[imgPerDb, h, w] = size(IMAGE_DB1);

left_eye = 'left_eye';
right_eye = 'right_eye';
nose = 'nose';
mouth = 'mouth';

[LEFT_EYES, LEFT_EYES_POINTS] = getAllPossibaleFeatures(images, left_eye, imgPerDb, 5);
[D_LEFT_EYES, D_LEFT_EYES_POINTS] = getDifferentImages(LEFT_EYES, LEFT_EYES_POINTS, 20);

[RIGHT_EYES, RIGHT_EYES_POINTS] = getAllPossibaleFeatures(images, right_eye, imgPerDb, 5);
[D_RIGHT_EYES, D_RIGHT_EYES_POINTS] = getDifferentImages(RIGHT_EYES, RIGHT_EYES_POINTS, 20);

[NOSES, NOSES_POINTS] = getAllPossibaleFeatures(images, nose, imgPerDb, 5);
[D_NOSES, D_NOSES_POINTS] = getDifferentImages(NOSES, NOSES_POINTS, 20);

[MOUTHS, MOUTHS_POINTS]= getAllPossibaleFeatures(images, mouth, imgPerDb, 5);
[D_MOUTHS, D_MOUTHS_POINTS] = getDifferentImages(MOUTHS, MOUTHS_POINTS, 20);








