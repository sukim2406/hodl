from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.decorators import api_view
from .models import Stock
from .serializers import StockSerializer
import random

# Create your views here.
@api_view(['GET'])
def helloAPI(request):
    return Response("Hello World!")

@api_view(['GET'])
def randomStock(request, id):
    totalStocks = Stock.objects.all()
    randomStocks = random.sample(list(totalStocks), id)
    serializer = StockSerializer(randomStocks, many=True)
    return Response(serializer.data)