from fastapi import FastAPI
from datetime import datetime

app = FastAPI()

@app.get("/")
async def get_server_time():
    server_time = datetime.utcnow().isoformat()
    return {"server_time": server_time}

# To run the app, use: `uvicorn main:app --host 0.0.0.0 --port 3000`

