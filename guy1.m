db = IMAGE_DB;
DBle = D_LEFT_EYES;
DBre = D_RIGHT_EYES;
DBn = D_NOSES;
DBm = D_MOUTHS;
DBPle = D_LEFT_EYES_POINTS;
DBPre = D_RIGHT_EYES_POINTS;
DBPn = D_NOSES_POINTS;
DBPm = D_MOUTHS_POINTS;

baseImage = 1;
el = 1;
er = 3;
n = 19;
m = 5;


figure
img = doSomething(db, DBle, DBre, DBn, DBm, DBPle, DBPre, DBPn, DBPm, el, er, n, m, baseImage, 0.1);
imshow(img);



