# 🏀 LayupLaboratory

Welcome to **LayupLaboratory**! This repository contains a suite of Python scripts and Jupyter Notebooks designed for college basketball data scraping, statistical analysis, and tournament bracket simulation. By leveraging data modeling, simulations, and GPT-powered analysis, this project aims to predict tournament outcomes and generate optimized brackets.

## 🗂 Project Structure

The project is organized into modular scripts and exploratory notebooks:

### Data Gathering & Database
* **`web_scraper.ipynb`**: Scrapes the latest college basketball data, team stats, and match results from the web.
* **`db_builder.ipynb`**: Processes the scraped data and constructs a structured database for easy querying and analysis.

### Core Models & Logic
* **`entities.py`**: Defines the core Python classes and data structures (e.g., Teams, Games, Regions) used throughout the project.
* **`constants.py`**: Houses configuration variables, API keys (if applicable), and static parameters used across modules.
* **`tournament_roster.py`**: Manages the list of teams that have made the tournament, seeding, and regional placements.

### Simulation & Analysis
* **`bracket_builder.ipynb`**: An interactive notebook used to construct, visualize, and map out the tournament bracket.
* **`simulations.py`**: Contains the logic and probabilistic models used to simulate matchups between teams and predict game outcomes.
* **`gpt_analysis.py`**: Integrates OpenAI's GPT models to provide advanced analytics, qualitative insights, or narrative summaries of team matchups.
* **`Discovery.ipynb` / `test.ipynb`**: Scratchpad notebooks for exploratory data analysis (EDA), testing new algorithms, and visualizing trends.
* **`causal_model.png`**: A visual representation of the causal inference model used to weigh different statistical factors (e.g., offensive efficiency, strength of schedule) on win probability.


*If you are using `gpt_analysis.py`, you will need an active OpenAI API key.* 


# Brackets:
 - Bracket 1: https://fantasy.espn.com/tc/sharer?challengeId=277&from=espn&context=FINAL_FOUR&entryId=7f2b17d0-1e7a-11f1-a9b7-91d2aa9791a9&game=tc&rcIds=1.1,2.7,3.1,4.1,1.1,3.1,3.1&teamIds=150,2608,12,130,150,12,12
 - Bracket 2: https://fantasy.espn.com/tc/sharer?challengeId=277&from=espn&context=FINAL_FOUR&entryId=36f33a00-20e7-11f1-9e34-991f2faac692&game=tc&rcIds=1.1,2.3,3.1,4.5,1.1,3.1,1.1&teamIds=150,356,12,2641,150,12,150
 - Bracket 3: https://fantasy.espn.com/tc/sharer?challengeId=277&from=espn&context=FINAL_FOUR&entryId=03840040-20e8-11f1-bf32-8794a055fbb5&game=tc&rcIds=1.1,2.1,3.1,4.5,2.1,3.1,3.1&teamIds=150,57,12,2641,57,12,12
 - Bracket 4: https://fantasy.espn.com/tc/sharer?challengeId=277&from=espn&context=FINAL_FOUR&entryId=e9ad8280-20e8-11f1-8b19-c75e24aaf1c4&game=tc&rcIds=1.2,2.1,3.1,4.2,2.1,4.2,2.1&teamIds=41,57,12,66,57,66,57
 - Bracket 5: https://fantasy.espn.com/tc/sharer?challengeId=277&from=espn&context=FINAL_FOUR&entryId=590fea00-20e9-11f1-95cc-f1e43126b60f&game=tc&rcIds=1.1,2.1,3.1,4.5,1.1,3.1,3.1&teamIds=150,57,12,2641,150,12,12
 - Bracket 6: https://fantasy.espn.com/tc/sharer?challengeId=277&from=espn&context=FINAL_FOUR&entryId=c9963810-20e9-11f1-a9b7-91d2aa9791a9&game=tc&rcIds=1.2,2.1,3.1,4.5,2.1,3.1,3.1&teamIds=41,57,12,2641,57,12,12
 - Bracket 7: https://fantasy.espn.com/tc/sharer?challengeId=277&from=espn&context=FINAL_FOUR&entryId=5bb37640-20ea-11f1-bf32-8794a055fbb5&game=tc&rcIds=1.2,2.1,3.3,4.2,2.1,3.3,2.1&teamIds=41,57,2250,66,57,2250,57
 - Bracket 8: https://fantasy.espn.com/tc/sharer?challengeId=277&from=espn&context=FINAL_FOUR&entryId=c35e0170-20ea-11f1-95cc-f1e43126b60f&game=tc&rcIds=1.1,2.1,3.1,4.5,1.1,3.1,1.1&teamIds=150,57,12,2641,150,12,150
 - Bracket 9: https://fantasy.espn.com/tc/sharer?challengeId=277&from=espn&context=FINAL_FOUR&entryId=4b1a8a70-20eb-11f1-ae27-ad8441122907&game=tc&rcIds=1.1,2.1,3.1,4.5,2.1,3.1,3.1&teamIds=150,57,12,2641,57,12,12
 - Bracket 10: https://fantasy.espn.com/tc/sharer?challengeId=277&from=espn&context=FINAL_FOUR&entryId=bec32720-20eb-11f1-ae27-ad8441122907&game=tc&rcIds=1.3,2.1,3.3,4.5,2.1,4.5,2.1&teamIds=127,57,2250,2641,57,2641,57
 - Bracket 11: https://fantasy.espn.com/tc/sharer?challengeId=277&from=espn&context=FINAL_FOUR&entryId=443216a0-20ec-11f1-9819-a38692af12ac&game=tc&rcIds=1.1,2.1,3.1,4.4,2.1,3.1,2.1&teamIds=150,57,12,333,57,12,57
 - Bracket 12: https://fantasy.espn.com/tc/sharer?challengeId=277&from=espn&context=FINAL_FOUR&entryId=6e9108a0-20ee-11f1-bf74-b3a3c481c9dd&game=tc&rcIds=1.3,2.1,3.1,4.5,2.1,3.1,3.1&teamIds=127,57,12,2641,57,12,12
 - Bracket 13: https://fantasy.espn.com/tc/sharer?challengeId=277&from=espn&context=FINAL_FOUR&entryId=d106b8e0-20ee-11f1-8c06-2576181018d8&game=tc&rcIds=1.2,2.7,3.1,4.5,2.7,4.5,2.7&teamIds=41,2608,12,2641,2608,2641,2608
 - Bracket 14: https://fantasy.espn.com/tc/sharer?challengeId=277&from=espn&context=FINAL_FOUR&entryId=405c9d40-20ef-11f1-b55e-3315635bfaed&game=tc&rcIds=1.2,2.1,3.3,4.1,2.1,4.1,2.1&teamIds=41,57,2250,130,57,130,57
 - Bracket 15: https://fantasy.espn.com/tc/sharer?challengeId=277&from=espn&context=FINAL_FOUR&entryId=adf58f60-20ef-11f1-9e34-991f2faac692&game=tc&rcIds=1.1,2.1,3.3,4.5,1.1,4.5,4.5&teamIds=150,57,2250,2641,150,2641,2641
 - Bracket 16: https://fantasy.espn.com/tc/sharer?challengeId=277&from=espn&context=FINAL_FOUR&entryId=0bb88d00-20f0-11f1-8c06-2576181018d8&game=tc&rcIds=1.1,2.1,3.2,4.1,2.1,4.1,2.1&teamIds=150,57,2509,130,57,130,57
 - Bracket 17: https://fantasy.espn.com/tc/sharer?challengeId=277&from=espn&context=FINAL_FOUR&entryId=292b6d40-2261-11f1-b1fc-7f66c33ee0aa&game=tc&rcIds=1.1,2.1,3.1,4.5,2.1,3.1,2.1&teamIds=150,57,12,2641,57,12,57
 - Bracket 18: https://fantasy.espn.com/tc/sharer?challengeId=277&from=espn&context=FINAL_FOUR&entryId=b576a620-2261-11f1-b1fc-7f66c33ee0aa&game=tc&rcIds=1.2,2.1,3.1,4.1,2.1,4.1,2.1&teamIds=41,57,12,130,57,130,57
 - Bracket 19: https://fantasy.espn.com/tc/sharer?challengeId=277&from=espn&context=FINAL_FOUR&entryId=7a2fac00-2262-11f1-9806-db4fdc00baff&game=tc&rcIds=1.1,2.1,3.3,4.2,2.1,3.3,3.3&teamIds=150,57,2250,66,57,2250,2250
 - Bracket 20: https://fantasy.espn.com/tc/sharer?challengeId=277&from=espn&context=FINAL_FOUR&entryId=f3753440-2262-11f1-8c06-2576181018d8&game=tc&rcIds=1.4,2.1,3.8,4.1,1.4,4.1,4.1&teamIds=2305,57,222,130,2305,130,130
 - Bracket 21: https://fantasy.espn.com/tc/sharer?challengeId=277&from=espn&context=FINAL_FOUR&entryId=7922b360-2263-11f1-9819-a38692af12ac&game=tc&rcIds=1.1,2.1,3.1,4.5,2.1,3.1,3.1&teamIds=150,57,12,2641,57,12,12
 - Bracket 22: https://fantasy.espn.com/tc/sharer?challengeId=277&from=espn&context=FINAL_FOUR&entryId=d90869f0-2263-11f1-9e34-991f2faac692&game=tc&rcIds=1.1,2.3,3.3,4.5,2.3,4.5,4.5&teamIds=150,356,2250,2641,356,2641,2641
 - Bracket 23: https://fantasy.espn.com/tc/sharer?challengeId=277&from=espn&context=FINAL_FOUR&entryId=4522ab50-2264-11f1-a9b7-91d2aa9791a9&game=tc&rcIds=1.1,2.1,3.1,4.2,2.1,3.1,3.1&teamIds=150,57,12,66,57,12,12
 - Bracket 24: https://fantasy.espn.com/tc/sharer?challengeId=277&from=espn&context=FINAL_FOUR&entryId=d3d74310-2264-11f1-9819-a38692af12ac&game=tc&rcIds=1.3,2.1,3.1,4.5,2.1,3.1,3.1&teamIds=127,57,12,2641,57,12,12
 - Bracket 25: https://fantasy.espn.com/tc/sharer?challengeId=277&from=espn&context=FINAL_FOUR&entryId=00726540-226e-11f1-bf32-8794a055fbb5&game=tc&rcIds=1.1,2.1,3.1,4.4,2.1,3.1,3.1&teamIds=150,57,12,333,57,12,12

### 🛠 Usage
To run the pipeline from end-to-end, follow this general workflow:

Scrape the Data: Open and run web_scraper.ipynb to pull the latest stats.

Build the Database: Run db_builder.ipynb to clean and store the data.

Run Exploratory Analysis: Check out Discovery.ipynb to view current trends.

Simulate the Tournament: Execute simulations.py or step through bracket_builder.ipynb to generate your predicted brackets.

### 📝 License
This project is open-source and available under the MIT License.

