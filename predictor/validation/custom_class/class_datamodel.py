from typing import List, Optional
from datetime import date

from pydantic import BaseModel, conlist, ConfigDict, Field

from validation.custom_enum.enum_literal import (
    TypeGender,
    TypeProfession,
    TypeSleepDuration,
    TypeDietaryHabits,
    TypeDegree )



class DatamodelInfo(BaseModel):
    # Store the "value" of "Enum", not "<Enum.KEY>"
    model_config = ConfigDict(use_enum_values = True)

    # # Not required
    # id: Optional[int] # Should be auto-generated once inserted into the database
    # date: Optional[date] # Should be auto-generated once inserted into the database

    # Required
    gender: TypeGender
    age: int = Field(
        ...,
        ge = 0 )
    city: str = Field(
        ...,
        max_length = 50 )
    cgpa: float = Field(
        ...,
        ge = 0.0,
        le = 10.0 )
    degree: TypeDegree
    profession: TypeProfession
    profession_hour_daily: int = Field(
        ...,
        ge = 0,
        le = 24 )
    profession_pressure: int = Field(
        ...,
        ge = 0,
        le = 5 )
    profession_satisfaction: int = Field(
        ...,
        ge = 0,
        le = 5 )
    financial_stress: int = Field(
        ...,
        ge = 0,
        le = 5 )
    sleep_duration: TypeSleepDuration
    dietary_habits: TypeDietaryHabits
    history_family_illness_mental: bool
    history_thoughts_suicidal: bool

    # # Target
    # depression: bool



class DatamodelPrediction(DatamodelInfo):
    id: Optional[int] # Should be auto-generated once inserted into the database
    date: Optional[date] # Should be auto-generated once inserted into the database

    # Target
    depression: bool
    confidence: float = Field(
        ...,
        ge = 0.0,
        le = 100.0 )