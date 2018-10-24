from django.shortcuts import render


def notas(request):
	return render(request,'notas.html')
	
def PortalHome(request):
	return render(request,'PortalHome.html')

