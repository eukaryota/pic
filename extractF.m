function FParam = extractF(path)
    % extract features for positive examples
    imlist = dir([path '*.jpg']);
    FParam = []; % this is a matrix and each its column is a HOG of one train window
    for i = 1:length(imlist)
        im = imread([path imlist(i).name]);
        [Features, ~] = features(im, 16);
        %%imshow(im);
        %%figure, imshow(imseg);
        %hog = vl_hog(single(im), 8, 'verbose', 'variant', 'dalaltriggs', 'NumOrientations', 18);
        FParam = [FParam Features(:)];
    end
end
