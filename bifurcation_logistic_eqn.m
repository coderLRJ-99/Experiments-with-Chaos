clc;
clear;
close all;

% Parameters
r = 0.1:0.001:4; % Growth rate
iterations = 100000; % Number of iterations
last = 100; % Number of points to plot for each r

% Initialize bifurcation diagram
bifurcation = zeros(length(r), last);

% Iterate over all growth rates
for i = 1:length(r)
    x = 0.5; % Initial condition
    % Iterate the logistic map
    for j = 1:iterations
        x = r(i)*x*(1 - x);
        if j > (iterations - last)
            bifurcation(i, j - (iterations - last)) = x;
        end
    end
end

% Plot bifurcation diagram
figure;
plot(r, bifurcation,'.r');
xlabel('Growth rate (r)',fontsize=18,FontWeight='bold');
ylabel('Population (x)',fontsize=18,FontWeight='bold');
title('Bifurcation diagram of the logistic map',fontsize=18,FontWeight='bold');
