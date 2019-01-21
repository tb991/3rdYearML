function out = transitionMatrix()

tm = 100*ones(100,4); 
for i = 1:99
    for j=1:4
        tm(i,j) = transitionFunction(i,j);
    end
end
out = tm;

end