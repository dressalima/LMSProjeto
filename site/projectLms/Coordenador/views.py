from django.shortcuts import render

def portalCoordenador(request):
    return render(request, 'portalCoordenador.html')

def avisos(request):
    return render(request, 'avisos.html')

def ementas(request):
    return render(request, 'ementas.html')

def gruposalunos(request):
    return render(request, 'gruposalunos.html')

def planoensino(request):
    return render(request, 'planoensino.html')


def gestao(request):
    return render(request, 'gestao.html')