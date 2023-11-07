from django.apps import AppConfig
import os
from django.conf import settings
from tensorflow.keras.models import load_model
from tensorflow import keras


class SolverConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'solver'

class DigitModelConfig(AppConfig):
    name='digitAPI'
    MODEL_FILE = os.path.join(settings.MODELS, "model-OCR.h5")
    model = keras.models.load_model(MODEL_FILE)