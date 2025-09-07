from fastapi import FastAPI, HTTPException
from typing import Dict, List

app = FastAPI()

faq_data: Dict[str, str] = {
    'How do I reset my password': 'Via the work pal app',
    'What is the govtech website?': 'https://www.tech.gov.sg',
    'Where can I find available careers for govtech': 'You can go to Careers@gov',
    'What is Govtech': "GovTech is the lead agency driving Singapore's Smart Nation initiative and public sector digital transformation.",
    "What is Govtech's mission": 'Engineering Digital Government, Making Lives Better.'
}

@app.get("/")
def read_root() -> Dict[str , str]:
    return {"message": "Welcome to the FAQ Bot API"}

@app.get("/questions")
def get_questions() -> Dict[str, List[str]]:
    return {"questions": list(faq_data.keys())}

@app.get("/answers")
def get_answer(question: str) -> Dict[str, str]:
    answer = faq_data.get(question)
    if not answer:
        raise HTTPException(status_code=404, detail = "Question not found")
    return {"question": question, "answer": answer}