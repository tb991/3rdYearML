function plotArms()

    [p1 p2] = RevoluteForwardKinematics2D(0.5*ones(2,10), pi*rand(2,10), zeros(2,10));
    plot(p1(1,:), p1(2,:),'go');
    hold on;
    line([zeros(1,10); p1(1,:)],[zeros(1,10); p1(2,:)],'LineWidth', 3,'Color', 'b');
    line([p1(1,:);p2(1,:)],[p1(2,:);p2(2,:)],'LineWidth', 3,'Color', 'b' );

    plot(p2(1,:), p2(2,:),'ro');
    xlabel('x[m]');
    ylabel('y[m]');
    title('Arm configurations');

end