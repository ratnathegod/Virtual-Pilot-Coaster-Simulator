clear; clc; close all;

g = 9.81;  
h0 = 125;  
R_banked = 70;  

x_end = 20;  
y_end = 0;  
z_end = 85;  
v_end = sqrt(2 * g * (h0 - z_end));  

n_points = 20;  % Fewer points for clearer vectors
s = linspace(0, pi * R_banked, n_points);  
h = linspace(z_end, z_end - 30, n_points);  

v = sqrt(v_end^2 + 2 * g * (z_end - h));  

a_c = v.^2 / R_banked;  % Centripetal acceleration
a_g = g * ones(size(s)); % Gravitational acceleration

angle_offset = -pi/2;  
angle = linspace(angle_offset, pi + angle_offset, n_points);  

x = x_end - R_banked * sin(angle);  
y = y_end + R_banked * (1 - cos(angle));  
z = h;  

figure;
hold on;
quiver3(x, y, z, -a_c .* sin(angle), a_c .* cos(angle), -a_g, 'r', 'LineWidth', 1.5);  
scatter3(x, y, z, 50, 'b', 'filled');  
xlabel('X Position (m)');
ylabel('Y (Banking) Position (m)');
zlabel('Height (m)');
title('Acceleration Diagram for Banked Turn');
grid on;
view(3);
legend('Acceleration Vectors', 'Track Points');
