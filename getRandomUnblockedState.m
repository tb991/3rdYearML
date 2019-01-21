function state = getRandomUnblockedState()
    blocked = [5 9 12 13 23 24 26 29 31 34 39 45 47 49 53 55 57 59 62 63 67 69 73 76 77 79 83 87 97];
    randState = 5; % satisfy the while condition initially
    while ((intersect(blocked, randState) == randState) == 1)
    randState = ceil(rand*100);
        if (randState==100)
            continue;
        end
    end
    state = randState;
end

