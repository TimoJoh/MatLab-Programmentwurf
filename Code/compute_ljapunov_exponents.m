%Ljapunov Exponenten

K_vals = linspace(0, 4, 200);
N = 5000;
lambda1 = zeros(size(K_vals));
lambda2 = zeros(size(K_vals));

for idx = 1:length(K_vals)
    K = K_vals(idx);
    I = rand()*2*pi;
    theta = rand()*2*pi;
    Q = eye(2);

    sumLogR11 = 0;
    sumLogR22 = 0;

    for n = 1:N
        % Ableitungsmatrix DF
        DF = [1, K*cos(theta); 1, 1 + K*cos(theta)];
        A = DF * Q;
        [Q, R] = qr(A);
        sumLogR11 = sumLogR11 + log(abs(R(1,1)));
        sumLogR22 = sumLogR22 + log(abs(R(2,2)));

        I = mod(I + K*sin(theta), 2*pi);
        theta = mod(theta + I, 2*pi);
    end
    
    lambda1(idx) = sumLogR11 / N;
    lambda2(idx) = sumLogR22 / N;
end

figure;
plot(K_vals, lambda1, '-r', K_vals, lambda2, '-b');
xlabel('K');
ylabel('Ljapunov-Exponenten');
legend('\lambda_1', '\lambda_2', 'Location','northwest');
title('Ljapunov-Exponenten in Abhängigkeit von K');
grid on;

