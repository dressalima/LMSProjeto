"""projectLms URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
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
from Faculdade.views import *
from Aluno.views import *
from Professor.views import *

urlpatterns = [
    path('', index),
	path('curso/', curso),
	path('detalhes/', detalhes),
	path('disciplina/', disciplina),
	path('noticia', noticia),
	path('login/', login),
	path('teste/', teste),
	path('notas/', notas),
	path('PortalHome/', PortalHome),
	path('portalProfessor/',portalProfessor),
	
	
]
