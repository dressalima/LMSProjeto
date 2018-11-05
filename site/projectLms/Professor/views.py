from django.shortcuts import render

def portalProfessor(request):
	return render(request,'portalProfessor.html')

def lancamentos(request):
	return render(request, 'lancamentos.html')

def planodeensinoPf(request):
	return render(request, 'planodeensinoPf.html')

def avisosPf(request):
	return render(request,'avisosPf.html')

