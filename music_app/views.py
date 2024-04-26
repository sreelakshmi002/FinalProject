from django.http import HttpResponse,HttpResponseRedirect
from django.shortcuts import render
from django.shortcuts import redirect
from django.urls import reverse
from  django.core.files.storage import FileSystemStorage
import datetime
import os
from django.conf import settings
from .models import *
from urllib.parse import urlencode
from ML import emotions_detection
from ML import test
from keras import backend as K



def landing(request):
    return render(request,'index.html')

def index(request):
    return render(request,'index.html')

def landing(request):
    return render(request,'index.html')

def secondpage(request):
    return render(request,'secondpage.html')

def adminpage(request):
    return render(request,'adminpage.html')

def loginAndSignup(request):
    return render(request,'loginAndSignup.html')
# def first(request):
#     return render(request,'index.html')

def addreg(request):
    if request.method=="POST":
        name=request.POST.get('name')
        phone=request.POST.get('phone_number')
        email=request.POST.get('email')
        password=request.POST.get('password')
         
        sa=user(name=name,phone_number=phone,email=email,password=password)
        sa.save()
    return redirect('landing')





def login(request):
    return render(request,'loginAndSignup.html')

def addlogin(request):
    email = request.POST.get('email')
    password = request.POST.get('password')
    if email == 'admin@gmail.com' and password =='admin':
        request.session['details'] = 'admin'
        return render(request,'index.html')
        

    elif user.objects.filter(email=email,password=password).exists():
            userdetails=user.objects.get(email=email,password=password)
            request.session['uid'] = userdetails.id
            return render(request,'index.html')
            
    else:
         #messages.error(request,'Invalid Email or Password'); 
         return redirect('loginAndSignup')
    
def logout(request):
     session_keys=list(request.session.keys())
     for key in session_keys:
         del request.session[key]
     return redirect(addlogin)

def addfeed(request):
    if request.method=="POST":
        user=request.session['uid']
        feedback=request.POST.get('feedback')
        x=feedtable(user=user,feedback=feedback)
        x.save()
        return render(request,'feedback.html')
    else:
        return render(request,'feedback.html')

def viewfeedback(request):
    x=feedtable.objects.all()
    a=user.objects.all()
    for i in x:
        for j in a:
            if str(i.user)==str(j.id):
                i.user=j.name
    return render(request,'viewfeedback.html',{'result':x})



def addmusic(request):
    if request.method == 'POST':
        name=request.POST.get('name')
        description=request.POST.get('description')
        myfile = request.FILES['musics']
        fs = FileSystemStorage()
        filename = fs.save(myfile.name,myfile)
        emotion=request.POST.get('emotion')
        language=request.POST.get('language')
        
        user=music_recommendation(name=name,description=description,musics=filename,emotion=emotion,language=language)    
        user.save()
    return render(request,'addmusic.html')    


def start(request):
    return render(request,'start.html')

def instruction(request):
    return render(request,'instructions.html')

def startwebcam(request):
    K.clear_session()
    emotion, stress_level = emotions_detection.predict()
    K.clear_session()
    print("the predicted emotion is:", emotion)
    print("the predicted stress level is:", stress_level)
    user = music_recommendation.objects.filter(emotion=emotion)
    return render(request, 'viewresult.html', {'emtn': emotion, 'strs': stress_level, 'user': user})

def upload(request):
    return render(request,'upload.html')



def addupload(request):
    result = None
    user = None

    if request.method == "POST":
        myfile = request.FILES['file'] 
        fs = FileSystemStorage()
        filename = fs.save(myfile.name, myfile)
        try:
            os.remove(os.path.join(settings.MEDIA_ROOT, 'input/test/test.jpg'))
        except:
            pass

        fs = FileSystemStorage(location=os.path.join(settings.MEDIA_ROOT, 'input/test'))
        fs.save("test.jpg", myfile)

        K.clear_session()
        image_path = os.path.join(settings.MEDIA_ROOT, 'input/test/test.jpg')
        result = test.predict_emotion(image_path)
        print("Emotion:", result)

        user = music_recommendation.objects.filter(emotion=result)

    return render(request, 'viewresult.html', {'emtn': result, 'user': user})



    


def rateee(request):
    return render(request,'try.html')



def addrating(request):
    if request.method=="POST":
        q1=request.POST.get('q1')
        q2=request.POST.get('q2')
        q3=request.POST.get('q3')
        q4=request.POST.get('q4')
        ratings=round(((int(q1))+(int(q2))+(int(q3))+(int(q4))/4))
        print("Rating:",ratings)
        ins=rating_tbl(user_id=request.session['uid'],ratings=ratings)
        ins.save()
    return render(request,'index.html')    

def viewfeed(request):
    sel=feedtable.objects.all()
    sel1=user.objects.all()
    for i in sel:
        for j in sel1:
          if str(i.user)==str(j.id):
                i.user=j.name
    return render(request,'viewfeed.html',{'res':sel})


def viewrating(request):
    sel=rating_tbl.objects.all()
    sel1=user.objects.all()
    for i in sel:
        for j in sel1:
          if str(i.user_id)==str(j.id):
                i.user_id=j.name
    return render(request,'viewrating.html',{'res':sel})



def viewmusic(request):
    sel=music_recommendation.objects.all()
    return render(request,'viewmusic',{'res':sel})