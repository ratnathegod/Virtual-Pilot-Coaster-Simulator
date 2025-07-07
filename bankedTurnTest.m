clear; clc; close all;

g = 9.81;  
h0 = 125;  
R_loop = 20;  
R_banked = 70;  

x_end = 20;  
y_end = 0;  
z_end = 85;  
v_end = sqrt(2 * g * (h0 - z_end));  

n_points = 100;  
s = linspace(0, pi * R_banked, n_points);  
h = linspace(z_end, z_end - 30, n_points);  

angle_offset = -pi/2;  
angle = linspace(angle_offset, pi + angle_offset, n_points);  

x = x_end - R_banked * sin(angle);  
y = y_end + R_banked * (1 - cos(angle));  
z = h;  

v = sqrt(v_end^2 + 2 * g * (z_end - z));  

theta_ideal = atan2d(v.^2, g * R_banked);  

G_vert = (1 ./ cosd(theta_ideal)) .* ones(size(s));  
G_lat = zeros(size(s));  
G_total = G_vert;  

figure;
scatter3(x, y, z, 50, v, 'filled');  
colormap(jet);  
colorbar;  
xlabel('X Position (m)');  
ylabel('Y (Banking) Position (m)');  
zlabel('Height (m)');  
title('3D Ideal Banked Turn');  
grid on;  
axis equal;  
view(3);  

figure;  
subplot(3,1,1);  
plot(s, G_lat, 'b', 'LineWidth', 2);  
xlabel('Track Length (m)');  
ylabel('Lateral G-Force');  
title('Lateral G-Forces in Ideal Banked Turn');  
grid on;  

subplot(3,1,2);  
plot(s, G_vert, 'r', 'LineWidth', 2);  
xlabel('Track Length (m)');  
ylabel('Vertical G-Force');  
title('Vertical G-Forces in Ideal Banked Turn');  
grid on;  

subplot(3,1,3);  
plot(s, G_total, 'k', 'LineWidth', 2);  
xlabel('Track Length (m)');  
ylabel('Total G-Force');  
title('Total G-Force in Ideal Banked Turn');  
grid on;  

fprintf('Ideal Banking Angle Range: %.2f° to %.2f°\n', min(theta_ideal), max(theta_ideal));  
fprintf('Max Vertical Gs: %.2f\n', max(G_vert));  
fprintf('Max Total Gs: %.2f\n', max(G_total));  
