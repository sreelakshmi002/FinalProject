
from django.db import models


class user(models.Model):
    name=models.CharField(max_length=150)
    phone_number=models.CharField(max_length=120)
    email=models.CharField(max_length=120)
    password=models.CharField(max_length=120)

class feedtable(models.Model):
    user=models.CharField(max_length=150) 
    feedback=models.CharField(max_length=150)


class upload(models.Model):
    name=models.CharField(max_length=150) 
    music=models.CharField(max_length=150)    



class rating_tbl(models.Model):
    user_id=models.CharField(max_length=150) 
    ratings=models.CharField(max_length=150)   
    #q1=models.CharField(max_length=150)   
    #q2=models.CharField(max_length=150)   
    #q3=models.CharField(max_length=150)   
    #q4=models.CharField(max_length=150)   




class music_recommendation(models.Model): 
    id=models.IntegerField(primary_key=True)
    name = models.CharField(max_length=150)
    description = models.CharField(max_length=150)
    musics = models.FileField(max_length=150)
    emotion = models.CharField(max_length=150)  
    language = models.CharField(max_length=150)  

 