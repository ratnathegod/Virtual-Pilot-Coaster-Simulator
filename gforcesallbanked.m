%% MATLAB Code for Generating P-v Sketches for Homework 5 Devices
% Device 1: Piston-Cylinder with Water (Vapor Dome Sketch)
figure;
hold on;
% Schematic vapor dome (illustrative only)
% Create dummy curves for the saturated liquid and vapor lines.
% Here we use simple linear/quadratic segments to mimic a dome.
v_liq = linspace(0.001, 0.005, 50);                % liquid branch (small specific volumes)
P_liq = 175 + 50*(v_liq - 0.001);                    % arbitrary function for illustration
v_vap = linspace(0.5, 1.5, 50);                      % vapor branch (large specific volumes)
P_vap = 175 - 50*(v_vap - 0.5);                      % arbitrary function for illustration
plot(v_liq, P_liq, 'b', 'LineWidth', 2);             % plot saturated liquid line
plot(v_vap, P_vap, 'b', 'LineWidth', 2);             % plot saturated vapor line
% Connect the two curves (this is schematic)
plot([v_liq(end) v_vap(1)], [P_liq(end) P_vap(1)], 'b', 'LineWidth',2);

% Annotate the vapor dome
text(mean([v_liq(1), v_vap(end)]), 175, 'Saturation Dome','HorizontalAlignment','center');

% Plot process states
v1 = 0.00106; P1 = 175;    % State 1: saturated liquid
v2 = 0.54178; P2 = 175;    % State 2: quality = 50%
plot(v1, P1, 'ko','MarkerFaceColor','k','MarkerSize',8);
text(v1, P1, '  State 1','FontSize',12);
plot(v2, P2, 'ro','MarkerFaceColor','r','MarkerSize',8);
text(v2, P2, '  State 2','FontSize',12);

xlabel('Specific Volume (m^3/kg)');
ylabel('Pressure (kPa)');
title('Device 1: P-v Diagram with Vapor Dome (Schematic)');
grid on;
hold off;

%% Device 2: P-v Diagram for Air Cycle
figure;
hold on;
% Process 1 -> 2: Constant volume (vertical line)
v1 = 2; P1 = 500;      % State 1 (from energy balance solution)
v2 = 2; P2 = 100;      % State 2 (constant volume at 2 m^3, P = 100 kPa)
plot([v1 v2], [P1 P2], 'k--', 'LineWidth', 2);

% Process 2 -> 3: Isobaric expansion at 100 kPa (horizontal line)
v3 = 10; P3 = 100;     % State 3 (V = 10 m^3, P = 100 kPa)
plot([v2 v3], [P2 P3], 'b', 'LineWidth', 2);

% Process 3 -> 1: Isothermal compression. For an ideal gas, P*v = constant.
% Here, constant = P1*v1 = 500*2 = 1000 kPa·m^3.
v_iso = linspace(v3, v1, 100);
P_iso = (P1*v1)./v_iso;
plot(v_iso, P_iso, 'r', 'LineWidth', 2);

% Mark states
plot(v1, P1, 'ko','MarkerFaceColor','k','MarkerSize',8);
text(v1, P1, '  State 1','FontSize',12);
plot(v2, P2, 'ro','MarkerFaceColor','r','MarkerSize',8);
text(v2, P2, '  State 2','FontSize',12);
plot(v3, P3, 'mo','MarkerFaceColor','m','MarkerSize',8);
text(v3, P3, '  State 3','FontSize',12);

xlabel('Volume (m^3)');
ylabel('Pressure (kPa)');
title('Device 2: P-v Diagram for Air Cycle');
legend('Process 1-2 (Const. V)','Process 2-3 (Isobaric)','Process 3-1 (Isothermal)','Location','northeast');
grid on;
hold off;

%% Device 3: P-v Diagram for a Polytropic Process (P*V^2 = constant)
figure;
hold on;
% Given states
v1 = 0.1; P1 = 100;        % State 1
P2 = 800;                 % State 2 pressure
v2 = v1 * sqrt(P1/P2);      % Calculate V2 from P1*V1^2 = P2*V2^2

% Generate the polytropic process curve
v_poly = linspace(min(v1,v2), max(v1,v2), 100);
C = P1*v1^2;              % Constant in P*V^2 = C
P_poly = C./(v_poly.^2);
plot(v_poly, P_poly, 'g', 'LineWidth', 2);

% Mark states
plot(v1, P1, 'ko','MarkerFaceColor','k','MarkerSize',8);
text(v1, P1, '  State 1','FontSize',12);
plot(v2, P2, 'ro','MarkerFaceColor','r','MarkerSize',8);
text(v2, P2, '  State 2','FontSize',12);

xlabel('Volume (m^3)');
ylabel('Pressure (kPa)');
title('Device 3: P-v Diagram for Polytropic Process (P*V^2 = constant)');
legend('Polytropic Process','State 1','State 2','Location','northeast');
grid on;
hold off;
