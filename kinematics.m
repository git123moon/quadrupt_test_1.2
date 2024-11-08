classdef kinematics
    properties
        link_1 = 0.045;
        link_2 = 0.1115;
        link_3 = 0.155;
        phi = pi / 2;
        length = 0.25205;
        width = 0.105577;
        leg_origins;
    end

    methods
        function obj = kinematics()
            % Define the leg origins
            obj.leg_origins = [
                obj.length/2, obj.width/2, 0;
                -obj.length/2, obj.width/2, 0;
                -obj.length/2, -obj.width/2, 0;
                obj.length/2, -obj.width/2, 0
            ];
        end
        
        function pose = leg_IK(obj, xyz, rot, legID, is_radians, center_offset)
            if nargin < 5
                is_radians = true;
            end
            if nargin < 6
                center_offset = [0, 0, 0];
            end
            % Calculate joint angles and joint positions
            pose = obj.leg_IK_calc(xyz - center_offset, rot, legID, is_radians);
        end

        function pose = leg_IK_calc(obj, xyz, rot, legID, is_radians)
            % Calculate joint angles here and return the joint positions.
            % Implement specific IK calculations based on the leg geometry.
            % Placeholder return for simplicity.
            pose = [0, 0, 0];
        end
    end
end

