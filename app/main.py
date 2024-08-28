from fastapi import FastAPI
from pydantic import BaseModel
import uvicorn

app = FastAPI()

# Define a Pydantic model for the response
class HelloWorldResponse(BaseModel):
    message: str

@app.get("/", response_model=HelloWorldResponse)
def hello_world():
    return {"message": "OK"}

# Store the original openapi method
original_openapi = app.openapi

# Custom OpenAPI schema generation
def custom_openapi():
    if app.openapi_schema:
        return app.openapi_schema
    openapi_schema = original_openapi().copy()  # Use the stored original method
    openapi_schema["servers"] = [
        {
            "url": "https://fastapi-python312-app-548687899732.us-west2.run.app", 
            "description": "Production server (Google Cloud Run)"
        }
    ]
    app.openapi_schema = openapi_schema
    return app.openapi_schema

# Override the default openapi method with the custom one
app.openapi = custom_openapi

if __name__ == "__main__":
    # Run the Uvicorn server to serve the FastAPI app
    uvicorn.run(app, host="0.0.0.0", port=8000)
