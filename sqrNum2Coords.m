function [x,y] = sqrNum2Coords(sqrNum)
x = mod(sqrNum,10);
if (x==0)
    x = 10;
end
y = floor((sqrNum-1)/10) + 1;
x=x/10.0 - 0.05; % make it decimal (on graph lim [0 1 0 1]) and centre of square
y=y/10.0 - 0.05;
end

