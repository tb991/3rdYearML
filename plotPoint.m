function out = plotPoint(loc)
%UNTITLED assumes the maze is drawn
%   plots x on the centre of the square given by loc
hold on;
[x y] = sqrNum2Coords(loc);
out = plot(x,y,'cx','MarkerSize', 20, 'LineWidth', 5);
end

