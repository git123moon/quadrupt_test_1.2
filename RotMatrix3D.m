function R = RotMatrix3D(angles, is_radians)
    if nargin < 2
        is_radians = true;
    end
    if ~is_radians
        angles = deg2rad(angles);
    end
    roll = angles(1);
    pitch = angles(2);
    yaw = angles(3);

    Rx = [1, 0, 0;
          0, cos(roll), -sin(roll);
          0, sin(roll), cos(roll)];
    Ry = [cos(pitch), 0, sin(pitch);
          0, 1, 0;
          -sin(pitch), 0, cos(pitch)];
    Rz = [cos(yaw), -sin(yaw), 0;
          sin(yaw), cos(yaw), 0;
          0, 0, 1];
    R = Rz * Ry * Rx;
end
