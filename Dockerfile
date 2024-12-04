FROM python:3.10-slim

WORKDIR /app

COPY . .

RUN apt update && apt install -y build-essential

RUN --mount=type=cache,target=/root/.cache/pip python -m pip install auralis

ENTRYPOINT [ "python", "-m", "auralis.openai" ]

CMD [ "--host", "127.0.0.1", "--port", "8000", "--model", "AstraMindAI/xttsv2", "--gpt_model", "AstraMindAI/xtts2-gpt", "--max_concurrency", "8", "--vllm_logging_level", "warn" ]
