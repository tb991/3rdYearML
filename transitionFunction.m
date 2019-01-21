function endState = transitionFunction(theState, action)
	blockedStates = [5, 9, 12, 13, 23, 24, 26, 29, 31, 34, 39, 45, 47, 49, ... 
        53, 55, 57, 59, 62, 63, 67, 69, 73, 76, 77, 79, 63, 87, 97];
    moveAllowed = 1;
    if (action==1)
        % it's a move up
        blockedSqr = (intersect(blockedStates, theState+10) == (theState+10));
        if (theState+10 > 100 || ~isempty(blockedSqr))
            moveAllowed = 0;
        else
            endState = theState + 10;
        end
    elseif(action==2)
        % it's a move right
        blockedSqr = (intersect(blockedStates, theState+1) == (theState+1));
        if (mod(theState,10)==0 || ~isempty(blockedSqr))
            moveAllowed = 0;
        else
            endState = theState + 1;
        end
    elseif(action==3)
        % it's a move down
        blockedSqr = (intersect(blockedStates, theState-10) == (theState-10));
        if ((theState-10 < 1) || ~isempty(blockedSqr))
            moveAllowed = 0;
        else
            endState = theState - 10;
        end
    elseif(action==4)
        % it's a move left
        blockedSqr =  (intersect(blockedStates, theState-1) == (theState-1));
        if (mod(theState-1,10) == 0 || ~isempty(blockedSqr))
            moveAllowed = 0;
        else
            endState = theState - 1;
        end
    end
    if (~isempty(intersect(blockedStates,theState)) || theState==100)
        % then it started in a blocked state
        moveAllowed = 0;
    end
    if (~moveAllowed)
        sprintf('theState %d with action %d was blocked', theState, action);
        endState = theState;
    end
end