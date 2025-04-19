% Phasenportraits
K_values = [rand()*0.6, 0.9 + rand()*0.2, 1.4 + rand()*0.6]; % Parameter fuer die drei K-Werte
N = 1000; % Laenge der Trajektorien
M = 50;   % Anzahl der Trajektorien



figure;
for idx = 1:3
    K = K_values(idx);
    subplot(1,3,idx);
    hold on;
    for m = 1:M
        I = rand()*2*pi;
        theta = rand()*2*pi;
        I_traj = zeros(1,N);
        theta_traj = zeros(1,N);
        for n = 1:N
            I = mod(I + K*sin(theta), 2*pi);
            theta = mod(theta + I, 2*pi);
            I_traj(n) = I;
            theta_traj(n) = theta;
        end
        plot(theta_traj, I_traj, '.', 'MarkerSize', 1);
    end
    title(['K = ', num2str(K, '%.3f')]);
    xlabel('\theta');
    ylabel('I');
    axis([0 2*pi 0 2*pi]);
    axis square;
end

