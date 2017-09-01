function [ rc ] = StimulateVision(state, dWidth, dLength)
%StimulateVision Create a checkerboard visual stimulus
%   Create a checkerboard pattern for visual stimulation. 
%   Args:
%       state (real scalar): Control which tiles are black and which are
%                               white. Valid values are 0 and 1.
%       dWidth (real scalar): Half the width of the middle red cross.
%                               Defaults to 2.
%       dLength (real scalar): Half the length of the middle red cross.
%                               Deaults to 10.
%   Returns:
%       rc (real scalar): Return code. Success = 0; failure = -1.
    
    % Parameter validation and tile ordering
    rc = -1;
    if state == 0
        c1 = (checkerboard(50, 5, 5) < 0.5);
    elseif state == 1
        c1 = (checkerboard(50, 5, 5) > 0.5);
    else
        return
    end
    if (~exist('dWidth', 'var'))
        dWidth = 2;     % Cross has width of 2*dWidth
    end
    if (~exist('dLength', 'var'))
        dLength = 10;   % Cross has length of 2*dLength
    end
    % Expand Checkerboard to RGB
    c1 = c1 * 255;
    c1 = cat(3, c1, c1, c1);
    % Create red cross in the middle
    midX = length(c1(:,1,1))/2;
    midY = length(c1(1,:,1))/2;
    c1(midX-dWidth:midX+dWidth, midY-dLength:midY+dLength, 1) = 255;
    c1(midX-dWidth:midX+dWidth, midY-dLength:midY+dLength,2) = 0;
    c1(midX-dWidth:midX+dWidth, midY-dLength:midY+dLength,3) = 0;
    c1(midX-dLength:midX+dLength, midY-dWidth:midY+dWidth, 1) = 255;
    c1(midX-dLength:midX+dLength, midY-dWidth:midY+dWidth,2) = 0;
    c1(midX-dLength:midX+dLength, midY-dWidth:midY+dWidth,3) = 0;
    % Clear previous image and create new checkerboard
    cla reset;
    imshow(c1)
    rc = 0;
    return
end

