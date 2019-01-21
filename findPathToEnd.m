function q = findPathToEnd(qtable)

    location = getRandomUnblockedState();
    moves = transitionMatrix();
    count = 1;
    path(count) = location;
    while location ~= 100
        count = count + 1;
        [value, move] = max(qtable(location,:));
        if (rand < 0.1)
            move = ceil(rand*4);
        end
        rew = rewardFunc(location,move);
        nextState = moves(location,move);
        [valueNext, ~] = max(qtable(nextState,:));
        qtable(location, move) = qtable(location,move) + 0.2*(rew + 0.9*valueNext - qtable(location,move));
        location = nextState;
        %path(count) = location;
    end
    q = qtable;

end