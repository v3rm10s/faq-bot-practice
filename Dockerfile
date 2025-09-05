FROM python:3.9-slim

WORKDIR /app

COPY . /app

CMD ["python","./faq-bot-v3.py"]