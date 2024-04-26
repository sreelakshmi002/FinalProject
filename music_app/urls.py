"""music_app URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from . import views
from django.conf.urls import url
from django.conf import settings
from django.conf.urls.static import static


urlpatterns = [


    path('',views.landing),
    path('index',views.index),
    path('loginAndSignup/',views.loginAndSignup,name='loginAndSignup'),
    path('loginAndSignup/addreg',views.addreg),
    path('loginAndSignup/addlogin',views.addlogin),
    path('landing',views.landing,name='landing'),
    path('logout/',views.logout),
    path('secondpage',views.secondpage,name='secondpage'),
    path('adminpage',views.adminpage,name='adminpage'),
    path('addfeed',views.addfeed),
    path('viewfeedback',views.viewfeedback),
    path('start',views.start),
    path('instruction',views.instruction),
    path('startwebcam',views.startwebcam),
    path('upload',views.upload),
    path('addupload',views.addupload),
    path('rateee',views.rateee),
    path('addrating',views.addrating),
    path('addmusic',views.addmusic),
    path('viewrating',views.viewrating),
    path('viewmusic',views.viewmusic),
    path('viewfeed',views.viewfeed),
    


]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
