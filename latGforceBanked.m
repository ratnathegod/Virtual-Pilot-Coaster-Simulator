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

G_lat = zeros(size(s));  

figure;
plot(s, G_lat, 'b', 'LineWidth', 2);
xlabel('Path Length (m)');
ylabel('Lateral G-Force');
title('Lateral G-Forces Along Banked Turn');
grid on;
