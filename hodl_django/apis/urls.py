from django.urls import path
from .views import ListStock, DetailStock
urlpatterns = [
    path('stocks/', ListStock.as_view()),
    path('stocks/<int:pk>/', DetailStock.as_view()),
]