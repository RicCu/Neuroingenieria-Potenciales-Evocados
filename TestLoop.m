s = 0;
c0 = -1;
c1 = -1;
img = -1;
size = 4;
[c0, c1, img] = StimulateVision(s, c0, c1, img, size);
for i = 0:150
    s = xor(s, 1);
    %tic
    [c0, c1, img] = StimulateVision(s, c0, c1, img);
    %toc
    pause(0.5)
end