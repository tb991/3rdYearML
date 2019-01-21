function out = rewardFunc(stateId, action)
    if ((stateId == 90 && action == 1) || (stateId==99 && action==2))
        out = 10;
    else 
        out = 0;
    end
end