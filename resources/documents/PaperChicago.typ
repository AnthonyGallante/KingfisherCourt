#set page(paper: "us-letter", margin: (x: 1in, y: 1in))
#set text(font: "Times New Roman", size: 12pt)
#set heading(numbering: none)
#set cite(style: "chicago-author-date")
#show heading: set align(center)

// Title Page
#v(2in)
#align(center)[
  #text(size: 1.5em)[*Layup Laboratory*] \
  #text(size: 1em)[A Causal Inference and Network Science Approach to March Madness] \
  #v(1em)
  Anthony Gallante \
  MSDS-452-DL \
  Graphical, Network, and Causal Models \
  #datetime.today().display("[Month] [day], [year]")
]

#linebreak()

#set par(first-line-indent: 0.5in)
#set par(leading: 2em, spacing: 2em)

= Abstract

This project focuses on using Network Science and Causal Inference concepts included in the MSDS-452-DL curriculum for the purpose of creating a set of diversified, competetive March Madness brackets. The first goal of this effort is creating a model that measures the causal effect of in-game events in terms of their influence on the outcome on the game. Such a model can be used as the basis for Monte Carlo simulation to determine how often one team is likely to defeat another. In recognition that some online competitions allow the user to submit dozens of brackets, the second goal is developing a strategy for building the March Madness bracket itself. 

#pagebreak()

= Introduction

The NCAA Division Ⅰ basketball tournament, commonly referred to as March Madness, is a 63-game tournament that decides the national champion each year. As one of the most widely recognized sporting events in the United States, its arrival signals the annual tradition in which millions of fans submit their tournament predictions to casual competition pools, both in person and online. While technically consisting of 67 games, I will be excluding the play-in games from this discussion, since a majority of the popular March Madness competitions begin with the Round of 64. 

The high-stakes single elimination format creates a chaotic environment in which upsets, games in which a weaker team eliminates a stronger team, are commonplace. Failure to recognize these upsets in the early rounds of the tournament tend to invalidate entire branches of bracket predictions. In recognition of the astronomically low odds that any bracket prediction is perfectly correct, generous rewards are promised to those who take on the challenge: Warren Buffet, former CEO of Berkshire Hathaway, famously offered \$1 billion in 2014 @mitchell_2024_investopedia and the SpaceX aerospace company announced that the 2025 grand prize winner would receive a trip to Mars @xbusiness_2025_bracket.

While the author has no hopes of claiming such rewards, he has always been fascinated with the technical challenges that are present with event forecasting. Bracketology, the term coined specifically to describe forecasting for the NCAA basketball championship, requires the analyst to make predictions at the individual game level as well as the bracket level.

= Literature Review

With millions of users entering free March Madness competitions every year, the barrier for entry is low. It is a topic that both the casual sports fan and academic are willing to discuss. One may easily find herself stumbling upon interesting bracket prediction techniques from miscellaneous blogs. In one example, a blogger with the screen name _BioPhysEngr_ wrote about his experience of building a bracket based on the concept of eigenvector centrality, only to be beaten by his mother picking randomly @biophysengr_2012_eigenbracket.

Traversal of binary tree data structures, on the other hand, is a richly researched topic and I anticipate finding useful academic sources for the purpose of bracket optimization. 

While I continue to review the literature on both game level prediction and bracket optimization, I will briefly summarize several ideas that have caught my eye thus far.

== Entropy-Based Strategies for Multi-Bracket Pools @brill_2024_entropy

Brill et. al propose an entropy-based strategy when given the opportunity to submit multiple brackets to a competition. When allowed few brackets, optimal greedy strategies should be used, but contestants should choose more late-round upsets in order to _increase the amount of entropy in their brackets_ as more are permitted, essentially diversifying their submissions.

== Statistics Slam Dunk @sutton_2024_statistics

Uses causal inference frameworks to refute the idea of the "Hot Hand." Does not appear to delve deeply into either causal inference or network science.

== SMOGS: Social Network Metrics of Game Success @Bu2019 and Social Network Analysis of College and Professional Basketball @Xu2018

A network can be formed by modeling the players as nodes and the number of passes between each player as directed, weighted edges. 
Both Xu et al. and Bu et al. suggest that teams who pass the ball across the entire team have an advantage over teams that do not. The exception is in the Men's National Basketball Association (NBA), which rely on star players to serve as a distribution node, making a majority of the passes. The data sources currently being used (later discussed in @data_sources) do not have data to this resolution, making this resource difficult to use at the current moment. The dataset used by Bu et al. does not appear to available for all NCAA Division Ⅰ basketball teams, as SportsVu optical sensors are not installed in all facilities, despite being standard in theNBA. I am hopeful that player-to-player passing data is available at the college level.

= Methods 
// What research methods are you employing, and how are they informed by network science and probabilistic graphical models? What causal forecasting model and software are being used?

This project is divided into two distinct lines of effort: game level prediction with causal inference and bracket optimization with various network science techniques. 

== Game Level Prediction 

A causal model is used to understand how each event captured in game-level box scores affect the final scores of each team. @causal_model_dag below shows a preliminary model, which is based on the idea that team possessions lead to scoring opportunities. Here, I model the assumption that increasing events like rebounds and steals leads to more changes in possession. @preliminary_causal_effects shows the preliminary average treatment effect (ATE) for each of the variables shown in the diagram. Many games can be simulated with Monte Carlo methods by randomizing the players participating on each team and the number of possessions that each team gets in each game. 

Because our simulation is based on possession-level statistics, key variables in our causal model are those that influence team possessions and scoring opportunities. These include rebounds (ORB and DRB), blocks (BLK), steals (STL) and turnovers (TOV). Additionally, because none of these actually contribute directly to a team's score, their effects must be mediated through direct scoring attempts (2PA, 3PA, FTA). The refutation of the DAG below is currently in progress.

#figure(
  image("../visualizations/graphviz_graph.png", width: 60%),
  caption:[A preliminary DAG that can be used to estimate the point value for events that happen during a game of basketball.]
)<causal_model_dag>

Games are built around a randomly generated number of possessions and a weighted sample of players at the start of each match. Each team is given approximately the same number of possessions per game, though it varies according to each team's pace rating. Using per-possession player-level statistics, we estimate the number of events all players on the team are responsible for the decided number of possessions. This simple method will continue to be fine tuned over the course of this project, using past games as validation sets. In the mean time, it at least appears to showcase potential for teams with a considerable amount of data.

#figure(
  image("../visualizations/PreliminarySimulations.png", width:70%),
  caption:[An overlapping histogram showing preliminary simulation score distributions between the University of Connecticut and the University of Kansas (500 games).]
)<uconn_kansas>

A benefit of the causal inference framework used in this project is the ease of explainability for each simulation. For the game above in @uconn_kansas above is the ability to feed the simulated game logs into a large language model and ask for a short analysis. For the 500 simulations above, gpt-5-nano @chatgpt2024 returns the following analysis:

#set align(center)
#linebreak()
  _"Connecticut edges Kansas in the simulation, riding superior efficiency, balanced scoring, plus stronger rebounding and turnover discipline; Kansas pushes tempo but falters in efficiency and defensive consistency overall."_
#linebreak()
#set align(left)

While this annotation process has no influence on the outcome of a round of simulations, it at least provides a fun attempt at explaining why one team might have defeated another, which might be useful in upset-situations. While @uconn_kansas shows the outcome of 500 games, fewer simulated games would likely be desired in high-entropy brackets, where chance plays a higher role. Thus, one way to increase the randomness in a bracket is to reduce the number of simulalted games played between each team.

== Strength of Schedule
// TODO: 


== Bracket Optimization

The second line of effort in this project is optimizing the bracket performance itself. A greedy algorithm, always choosing the team with the higher chance of winning, is likely impractical when generating many brackets. Such a strategy might never account for certain upsets. One solution would be to create one greedy version of the bracket, and create a new graph wherever our game-level simulations are uncertain of the winner. This method will hopefully prevent us from creating too many brackets where 16 seeds beat 1 seeds, but will maximize diversity in close games.

Brill et al. provide a great starting point for this problem, though I am interested in learning about different approaches as well.

= Results 
// What data are being used for the analysis? What node types and links are relevant at this stage?

Two graph databases have been created for this project: one to visualize the relationships between players and teams that happened during the basketball season, and one to query pre-calculated simulations for all teams. There are 727 unique teams in the 2026 HoopR dataset, including many schools that, while not division Ⅰ themselves, play division Ⅰ teams during the regular season. 12,476 athletes are included in this dataset. It is worth noting that athletes can transfer schools and play for multiple teams over the course of the season.

In @memgraph_database below, we visualize each basketball team, the athletes that play on each team, and the outcome of all games played thus far. All edges are directed, and edges between two teams are directed and weighted according to the final difference in score.

#figure(
  image("../visualizations/memgraph_database_screenshot.png", width:120%),
  caption:[A sample of the 13,203 nodes and 16,487 relationships formed by teams and players that have participated in the NCAA basketball season.]
)<memgraph_database>

In @precomputed_graph below, we see the results of a simulated round-robin tournament of 64 teams, to be replaced with the actual teams taking place in the NCAA Basketball Tournament once announced. This graph is created in order to drastically reduce the computations needed to produce brackets; all simulations can be performed one time each ahead of time, and only queries of the outcome will need to be performed in any given bracket permutation. While more work needs to be done on the simulations, simulations in their current state seem to favor teams with a higher ELO rating @nolan_2026_elo, which at least indicate forward progress.

#figure(
  image("../visualizations/precomputed_simulations.png", width:100%),
  caption:[Simulated round-robin tournament with 64 NCAA basketball teams.]
)<precomputed_graph>

== Data Sources
// What information sources and datasets have been identified and collected, and what preliminary analyses have been completed?
See @data_sources for a description of data sources used thus far. This table will be updated as the project progresses.

#show table.cell.where(y: 0): set text(weight: "bold")

#figure(
  table(
    columns: 2,
    stroke: 0.75pt,
    table.header[Source][Description],
    [sports-reference.com @sports_reference_cbb ], [Team and Individual Player level data], 
    [warrennolan.com @nolan_2026_elo], [Team ELO ratings],
    [hoopr.sportsdataverse.org @gilani_2021_hoopR],[Play-by-play data, schedules, and box scores]
  ),
  caption: [Data Sources],
) <data_sources>

Data from the sources in the table above will be used to populate causal models and a memgraph database. It may be reasonable to pre-compute a large number of games between all possible combinations of teams and store those in a graph database prior to the bracket generation stage. Computing these outcomes beforehand will allow the bracket-building program to simply query results, rather than performing simulation calculations at runtime. 

= Conclusions
// Given these users and questions, what answers can you provide at this stage, and what do the preliminary results suggest? 

Preliminary average treatment effects (ATE) from the DAG shown in @causal_model_dag are shown in @preliminary_causal_effects. I hope to collect more data as the season progresses and calculate conditional average treatment effects (CATE) at the team or player level in order to account for differences in team and player behavior. At this point, I have no reason to believe that one team's block should have the same impact as another team's. Switching to a CATE approach will hopefully capture differences in team's offensive and defensive strategies. 

Because CATE is more computationally expensive than ATE, DAG validation will be done using ATE; however, the current structure of this project assumes a single common causal model.

#show figure: set block(breakable: true)
#figure(
  table(
    columns: 3,
    rows: (auto),
    align: (left, center, center),
    stroke: 0.75pt,
    table.header[Event][Team Score Effect][Opponent Score Effect],
    [2-Point Field Goal],          [ 1.998643 ], [ 0.0      ],
    [2-Point Attempt],             [ 1.217853 ], [ 0.0      ],
    [3-Point Field Goal],          [ 3.000105 ], [ 0.0      ],
    [3-Point Attempt],             [ 0.947277 ], [ 0.0      ],
    [Free Throw],                  [ 1.100958 ], [ 0.0      ],
    [Free Throw Attempt],          [ 0.850505 ], [ 0.0      ],
    [Steal],                       [ 1.046184 ], [-0.779294 ],
    [Block],                       [ 0.069190 ], [-0.560639 ],
    [Turnover],                    [-0.883766 ], [ 0.814006 ],
    [Personal Foul],               [ 0.0      ], [ 1.112083 ],
    [Offensive Rebound],           [ 0.182142 ], [ 0.0      ],
    [Defensive Rebound],           [ 0.851554 ], [-0.848281 ],
    [Allow 2-Point Field Goal],    [ 0.0      ], [ 2.002056 ],
    [Allow 2-Point Attempt],       [ 0.0      ], [ 0.982315 ],
    [Allow 3-Point Field Goal],    [ 0.0      ], [ 2.976299 ],
    [Allow 3-Point Attempt],       [ 0.0      ], [ 0.888978 ],
    [Allow Free Throw],            [ 0.0      ], [ 0.985768 ],
    [Allow Free Throw Attempt],    [ 0.0      ], [ 0.752256 ],
    [Allow Steal],                 [-0.901049 ], [ 0.875331 ],
    [Allow Block],                 [-0.708807 ], [ 0.069735 ],
    [Allow Turnover],              [ 0.976682 ], [-0.870936 ],
    [Allow Personal Foul],         [ 1.004520 ], [ 0.0      ],
    [Allow Offensive Rebound],     [ 0.0      ], [ 0.143493 ],
    [Allow Defensive Rebound],     [-1.090965 ], [ 0.688674 ],

  ),
  caption: [Preliminary Average Treatment Effects for Player-Level Events],
) <preliminary_causal_effects>

Results from this project can be visualized in a spreadsheet. 
See @spreadsheet_visualization for an example output, using randomly selected teams.

#figure(
  image("../Bracket_example_image.png", width:110%),
  caption:[An example output visualization spreadsheet.]
)<spreadsheet_visualization>

I am hopeful that the objectives defined above are attainable with the data available. If time permits, this effort can be validated with data from past tournaments. While I will be entering the brackets created by this project into the official March Madness competition (details yet to be released), my only requirement for success is that this approach is better than random.

#pagebreak()
#bibliography("references.bib", style: "chicago-notes")