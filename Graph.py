import matplotlib.pyplot as plt
from kinematics import kinematics

# Make the plot larger
plt.rcParams['figure.dpi'] = 150

k = kinematics()

# Define parameters
roll = 0
pitch = 0
yaw = 0
x = 0
y = 0
z = -0.15
rot_x = 0
rot_y = 0
rot_z = 0

# Call the update function to plot the robot
k.plot_robot(xyz=[[x, y, z], [x, y, z], [x, y, z], [x, y, z]], 
             rot=[roll, pitch, yaw], 
             is_radians=False, center_offset=[rot_x, rot_y, rot_z])

plt.show()  # Show the plot
