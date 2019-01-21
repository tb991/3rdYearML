hold on;
axis equal;
for i=1:length(theOut)
nn.layer1.inputs = theOut(i,:)';
nn.layer1.activation = nn.layer1.weights*nn.layer1.inputs;
nn.layer1.activation = nn.layer1.activation + nn.layer1.biases;
nn.layer1.sigmoidOut = 1./(1+exp(-nn.layer1.activation));
nn.layer2.inputs = nn.layer1.sigmoidOut;
nn.layer2.activation = (nn.layer2.weights'*nn.layer2.inputs);
armAngles(i,:) = nn.layer2.activation;
end
for i=1:length(theOut)
    angles = armAngles(i,:);
    plotSingleArmFromThetas([angles(1),angles(1) + angles(2)]);
    pause(0.01);
    ax = gca;    %or you might have stored it earlier (Hint!)
    delete( findobj(ax, 'type', 'line') )
    xlim([0, 2]);
    ylim([0, 2]);
end