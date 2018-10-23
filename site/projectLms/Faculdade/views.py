from django.shortcuts import render

def index(request):
	return render(request, 'index.html')

def login(request):
	return render(request,'login.html')

def detalhes(request):
	return render(request,'detalhes.html')

def noticia(request):
	return render(request,'noticia.html')
	
def disciplina(request):
	return render(request,'disciplina.html')
	
def curso(request):
	return render(request,'curso.html')
	
def teste(request):
	return render(request,'teste.html')

