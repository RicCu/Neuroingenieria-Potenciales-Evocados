function [ rc, chkb0, chkb1, img_handle ] = StimulateVision(state, chkb0, chkb1, img_handle, dWidth, dLength)
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
    if (~exist('dWidth', 'var'))
        dWidth = 2;     % Cross has width of 2*dWidth
    end
    if (~exist('dLength', 'var'))
        dLength = 10;   % Cross has length of 2*dLength
    end
    if (~exist('chkb0', 'var')) || (~exist('chkb1', 'var') || (length(chkb0) == 1) || (length(chkb1) == 1))
        [chkb0, chkb1] = CreateCheckboard(dWidth, dLength);
    end
    if (~exist('img_handle', 'var') || img_handle < 0)
        img_handle = image(chkb0)
    end
    % Clear previous image and create new checkerboard
    %cla reset;
    if state == 0
        set(img_handle, 'CData', chkb0);
    elseif state == 1
        set(img_handle, 'CData', chkb1);
    else
        img_handle = -1;
        return
    end
    rc = 0;
    return
end

