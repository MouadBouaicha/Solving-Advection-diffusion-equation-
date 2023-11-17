% Set up the spatial grid
xmin = -20;
ymin = -20;
xmax = 60;
ymax = 60;
n_x_points = 41;
n_y_points = 41;
x_grid = linspace(xmin, xmax, n_x_points);
y_grid = linspace(ymin, ymax, n_y_points);
[X, Y] = meshgrid(x_grid, y_grid);

% Set up the time grid
t_min = 0.1;
t_max = 25.0;
time_step = 0.1;
t_grid = t_min:time_step:t_max;
n_times = length(t_grid);



% Set the parameters
U = 10;  % x-velocity
V = 0;  % y-velocity
S = 1;  % source strength
x0 = 0;  % source x-position
y0 = 0;  % source y-position

% Calculate the concentration field
C = zeros(n_x_points, n_y_points, n_times);
for t_idx = 1:n_times
    t = t_grid(t_idx);
    C(:,:,t_idx) = S * exp(-((X - x0).^2 + (Y - y0).^2) / (2 * t));
end

% Animate the concentration field
figure;
h = pcolor(X, Y, C(:,:,1));
shading interp;
colorbar;
colormap jet;

for t_idx = 2:n_times
    set(h, 'CData', C(:,:,t_idx));
    drawnow;
    pause(0.1);
end