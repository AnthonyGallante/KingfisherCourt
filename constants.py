TEAMS_DATA = 'data\\teams_data.pkl'
STAT_EFFECTS = 'data\\stat_effects.pkl'
ELO_STAT_EFFECTS = 'data\\team_stat_effects.pkl'

POSSESSIONS_MEAN = 72.04849315068492
POSSESSIONS_STD_DEV = 3.22918695871525

ELO_MEAN = 1321.4271506849316
ELO_STD_DEV = 193.5210571887283

GPT_MODEL = "gpt-5-nano-2025-08-07" # GPT 5 Nano
# GPT_MODEL = "gpt-5.2-2025-12-11"  # GPT 5.2

#-- SPREADSHEET MAP --

SKIP_ROWS = [37, 54, 63, 68, 71]
ROW_NUMS = [i for i in list(range(5, 73)) if i not in SKIP_ROWS]
ROWS = {i: str(r) for i, r in enumerate(ROW_NUMS, start=1)}

GAME_COL    = 'E'
TEAM_1_COL  = 'G'
TEAM_2_COL  = 'I'
SCORE_1_COL = 'L'
SCORE_2_COL = 'N'
WINNER_COL  = 'O'
EVAL_COL    = 'Q'