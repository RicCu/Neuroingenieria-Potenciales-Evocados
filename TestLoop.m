s = 0;
c0 = -1;
c1 = -1;
img = -1;
size = 2;
%[c0, c1, img] = StimulateVision(s, c0, c1, img, size);
for i = 0:10
    tic
    s = xor(s, 1);
    
    [c0, c1, img] = StimulateVision(s, c0, c1, img, size, 1);
    
    pause(0.5)
    toc
end