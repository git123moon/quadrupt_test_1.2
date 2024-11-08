% MATLAB Code for Simulating a 3-Joint Leg with Hip Ab/Ad, Knee, and Ankle Joints
clc;
clear;

% Leg Segment Lengths (in meters)
L1 = 0.15;  % Length of upper leg (hip to knee)
L2 = 0.15;  % Length of lower leg (knee to ankle)
L3 = 0.05;  % Length of foot (ankle to ground/spherical head)

% Joint angles (in radians)
% Hip abduction/adduction angles (side-to-side movement)
theta_ab_ad = linspace(-pi/6, pi/6, 100);  % From -30 to 30 degrees

% Hip flexion/extension angles (forward/backward movement)
theta_hip = linspace(0, pi/4, 100);  % From 0 to 45 degrees

% Knee joint angles (flexion)
theta_knee = linspace(0, pi/4, 100);  % From 0 to 45 degrees

% Ankle joint angles
theta_ankle = linspace(0, pi/6, 100);  % From 0 to 30 degrees

% Duration for the simulation (in seconds)
simulation_time = 7;  % Simulate for 7 seconds
frames = length(theta_hip);  % Number of frames
time_per_frame = simulation_time / frames;  % Time per frame

% Initialize figure for visualization
figure;
axis equal;
xlim([-0.5 0.5]);
ylim([-0.5 0.5]);
grid on;
title('3-Joint Leg Simulation (Hip Ab/Ad, Knee, Ankle)');
xlabel('X Position (m)');
ylabel('Y Position (m)');

% Loop through the angles to simulate the leg movement for 7 seconds
for i = 1:frames
    % Hip ab/adduction transformation (side-to-side)
    x0 = 0;
    y0 = 0;  % Starting position (hip joint)

    % Upper leg position (hip to knee)
    x1 = L1 * cos(theta_hip(i)) * cos(theta_ab_ad(i));
    y1 = L1 * sin(theta_hip(i));

    % Lower leg position (knee to ankle)
    x2 = x1 + L2 * cos(theta_hip(i) + theta_knee(i));
    y2 = y1 + L2 * sin(theta_hip(i) + theta_knee(i));

    % Foot position (ankle to ground)
    x3 = x2 + L3 * cos(theta_hip(i) + theta_knee(i) + theta_ankle(i));
    y3 = y2 + L3 * sin(theta_hip(i) + theta_knee(i) + theta_ankle(i));

    % Clear plot for each frame
    cla;

    % Plot the leg segments
    hold on;
    plot([x0, x1], [y0, y1], 'b-o', 'LineWidth', 2);  % Hip to Knee
    plot([x1, x2], [y1, y2], 'r-o', 'LineWidth', 2);  % Knee to Ankle
    plot([x2, x3], [y2, y3], 'g-o', 'LineWidth', 2);  % Ankle to Foot
    plot(x3, y3, 'ko', 'MarkerSize', 10, 'MarkerFaceColor', 'k');  % Foot position

    % Plot labels
    text(x1, y1, 'Knee', 'HorizontalAlignment', 'right');
    text(x2, y2, 'Ankle', 'HorizontalAlignment', 'right');
    text(x3, y3, 'Foot', 'HorizontalAlignment', 'right');

    % Pause to visualize motion
    pause(time_per_frame);  % Pause based on time per frame to achieve 7 seconds simulation
end
