function plotSingleArmFromThetas(thetas)
armLengths = [0.7, 0.7];
arm1.theta = thetas(1);
arm2.theta = thetas(2);
arm1.origin = [1.2, 0.4]; % set according to gridworld
arm1.end = arm1.origin+armLengths.*[cos(arm1.theta),sin(arm1.theta)];
arm2.origin = arm1.end;
arm2.end = arm2.origin+armLengths.*[cos(arm2.theta),sin(arm2.theta)];
plotSingleArm(arm1.origin, arm2.origin,arm2.end);
plot(arm2.origin(1), arm2.origin(2), 'ro', 'LineWidth', 5); 
plot(arm1.origin(1), arm1.origin(2), 'go', 'LineWidth', 5);
axis equal;
end