function theta = l1l2(X,y,lambda)

%%% YOUR CODE HERE
[m, n] = size(X);
theta = zeros(n, 1);
old_theta = ones(n, 1);

while norm(theta - old_theta) > 1e-5

    % last theta
    old_theta = theta;

    % for each theta_i
    for i = 1:n
        % ith column of X
        X_i = X(:, i);

        % θ ̄
        theta(i) = 0;
        % s_i = 1
        theta_i(1) = max(0, -(X_i'*(X*theta - y) + lambda) / (X_i'*X_i));
        % s_i = -1
        theta_i(2) = min(0, -(X_i'*(X*theta - y) - lambda) / (X_i'*X_i));

        % loss function
        theta(i) = theta_i(1);
        J_1 = 0.5 * (X*theta - y)'*(X*theta - y) + lambda*norm(theta);
        theta(i) = theta_i(2);
        J_2 = 0.5 * norm(X*theta - y)^2 + lambda*norm(theta);

        % let's see who minize the loss function most
        [min_J, pos] = min([J_1, J_2]);
        theta(i) = theta_i(pos);
    end
end
