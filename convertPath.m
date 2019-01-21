% takes a set of coordinates as input and outputs the path between them
function [m, c] = convertPath(coords)
    m = (coords(2,2)-coords(1,2))/(coords(2,1)-coords(1,1));
    c = coords(2,2) - m*coords(2,1);
end

