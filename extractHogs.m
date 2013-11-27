function hogParam = extractHogs(path)
    % extract features for positive examples
    imlist = dir([path '*.jpg']);
    hogParam = []; % this is a matrix and each its column is a HOG of one train window
    for i = 1:length(imlist)
        im = imread([path imlist(i).name]);
        hog = vl_hog(single(im), 8, 'verbose', 'variant', 'dalaltriggs', 'NumOrientations', 18);
        hogParam = [hogParam hog(:)];
    end
end
