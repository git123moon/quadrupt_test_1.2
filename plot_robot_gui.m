function plot_robot_gui()
    % Initialize the figure and sliders
    fig = uifigure('Name', 'Robot Kinematics Visualization', 'Position', [100 100 800 600]);

    % Create sliders for rotation and translation parameters
    rollSlider = uislider(fig, 'Position', [100, 450, 300, 3], 'Limits', [-20, 20], 'ValueChangedFcn', @(src, event) updatePlot());
    pitchSlider = uislider(fig, 'Position', [100, 400, 300, 3], 'Limits', [-20, 20], 'ValueChangedFcn', @(src, event) updatePlot());
    yawSlider = uislider(fig, 'Position', [100, 350, 300, 3], 'Limits', [-20, 20], 'ValueChangedFcn', @(src, event) updatePlot());

    xSlider = uislider(fig, 'Position', [100, 300, 300, 3], 'Limits', [-0.10, 0.10], 'ValueChangedFcn', @(src, event) updatePlot());
    ySlider = uislider(fig, 'Position', [100, 250, 300, 3], 'Limits', [-0.10, 0.10], 'ValueChangedFcn', @(src, event) updatePlot());
    zSlider = uislider(fig, 'Position', [100, 200, 300, 3], 'Limits', [-0.25, -0.10], 'ValueChangedFcn', @(src, event) updatePlot());

    % Set labels for each slider
    addSliderLabel(fig, rollSlider, 'Roll');
    addSliderLabel(fig, pitchSlider, 'Pitch');
    addSliderLabel(fig, yawSlider, 'Yaw');
    addSliderLabel(fig, xSlider, 'X');
    addSliderLabel(fig, ySlider, 'Y');
    addSliderLabel(fig, zSlider, 'Z');

    % Initialize the plot area
    ax = uiaxes(fig, 'Position', [450 100 300 300]);
    k = kinematics();  % Create an instance of the kinematics class

    function updatePlot()
        % Retrieve slider values
        roll = rollSlider.Value;
        pitch = pitchSlider.Value;
        yaw = yawSlider.Value;
        x = xSlider.Value;
        y = ySlider.Value;
        z = zSlider.Value;

        % Call the kinematics plot function
        k.plot_robot(ax, [x, y, z], [roll, pitch, yaw], ...
                     'is_radians', false, 'center_offset', [0, 0, 0]);
    end

    % Call the initial plot update
    updatePlot();
end

function addSliderLabel(fig, slider, label)
    % Adds a label to a slider
    lbl = uilabel(fig);
    lbl.Text = label;
    lbl.Position = [slider.Position(1) slider.Position(2)+20 100 22];
end
