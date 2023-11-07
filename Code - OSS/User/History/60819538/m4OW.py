from django.urls import path
from .views import *

urlpatterns = [
    path('api/upload/sudoku', UploadView.as_view(),name = 'detectsolve')

]