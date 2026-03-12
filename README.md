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

### 🛠 Usage
To run the pipeline from end-to-end, follow this general workflow:

Scrape the Data: Open and run web_scraper.ipynb to pull the latest stats.

Build the Database: Run db_builder.ipynb to clean and store the data.

Run Exploratory Analysis: Check out Discovery.ipynb to view current trends.

Simulate the Tournament: Execute simulations.py or step through bracket_builder.ipynb to generate your predicted brackets.

### 📝 License
This project is open-source and available under the MIT License.
