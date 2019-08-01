Policy 2 - Social Network Recommendation  
 In this case, each agent has a set of n “friends” located all over the system. The locations of the friends are chosen randomly with equal probability for each agent, i.e., a random set of n friends is chosen for each agent. When the agent wants to move, it informs its friends. Each friend looks at all cells in a pp square neighborhood around itself, and informs its friend of all the suitable positions it found. Thus, the agent that wants to move gets a number of possible options, chooses one of them randomly, and moves there.  If none of its friends can find anything, the agent moves randomly, as in Policy 1.  Note that not all of an agent’s friends need to be from its own type, but the recommendations from all of them must be based on the type of the moving agent, not the type of the recommender.  This policy has two parameters, n and p. Obviously, p should be chosen as odd to keep the search neighborhoods symmetric.