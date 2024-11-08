function angle = point_to_rad(x, y)
    % Calculate the angle in radians based on the (x, y) coordinates
    % Use the `atan2` function for correct angle calculation in all quadrants
    angle = atan2(y, x);
end

