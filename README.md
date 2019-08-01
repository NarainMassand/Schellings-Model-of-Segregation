# Schellings-Model-of-Segregation
Simulation of Schelling's model of Segregation and its variants - Complex Systems
The setup for this project includes an array of 0’s, 1’s and 2’s where 1’s and 2’s are blue and red agents while 0’s are empty spaces. The distribution is 700 agents of each type and 200 spaces on a grid of 40x40 units. An agent moves from his previous location to an empty location making the previous space empty.  The policy is such that an agent’s wants to stay happy and can be happy when he has at least a minimum number of agents which are alike in its neighborhood.  <br/>

Initialplot.m - Plots the initial state with random placements <br/>

happiness.m - Checks for the happiness of each agent <br/>

plottingfinal.m - Plots the final segregated state <br/>
