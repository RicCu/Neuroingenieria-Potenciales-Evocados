function [ chb1, chb2 ] = CreateCheckboard(  dWidth, dLength )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    if (~exist('dWidth', 'var'))
        dWidth = 2;     % Cross has width of 2*dWidth
    end
    if (~exist('dLength', 'var'))
        dLength = 10;   % Cross has length of 2*dLength
    end
    function [ c ] = CreatePattern( c, dW, dL )
        % Expand Checkerboard to RGB
        c = c * 255;
        c = cat(3, c, c, c);
        % Create red cross in the middle
        midX = length(c(:,1,1))/2;
        midY = length(c(1,:,1))/2; 
        c(midX-dW :midX+dW, midY-dL:midY+dL, 1) = 255;
        c(midX-dW:midX+dW, midY-dL:midY+dL,2) = 0;
        c(midX-dW:midX+dW, midY-dL:midY+dL,3) = 0;
        c(midX-dL:midX+dL, midY-dW:midY+dW, 1) = 255;
        c(midX-dL:midX+dL, midY-dW:midY+dW,2) = 0;
        c(midX-dL:midX+dL, midY-dW:midY+dW,3) = 0;
        return
    end
    c1 = (checkerboard(50, 5, 5) < 0.5);
    c2 = (checkerboard(50, 5, 5) > 0.5);
    chb1 = CreatePattern(c1, dWidth, dLength);
    chb2 = CreatePattern(c2, dWidth, dLength);

end

