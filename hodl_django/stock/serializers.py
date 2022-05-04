from dataclasses import field
from rest_framework import serializers
from .models import Stock

class StockSerializer(serializers.ModelSerializer):
    class Meta:
        model = Stock
        fields = ('title', 'ticker', 'amount', 'avgPrice')