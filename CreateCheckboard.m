function [ chb0, chb1, black ] = CreateCheckboard(  size, dWidth, dLength )
%CreateCheckboard Create a checkerboard pattern for visual stimulus
%   Args:
%       size (real scalar): Number of tiles (black or white) in pattern.
%       dWidth (real scalar): Half the width of the middle red cross.
%                               Defaults to 2.
%       dLength (real scalar): Half the length of the middle red cross.
%                               Deaults to 10.
%   Returns:
%       chb0 (real 3D matrix): RGB checkerboard pattern (normalized to
%                               0-1).
%       chb1 (real 3D matrix): RGB checkerboard pattern inverted with
%                               respect to chb0 (normalized to 0-1).

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

    function check = checkerboard_v1(tile_size, num_rows, num_cols)
        tile = [ones(tile_size, tile_size), zeros(tile_size, tile_size);
                zeros(tile_size, tile_size), ones(tile_size, tile_size)];
        check = tile;
        for i = 1:num_cols-1
            check = [check, tile];
        end
        row = check;
        for i = 1:num_rows-1
            check = [check; row];
        end
        return 
    end

    function check = black_sreen(tile_size, num_rows, num_cols)
        tile = [ones(tile_size, tile_size), zeros(tile_size, tile_size);
                ones(tile_size, tile_size), ones(tile_size, tile_size)];
        check = tile;
        for i = 1:num_cols-1
            check = [check, tile];
        end
        row = check;
        for i = 1:num_rows-1
            check = [check; row];
        end
        return 
    end

    tile_size = idivide(int32(96), size) * dWidth;
    % tile_size
    
    c0 = (checkerboard_v1(tile_size, size, size) < 0.5);
    c1 = (checkerboard_v1(tile_size, size, size) > 0.5);
    black = (checkerboard_v1(tile_size, size, size) < -1);
    black = cat(3, black, black, black);
    
    % c0 = (checkerboard(tile_size, size, size) < 0.5);
    % c1 = (checkerboard(tile_size, size, size) > 0.5);
    chb0 = CreatePattern(c0, dWidth, dLength);
    chb1 = CreatePattern(c1, dWidth, dLength);
    chb0 = chb0 / 255;
    chb1 = chb1 / 255;

end

