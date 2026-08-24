from pathlib import Path
from typing import (
    List,
    Any )
from joblib import load as joblib_load
from contextlib import asynccontextmanager
from os import (
    environ,
    listdir )

from pydantic import (
    BaseModel,
    conlist )
from fastapi import (
    FastAPI,
    Body )
from fastapi.middleware.cors import CORSMiddleware
from sklearn.pipeline import Pipeline
import pandas as pd

from validation.custom_class.class_datamodel import DatamodelInfo



# DIR_MODEL_SELECTED: str = f"{Path(__file__).parent}/{environ.get("DIR_MODEL_SELECTED")}"
DIR_MODEL_SELECTED: str = environ.get("DIR_MODEL_SELECTED")

API_POST_PREDICT = environ.get("API_POST_PREDICT") # "/predict", in ".env"



def load_selected_model(dir_model: str,
                        model_ext: str = "pkl") -> Any:
    list_file_model: list[str] = []
    for file in listdir(path = dir_model):
        if (file.split(".")[-1] == model_ext):
            list_file_model.append(file)

    model_loaded: Any = None
    if (len(list_file_model) == 1):
        model: str = f"{dir_model}/{list_file_model[0]}"
        model_loaded = joblib_load(model)

    return model_loaded


@asynccontextmanager
async def lifespan_api(app: FastAPI):
    try:
        # Executed as "app" is created (when this function is provided as "lifespan" argument)
        app.predictor = load_selected_model(dir_model = DIR_MODEL_SELECTED)

    except Exception as e:
        print(e)

    yield
    # Executed after "app" called "return"
    app.predictor = None
    return


app: FastAPI = FastAPI(
    title = "API : 'Depression predictor'",
    description = "API to interact with the 'Depression predictor'",
    version = "1.0",
    lifespan = lifespan_api )

app.add_middleware(
    CORSMiddleware,
    allow_origins = ["http://localhost:5173"],
    allow_methods = ["POST"],
    allow_headers = ["*"],
)


@app.post(
    API_POST_PREDICT,
    tags = ["prediction"] )
async def post_prediction(datamodel_info: DatamodelInfo) -> dict:
    info: pd.DataFrame = pd.DataFrame(
        data = [list(datamodel_info.model_dump().values())],
        columns = list(datamodel_info.model_dump().keys()) )
    
    # prediction = app.predictor.predict(X = info).tolist()
    # prediction_confidence = app.predictor.predict_proba(X = info).tolist()
    prediction = app.predictor.predict(X = info).tolist()[0]
    prediction_confidence = app.predictor.predict_proba(X = info).tolist()[0]

    # print(f"prediction\n\t${prediction}")
    # print(f"prediction_confidence\n\t${prediction_confidence}")

    dict_prediction: dict = {
        "prediction": prediction,
        "prediction_confidence": prediction_confidence }

    return dict_prediction