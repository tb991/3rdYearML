function [P1 P2] = RevoluteForwardKinematics2D(armLen, theta, origin)
%calculate relative forward kinematics
% all parameters should be equal dimensions (eg 2x1000)
    x1 = origin(1,:) + armLen(1,:).*cos(theta(1,:));
    x2 = x1 + armLen(2,:).*cos(sum(theta));
    y1 = origin(2,:) + armLen(1,:).*sin(theta(1,:));
    y2 = y1 + armLen(2,:).*sin(sum(theta));
    P1 = zeros(size(theta));
    P2 = zeros(size(theta));
    P1(1,:) = x1;
    P1(2,:) = y1; % p1 is the x, y of the elbow-joint
    P2(1,:) = x2;
    P2(2,:) = y2;
end

