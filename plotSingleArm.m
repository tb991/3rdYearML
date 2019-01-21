function plotSingleArm(origin, elbow, endpoint)
plotLine(origin(1), elbow(1), origin(2), elbow(2));
plotLine(elbow(1), endpoint(1), elbow(2), endpoint(2));
end