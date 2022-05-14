from cmath import nan
import os
from pickle import FALSE
import time




file = "campionato.cl"
print("\nStart at " + time.strftime("%H:%M:%S"))
print("Reading from " + file)
print("Solving...")

esecuzione = os.popen("clingo " + file + " -t 8")
risultato = esecuzione.read()

lista = risultato.split()

satisfiable = False
try:
    lista.index("UNSATISFIABLE")
except:
    satisfiable = True
    i = risultato.index("Answer") 
    lista = risultato[i:].split()
    

if(satisfiable):
    giornate = []
    print('\n' + lista[0] + ' ' + lista[1])
    for i in range(2,len(lista),1):
        if(lista[i] == "SATISFIABLE"):
            break
        partita = lista[i][8:-1]
        partitaL = partita.split(',')
        giornate.append([int(partitaL[2]),partitaL[0],partitaL[1]])

    ## ordino per giornata
    giornate.sort()

    giornata = 0
    for partita in giornate:
        if(giornata != partita[0]):
            giornata += 1
            print("\nGiornata " + str(giornata) + ":    ", end="")
    
        print(partita[1] + '-' + partita[2] + "     ", end="")

    ## stampo le statistiche
    index = risultato.index("SATISFIABLE")
    print('\n\n' + risultato[index:])
else:
    index = risultato.index("UNSATISFIABLE")
    print('\n\n' + risultato[index:])