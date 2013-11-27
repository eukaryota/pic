%clear all;
vl_setup;

pathWinter = 'contest/train/winter/';       % path to winter examples
pathSummer = 'contest/train/summer/';       % path to summer examples
pathSpring = 'contest/train/spring/';       % path to spring examples
pathFall = 'contest/train/fall/';       % path to fall examples
pathTest = 'contest/test/';       % path to test examples

%% Quickseg
% quickseg(pathWinter, 'contest/train_seg/winter/');
% quickseg(pathSummer, 'contest/train_seg/summer/');
% quickseg(pathSpring, 'contest/train_seg/spring/');
% quickseg(pathFall, 'contest/train_seg/fall/');

%% Extract Hists features from train images
% winterHogs = extractHists(pathWinter); 
% fprintf('Winter\n');
% summerHogs = extractHists(pathSummer);
% fprintf('Summer\n');
% springHogs = extractHists(pathSpring);
% fprintf('Spring\n');
% fallHogs = extractHists(pathFall);
% fprintf('Fall\n');

%% Extract HOG features from train images
winterF = extractF(pathWinter); 
fprintf('Winter\n');
summerF = extractF(pathSummer);
fprintf('Summer\n');
springF = extractF(pathSpring);
fprintf('Spring\n');
fallF = extractF(pathFall);
fprintf('Fall\n');

%% Train SVM model
% you should implement SVM training here
winterCount = size(winterF, 2);
summerCount = size(summerF, 2);
springCount = size(springF, 2);
fallCount = size(fallF, 2);
y = zeros(1, winterCount + springCount + summerCount + fallCount);
y(winterCount+1:winterCount+springCount) = 1;
y(winterCount+springCount+1:winterCount+springCount+summerCount) = 2;
y(winterCount+springCount+summerCount+1:winterCount+springCount+summerCount+fallCount) = 3;
y = y';

X = [winterF springF summerF fallF];
X = X';

fprintf('Tree begin\n');
tree = ClassificationTree.fit(X, y);
fprintf('Tree end\n');

%% Predict
p = predict(tree, X);

fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);

test = extractHists(pathTest); 
fprintf('Test\n');
p2 = predict(tree, test');
p2 = [(1:size(test, 2))' p2];

csvwrite('contest/answer.csv',p2)

