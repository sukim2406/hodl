from django.urls import path, include
from .views import helloAPI, randomStock

urlpatterns = [
    path("hello/", helloAPI),
    path("<int:id>/", randomStock),
]