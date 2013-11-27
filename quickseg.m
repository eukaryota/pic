function quickseg(path, newpath)
    % extract features for positive examples
    imlist = dir([path '*.jpg']);
    ratio = 0.5;
    kernelsize = 2;     
    for i = 1:length(imlist)
        im = imread([path imlist(i).name]);
        Iseg = vl_quickseg(im, ratio, kernelsize, 40);
        %filename = sprintf('%s/%s',newpath, imlist(i).name);
        imwrite(Iseg, [newpath imlist(i).name]);
    end
end
