function y = lwlr(X_train, y_train, x, tau)

%%% YOUR CODE HERE
% dimension
[m, n] = size(X_train);

% weighted will not change during training
%X = repmat(x', m, 1);
%w = exp(-(X - X_train)' * (X - X_train) / 2 * (tau ** 2))
w = exp(-sum((X_train - repmat(x', m, 1)).^2, 2) / (2*tau));

% gramma for this problem
gramma = 1e-4;

% initial theta
theta = zeros(n, 1);
gradient = ones(n, 1);

% Newton method
while norm(gradient) > 1e-6
	h0 = sigmoid(X_train*theta);
	z = w .* (y_train - h0);
	gradient = X_train'*z - gramma*theta;
	H = X_train'*diag(-w.*h0.*(1-h0))*X_train - gramma * eye(n);
	theta = theta - H \ gradient;
end

%y = sigmoid(theta'*x) > 0.5
y = double(x'*theta > 0);
