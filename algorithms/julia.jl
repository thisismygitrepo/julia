
using Plots
W = 1000;
H = 1000;
c = complex(0.2, 0.3);

re_min = -2.0;
re_max = 2.0;
im_min = -2.0;
im_max = 2.0;

re_range = range(re_min, re_max, length=W)
im_range = range(im_min, im_max, length=H)
mesh = Iterators.product(re_range, im_range)
mesh = complex.(first.(mesh), last.(mesh))
res = similar(res)

for idx=1:length(res)
    counter = 0
    z = mesh[idx]
    while abs(z) < 10 && counter < 255
        z = z^2 + c;
        counter += 1;
    end
    res[idx] = 255 - counter;
end
