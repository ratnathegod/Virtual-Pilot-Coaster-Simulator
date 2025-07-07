clear; clc; close all;

g = 9.81;  
h0 = 125;  
R_banked = 70;  

x_end = 20;  
y_end = 0;  
z_end = 85;  
v_end = sqrt(2 * g * (h0 - z_end));  

n_points = 100;  
s = linspace(0, pi * R_banked, n_points);  
h = linspace(z_end, z_end - 30, n_points);  

v = sqrt(v_end^2 + 2 * g * (z_end - h));  

theta_ideal = atan2d(v.^2, g * R_banked);  

G_vert = (1 ./ cosd(theta_ideal)) .* ones(size(s));  

figure;
plot(s, G_vert, 'r', 'LineWidth', 2);
xlabel('Path Length (m)');
ylabel('Vertical G-Force');
title('Up/Down G-Forces Along Banked Turn');
grid on;
