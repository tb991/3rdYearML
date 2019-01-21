sampleSize = 10000000;
features = 2;
%in = pi*rand(features,sampleSize);
%[p1, p2] = RevoluteForwardKinematics2D(0.5*ones(features,sampleSize), in, zeros(features,sampleSize));
%% to work with retrofitted maze
origin = [1.2*ones(sampleSize,1), 0.4*ones(sampleSize,1)];
armLengths = 0.7*ones(sampleSize,2)';
in = pi*rand(sampleSize,2)';
[p1, p2] = RevoluteForwardKinematics2D(armLengths, in, origin');
%%
% plot(p2(1,:), p2(2,:),'rx')
nn.layer1.numNodes = 10;
nn.layer1.weights = randn(nn.layer1.numNodes, features);
nn.layer1.biases = randn(nn.layer1.numNodes,1);
nn.layer2.weights = randn(nn.layer1.numNodes, features);
learningRate = 0.01;
for i=1:sampleSize
    disp(100*(i/sampleSize));
    nn.layer1.inputs = p2(:,i);
    nn.targetOut = in(:,i); % swap in and p2 for actual
    nn.layer1.activation = nn.layer1.weights*nn.layer1.inputs;
    nn.layer1.activation = nn.layer1.activation + nn.layer1.biases;
    
    nn.layer1.sigmoidOut = 1./(1+exp(-nn.layer1.activation));
    nn.layer2.inputs = nn.layer1.sigmoidOut;
    nn.layer2.activation = (nn.layer2.weights'*nn.layer2.inputs);
    
    nn.delta3 = -(nn.targetOut - nn.layer2.activation);
    nn.delta2 = (nn.layer2.weights*nn.delta3).*nn.layer1.sigmoidOut.*(1 - nn.layer1.sigmoidOut);

    %error = sum([nn.targetOut-nn.layer2.activation].*[nn.targetOut-nn.layer2.activation]);
    %disp(error);
    % get the error gradients
    nn.w1ErrorGrad = nn.delta2*nn.layer1.inputs';
    nn.w2ErrorGrad = nn.delta3*nn.layer2.inputs';

    % adjust weights slightly
    nn.layer1.weights = nn.layer1.weights - learningRate*nn.w1ErrorGrad;
    nn.layer2.weights = nn.layer2.weights - learningRate*nn.w2ErrorGrad';
end
% test the network with fresh inputs
%plot(error);
hold on;
axis equal;
numPoints = 20;
in = pi*rand(features,numPoints);
%[p1, p2] = RevoluteForwardKinematics2D(0.5*ones(features,numPoints), in, zeros(features,numPoints));
origin = [1.2*ones(numPoints,1), 0.4*ones(numPoints,1)];
armLengths = 0.7*ones(numPoints,2)';
in = pi*rand(numPoints,2)';
[p1 p2] = RevoluteForwardKinematics2D(armLengths, in, origin');
for i=1:numPoints
%disp(i);
nn.layer1.inputs = p2(:,i);
nn.layer1.activation = nn.layer1.weights*nn.layer1.inputs;
nn.layer1.activation = nn.layer1.activation + nn.layer1.biases;

nn.layer1.sigmoidOut = 1./(1+exp(-nn.layer1.activation));
nn.layer2.inputs = nn.layer1.sigmoidOut;
nn.layer2.activation = (nn.layer2.weights'*nn.layer2.inputs);
out = nn.layer2.activation';
%plot(out(1),out(2),'rx');
endPoint = p2(:,i);
plot(endPoint(1), endPoint(2),'rx');
% disp(out);
%pause;
%pause;

plotSingleArmFromThetas([out(1), out(1) + out(2)]);
%pause;
end