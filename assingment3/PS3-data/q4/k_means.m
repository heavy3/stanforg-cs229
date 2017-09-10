function [clusters, centroids] = k_means(X, k)

%%% YOUR CODE HERE
[m, n] = size(X);

% init random k centroids (get k random samples as centroids)
centroids = X(ceil(rand(k,1) * m), :);
old_centroids = zeros(k, n);

while norm(centroids - old_centroids) > 1e-5

    old_centroids = centroids;

    % labelling each sample
    disp('labelling');
    for i=1:m
        % calculate distance form X(i) to each centroids
        dists = sum((repmat(X(i,:), k, 1) - centroids).^2, 2);
        [min_dist, index] = min(dists);
        clusters(i, 1) = index;
    end

    draw_clusters(X, clusters, centroids);
    pause(1);

    % update centroids
    disp('update centroids');
    for j=1:k
        centroids(j,:) = mean(X(clusters == j,:));
    end
end