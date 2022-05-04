from django.urls import path
from .views import ListStock, DetailStock

urlpatterns = [
    path('', ListStock.as_view()),
    path('<int:pk>/', DetailStock.as_view()),
]