function [ rc ] = StimulateVision(state)
%StimulateVision Create a checkerboard visual stimulus
%   Create a checkerboard pattern for visual stimulation. 
%   Args:
%       state (real scalar): Control which tiles are black and which are
%                            white. Valid values are 0 and 1.
%   Returns:
%       rc (real scalar): Return code. Success = 0; failure = -1.
    
    % Parameter validation and tile ordering
    if state == 0
        c1 = (checkerboard(50, 5, 5) < 0.5);
    elseif state == 1
        c1 = (checkerboard(50, 5, 5) > 0.5);
    else
        rc = -1;
        return
    end
    % Expand Checkerboard to RGB
    c1 = c1 * 255;
    c1 = cat(3, c1, c1, c1);
    % Create red cross in the middle
    dWidth = 2;     % Cross has width of 2*dWidth
    dLength = 10;   % Cross has length of 2*dLength
    midX = length(c1(:,1,1))/2;
    midY = length(c1(1,:,1))/2;
    c1(midX-dWidth:midX+dWidth, midY-dLength:midY+dLength, 1) = 255;
    c1(midX-dWidth:midX+dWidth, midY-dLength:midY+dLength,2) = 0;
    c1(midX-dWidth:midX+dWidth, midY-dLength:midY+dLength,3) = 0;
    c1(midX-dLength:midX+dLength, midY-dWidth:midY+dWidth, 1) = 255;
    c1(midX-dLength:midX+dLength, midY-dWidth:midY+dWidth,2) = 0;
    c1(midX-dLength:midX+dLength, midY-dWidth:midY+dWidth,3) = 0;
    imshow(c1)
    rc = 0;
    return
end

