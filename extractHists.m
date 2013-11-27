function histParam = extractHists(path)
    % extract features for positive examples
    imlist = dir([path '*.jpg']);
    histParam = zeros(256, length(imlist)); % this is a matrix and each its column is a HOG of one train window
    for i = 1:length(imlist)
        im = imread([path imlist(i).name]);
        im = rgb2gray(im);
        %im = im((size(im, 1)/2):end, :);
        imgHist = zeros(256,1);
        for j=1:256
            imgHist(j)= sum(sum(im == (j - 1)));
        end;
        histParam(:, i) = imgHist;
    end
end
