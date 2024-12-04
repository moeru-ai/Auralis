FROM python:3.10-slim

WORKDIR /app

COPY . .

RUN apt update && apt install -y build-essential portaudio19-dev

RUN --mount=type=cache,target=/root/.cache/pip python -m pip install auralis

# https://github.com/astramind-ai/Auralis/blob/5a144edf69e5edebacedf68518c5b7d480d2a4a0/setup.py#L28-L32
ENTRYPOINT [ "auralis.openai" ]

CMD [ "--host", "127.0.0.1", "--port", "8000", "--model", "AstraMindAI/xttsv2", "--gpt_model", "AstraMindAI/xtts2-gpt", "--max_concurrency", "8", "--vllm_logging_level", "warn" ]
