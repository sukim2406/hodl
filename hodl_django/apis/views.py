from django.shortcuts import render

# Create your views here.

from stock import models
from .serializers import StockSerializer

from rest_framework import generics

class ListStock(generics.ListCreateAPIView):
    queryset = models.Stock.objects.all()
    serializer_class = StockSerializer

class DetailStock(generics.RetrieveUpdateDestroyAPIView):
    queryset = models.Stock.objects.all()
    serializer_class = StockSerializer