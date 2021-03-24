# pagerank
Tema realizata de Cebotari Zinaida, 2020

Functia Irerative, a fost implementata in baza algoritmului folosit de motorul de cautare Google, pentru a calcula vectorul de indici PageRank(PR). Aceasta functie citeste din fisier datele din graf si construieste matricea de adiaceta M,  conform algoritmului PageRank. Aceasta matrice este folosita pentru a calcula vectorul PR, iterativ, pana se ajunge la acuratetea dorita. 

Functia Algebraic calculeaza vectorul PR, fara a face iteratii, acest algoritm doar constuieste matricea de adiacenta, la fel ca in algoritmul Iterative. Apoi este calculata o noua matrice, corespunzator cu formula din algoritm, adica (I - d * M). Aceasta matrice se inverseaza folosind algoritmul modificat Gram-Schmidt, in urma carui se obtin matricile U si Q. Deducem formula prin care trebuie sa calculam matricea inversa. Astfel daca T este matricea pe care o inversam, care este egala cu: T = U * Q, si folosindune de proprietatea ca T * T ^ -1 = I,  deducem ca U * T ^ -1 = I * Q'. Acesta este un sistem superior triunghiular, care este rezolvat cu ajutorul algoritmului SST. Obtinem matricea inversa, aceasta este folosita in formula pentru calculul vectorului PR. Mentionez ca atat algoritmul Gram-Schmidt, cat si algoritmul SST, le-am imlementat in baza pseudocodului din laboratoare. 

Functia PageRank, primeste fisierul din care citeste datele. Apeleaza functia Iterative si Algebraic, pentru a scrie in fisierul de iesiere vectorul PR1 si PR2. Apoi se sorteaza vectorul PR2, descendent, pentru valorile din PR2 se calculeaza apartenenta, cu ajutorul functiei Apartenenta. Si aceste valori se trec in fisierul de iesire conform cerintelor.
