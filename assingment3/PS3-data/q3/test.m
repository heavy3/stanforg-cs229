[X, y, theta_true] = load_data();

lambdas = [0.001, 0.01, 0.1, 1, 10];
results(:, 1) = theta_true;
for i =  1:length(lambdas)
    results(:, i+1) = l1ls(X, y, lambdas(i));
end

results