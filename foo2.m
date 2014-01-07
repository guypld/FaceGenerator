

% for i = 1:26
%     showImage(reshape(eye_left_db(i, :, :), 192, 168));
%     showImage(reshape(eye_right_db(i, :, :), 192, 168));
%     showImage(reshape(nose_db(i, :, :), 192, 168));
%     showImage(reshape(mouth_db(i, :, :), 192, 168));
%     showImage(reshape(left_db(i, :, :), 192, 168));
%     showImage(reshape(right_db(i, :, :), 192, 168));
% end

myPick = pick(1:26,4, 'or');
myPickSize = size(myPick)

% for i = myPickSize(1)
%     eyes = 8;
%     mouth = 15;
%     nose = 22;
%     cheaks = 2;
% end
    
for i = 1:7
    RANDOM = (int8(rand([1,4]) * 25) + 1);
    eyes = RANDOM(1);
    mouth = RANDOM(2);
    nose = RANDOM(3);
    cheaks = RANDOM(4);
    out = randomFullImage(eye_left_db, eye_right_db, mouth_db, nose_db, left_db, right_db, eyes, mouth, nose, cheaks);
    showImage(out);
end



% reshape(eye_left_db(1, :, :), 192, 168)
% reshape(eye_right_db(1, :, :), 192, 168)
% reshape(nose_db(1, :, :), 192, 168)
% reshape(mouth_db(1, :, :), 192, 168)
% reshape(left_db(1, :, :), 192, 168)
% reshape(right_db(1, :, :), 192, 168);



break;