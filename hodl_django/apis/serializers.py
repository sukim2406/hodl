from rest_framework import serializers
from stock import models

class StockSerializer(serializers.ModelSerializer):
    class Meta:
        fields= (
            'id',
            'title',
            'ticker',
            'amount',
            'avgPrice',
            'curPrice',
        )
        model = models.Stock