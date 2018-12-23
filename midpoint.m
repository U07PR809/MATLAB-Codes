function [t, w] = midpoint(t0, h, n, alpha, F)
w(1: 2, 1) = alpha;
t(1) = t0;

for i = 1: n
    K1 = F( t(i), w(1:2, i));
    K2 = F( t(i) + 0.5 * h, w(1:2, i) + 0.5 * h* K1);
    w(1:2, i+1) = w(1:2, i) + K2 * h;
    t(i+1) = t(i) + h;
end
end