%Ljapunov Exponenten

K_vals = linspace(0, 4, 200);
N = 1000;
lambda1 = zeros(size(K_vals));
lambda2 = zeros(size(K_vals));

for idx = 1:length(K_vals)
    K = K_vals(idx);
    I = rand()*2*pi;
    theta = rand()*2*pi;
    Q = eye(2);
    sum_log_diag = zeros(1,2);

    for n = 1:N
        I = mod(I + K*sin(theta), 2*pi);
        theta = mod(theta + I, 2*pi);
        % Ableitungsmatrix DF
        DF = [1, K*cos(theta); 1, 1 + K*cos(theta)];
        A = DF * Q;
        [Q, R] = qr(A);
        sum_log_diag = sum_log_diag + log(abs(diag(R))');
    end

    lambda1(idx) = sum_log_diag(1)/N;
    lambda2(idx) = sum_log_diag(2)/N;
end

figure;
plot(K_vals, lambda1, 'r', K_vals, lambda2, 'b');
xlabel('K');
ylabel('Ljapunov-Exponenten');
legend('\lambda_1', '\lambda_2');
title('Ljapunov-Exponenten in Abhängigkeit von K');
grid on;

