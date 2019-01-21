% do the q learning and plot the route
q = initQ();
for i=1:1000
    q = findPathToEnd(q);
    disp(i);
end
disp(q);

%this assumes the maze is drawn
disp("route:");
mat = transitionMatrix();
arg = -1; loc = 1;
hold on;
plotPoint(loc); %
count = 1;
out(count) = loc;%%%
while(loc ~= 100)
    count = count + 1;
    disp(loc);
    [x, arg] = max(q(loc,:));
    [xPrev, yPrev] = sqrNum2Coords(loc); %
    loc = mat(loc, arg);
    out(count) = loc;%%%
    [xNow, yNow] = sqrNum2Coords(loc); %
    plotLine(xPrev, xNow, yPrev, yNow); %
    plotPoint(loc); %
end
plotPoint(loc); % 
disp(loc);
% convert the output squares to coordinates
for i=1:length(out)
    [outCoords(i,1), outCoords(i,2)] = sqrNum2Coords(out(i));
end
% now generate a large set of points between each point
for i=1:length(outCoords)
    pt = [outCoords(i,1), outCoords(i,2)]; % the coordinate of the centre of a square
    %now generate intermediates
    if i ~= length(outCoords)
        nextPt = [outCoords(i+1, 1), outCoords(i+1,2)];
        megaOut = linify([pt; nextPt]);
        if i==1
            theOut = megaOut;
        else
            theOut = [theOut; megaOut];
        end
    end
end