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

dv_ds = gradient(v, s);  % Compute velocity change over distance
G_forward = dv_ds / g;  % Convert to G-force

figure;
plot(s, G_forward, 'g', 'LineWidth', 2);
xlabel('Path Length (m)');
ylabel('Forward/Backward G-Force');
title('Forward/Backward G-Forces Along Banked Turn');
grid on;
