%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% all rights reserved
% Author: Dr. Ian Howard
% Associate Professor (Senior Lecturer) in Computational Neuroscience
% Centre for Robotics and Neural Systems
% Plymouth University
% A324 Portland Square
% PL4 8AA
% Plymouth, Devon, UK
% howardlab.com
% 22/09/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% run maze experiments
% you need to expand this script to run the assignment

close all
%clear all
clc

% YOU NEED TO DEFINE THESE VALUES
limits = [0 1; 0 1;];

% build the maze
maze = CMazeMaze10x10(limits);

% draw the maze
maze.DrawMaze();

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% YOU NEED TO DEFINE THESE VALUES
% init the q-table
minVal = 0.0;
maxVal = 0.0;
maze = maze.InitQTable(minVal, maxVal);

% test values
state = 1;
action = 1;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% this will be used by Q-learning as follows:
q = maze.QValues(state, action);   

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% YOU NEED TO FINISH OFF THIS FUNCTION
% get the reward from the action on the surrent state
% this will be used by Q-learning as follows:
reward = maze.RewardFunction(state, action);

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% YOU NEED TO FINISH OFF THIS FUNCTION
% build the transition matrix
maze = maze.BuildTransitionMatrix();
% print out values
maze.tm

% get the next state due to that action
% this will be used by Q-learning as follows:
resultingState = maze.tm(state, action);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% YOU NEED TO FINISH OFF THIS FUNCTION
% test random start
startingState = maze.RandomStatingState();
% print out value
startingState
