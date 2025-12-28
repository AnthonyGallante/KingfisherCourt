import os
from openai import OpenAI

client = OpenAI(api_key=os.environ.get("OPENAI_API_KEY"))


def create_prompt(winner, record, contributions):
    prompt = f"""
        You are a professional, but spunky, college basketball sports analyst tasked with summarizing the output of a March Madness game simulator. 
        In your analysis of the stats, briefly explain why one team may have beaten the other.

        Your task is to analyze the simulation output below and provide a concise summary of the simulation results in 30 words or fewer:
        Overall winner: {str(winner)}
        Simulation Results: {str(record)}
        Player Contributions: {str(contributions)}
    """
    return prompt


def GPT_Game_Analysis(prompt, model="gpt-5-nano-2025-08-07"):
    messages = [{"role": "user", "content": prompt}]
    response = client.chat.completions.create(        
        model=model, messages=messages)
    return response.choices[0].message.content