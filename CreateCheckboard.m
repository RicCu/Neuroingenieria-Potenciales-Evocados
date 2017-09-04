function [ chb0, chb1 ] = CreateCheckboard(  dWidth, dLength )
%CreateCheckboard Create a checkerboard pattern for visual stimulus
%   Args:
%       dWidth (real scalar): Half the width of the middle red cross.
%                               Defaults to 2.
%       dLength (real scalar): Half the length of the middle red cross.
%                               Deaults to 10.
%   Returns:
%       chb0 (real 3D matrix): RGB checkerboard pattern (normalized to
%                               0-1).
%       chb0 (real 3D matrix): RGB checkerboard pattern inverted with
%                               respect to chb0 (normalized to 0-1).

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
    c0 = (checkerboard(50, 5, 5) < 0.5);
    c1 = (checkerboard(50, 5, 5) > 0.5);
    chb0 = CreatePattern(c0, dWidth, dLength);
    chb1 = CreatePattern(c1, dWidth, dLength);
    chb0 = chb0 / 255;
    chb1 = chb1 / 255;

end

