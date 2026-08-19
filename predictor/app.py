from pathlib import Path
from typing import List, Any
from joblib import load as joblib_load
from contextlib import asynccontextmanager
from os import environ

from pydantic import BaseModel, conlist
from fastapi import FastAPI, Body
from sklearn.pipeline import Pipeline
import pandas as pd

from validation.custom_class.class_datamodel import DatamodelInfo



MODEL_PATH: str = f"{Path(__file__).parent}/model/model.pkl"



@asynccontextmanager
async def lifespan_api(app: FastAPI):
    try:
        # Executed as "app" is created (when this function is provided as "lifespan" argument)
        app.predictor = joblib_load(MODEL_PATH)
    except Exception as e:
        print(e)

    yield
    # Executed after "app" called "return"
    app.predictor = None
    return


app: FastAPI = FastAPI(title = "API : 'Depression predictor'",
                       description = "API to interact with the 'Depression predictor'",
                       version = "1.0",
                       lifespan = lifespan_api)


API_POST_PREDICT = environ.get("API_POST_PREDICT") # "/predict", in ".env"
@app.post(API_POST_PREDICT,
         tags = ["prediction"])
async def post_prediction(datamodel_info: DatamodelInfo) -> dict:
    info: pd.DataFrame = pd.DataFrame(
        data = [list(datamodel_info.model_dump().values())],
        columns = list(datamodel_info.model_dump().keys()) )
    
    prediction = app.predictor.predict(X = info).tolist()
    prediction_confidence = app.predictor.predict_proba(X = info).tolist()

    dict_prediction: dict = {
        "prediction": prediction,
        "prediction_confidence": prediction_confidence}

    return dict_prediction