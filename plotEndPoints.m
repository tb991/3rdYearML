function plotEndPoints()
[p1 p2] = RevoluteForwardKinematics2D(0.5*ones(2,1000), pi*rand(2,1000), zeros(2,1000));
plot(p2(1,:), p2(2,:), 'bx');
hold on;
plot(0,0,'r*');
legend('End points', 'Origin');
title('Robot Arm scope');
xlabel('Horizontal displacement /m');
ylabel('Vertical displacement /m');
end