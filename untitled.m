figure;
hold on;
quiver(0, 0, cosd(40), -sind(40), 'g', 'LineWidth', 2); % Centripetal acceleration (ac)
quiver(0, 0, sind(40), cosd(40), 'r', 'LineWidth', 2); % Normal acceleration (an)
quiver(0, 0, 0, -1, 'b', 'LineWidth', 2); % Gravity (g)
text(cosd(40), -sind(40), 'ac', 'Color', 'g', 'FontSize', 12);
text(sind(40), cosd(40), 'an', 'Color', 'r', 'FontSize', 12);
text(0, -1.1, 'g', 'Color', 'b', 'FontSize', 12);
title('Acceleration Diagram of Banked Turn');
axis equal;
grid on;
