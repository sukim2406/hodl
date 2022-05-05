from django.db import models

# Create your models here.
class Stock(models.Model):
    title = models.CharField(max_length=200)
    ticker = models.CharField(max_length=5)
    amount = models.IntegerField()
    avgPrice = models.DecimalField(decimal_places=2, max_digits=10)


    def getCurPrice(self):
        return 13;    
    
    curPrice = models.DecimalField(decimal_places=2, max_digits=10, default=getCurPrice)

    def __str__(self):
        return self.title
