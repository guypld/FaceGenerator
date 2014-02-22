function FmakeIt(db, mask, out_count, b, e, n, m)

[in_count, h, w] = size(db);

for i = 1:out_count
    p = randperm(in_count);
    base = p(1:b)
    p = randperm(in_count);
    eyes = p(1:e)
    p = randperm(in_count);
    nose = p(1:n)
    p = randperm(in_count);
    mouth = p(1:m)
    out = FgenImage(db, mask, 3, 1, base, eyes, nose, mouth); 
    out = filter2(fspecial('average',2),out);
    out = filter2(fspecial('average',2),out);
    showImage(out);
end
