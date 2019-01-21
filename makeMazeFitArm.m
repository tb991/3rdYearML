hold on;
Main_RunGridworld; % block 
origin = [1.2*ones(1000,1), 0.4*ones(1000,1)];
armLengths = 0.7*ones(1000,2)';
in = pi*rand(1000,2)';
[p1 p2] = RevoluteForwardKinematics2D(armLengths, in, origin');
% plot(p2(1,:), p2(2,:),'rx'); % this fits the maze nicely
main; % block
untitled2; %block
% now get outputs from the neural net with each input
for i=1:length(outCoords)
nn.layer1.inputs = outCoords(i,:)';
nn.layer1.activation = nn.layer1.weights*nn.layer1.inputs;
nn.layer1.activation = nn.layer1.activation + nn.layer1.biases;
nn.layer1.sigmoidOut = 1./(1+exp(-nn.layer1.activation));
nn.layer2.inputs = nn.layer1.sigmoidOut;
nn.layer2.activation = (nn.layer2.weights'*nn.layer2.inputs);
armAngles(i,:) = nn.layer2.activation;
end
for i=1:length(outCoords)
    angles = armAngles(i,:);
    plotSingleArmFromThetas([angles(1),angles(1) + angles(2)]);
end