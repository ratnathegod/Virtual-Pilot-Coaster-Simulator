% MATLAB script to generate P-v diagrams for thermodynamics problems
clc; clear; close all;

% Define figure
figure;
tiledlayout(3,1);

%% Device 1: Isobaric Expansion
title1 = "Device 1: Piston-Cylinder with Heat & Work Input";
nexttile;
hold on;
title(title1);
xlabel('Volume (m^3)'); ylabel('Pressure (kPa)');
grid on;
plot([0.1, 0.5], [175, 175], 'r-o', 'LineWidth', 2);
text(0.1, 175, 'State 1', 'VerticalAlignment', 'bottom');
text(0.5, 175, 'State 2', 'VerticalAlignment', 'bottom');
hold off;

%% Device 2: Thermodynamic Cycle
title2 = "Device 2: Piston-Cylinder Cycle (Air)";
nexttile;
hold on;
title(title2);
xlabel('Volume (m^3)'); ylabel('Pressure (kPa)');
grid on;
V = [2 2 10 2];
P = [500 100 100 500];
plot(V, P, 'b-o', 'LineWidth', 2);
text(2, 500, 'State 1', 'VerticalAlignment', 'bottom');
text(2, 100, 'State 2', 'VerticalAlignment', 'bottom');
text(10, 100, 'State 3', 'VerticalAlignment', 'bottom');
hold off;

%% Device 3: Polytropic Compression
title3 = "Device 3: Polytropic Compression";
nexttile;
hold on;
title(title3);
xlabel('Volume (m^3)'); ylabel('Pressure (kPa)');
grid on;
V1 = 0.1; P1 = 100;
V2 = 0.035; P2 = 800;
plot([V1, V2], [P1, P2], 'g-o', 'LineWidth', 2);
text(V1, P1, 'State 1', 'VerticalAlignment', 'bottom');
text(V2, P2, 'State 2', 'VerticalAlignment', 'bottom');
hold off;
