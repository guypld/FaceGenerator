function [out] = randomFullImage(eye_left_db, eye_right_db, mouth_db, nose_db, left_db, right_db, eyes, mouth, nose, cheaks)

out = -1 * ones(192,168);

b = (out < 0);
if any(b)
    a1 = reshape(eye_left_db(eyes, :, :), 192, 168);
    a2 = reshape(eye_right_db(eyes, :, :), 192, 168);
    a3 = reshape(mouth_db(mouth, :, :), 192, 168);
    out(b) = a1(b) + a2(b) + a3(b);
end

b = (out < 0);
if any(b)
    a1 = reshape(nose_db(nose, :, :), 192, 168);
    out(b) = out(b) + a1(b);
end

b = (out < 0);
if any(b)
    a1 = reshape(left_db(cheaks, :, :), 192, 168);
    a2 = reshape(right_db(cheaks, :, :), 192, 168);
    out(b) = out(b) + a1(b) + a2(b);
end
