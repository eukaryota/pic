function [ Features, Iclustered ] = features(I, top)

% Make it small.
Ismall = imresize(I, 0.3);

% Find clusters.
Iclustered = vl_quickseg(Ismall, 0.2, 5, 30);

% We need an array of hues only.
Iarray = rgb2hsv(Iclustered);
Iarray = Iarray(:, :, 1);
Iarray = Iarray(:);

% Tabulate it and find the top.
T = tabulate(Iarray);
[~, ind] = sort(T(:, 2), 'descend');
T = T(ind, 1);
T = T(1:top);

% My featuressss.
Features = T;

end
