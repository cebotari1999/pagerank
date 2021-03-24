function [R1 R2] = PageRank(nume, d, eps)
  
  % Deschid fiserul de intrare si concatenez numele pentru
  % noul fisier.
  file_in = fopen(nume);
  fullname = [nume ".out"];
  file_out = fopen(fullname, "w");
  
  N = fscanf(file_in, "%d", 1);
  fprintf(file_out, '%d\n\n', N);
  
  % Afisez in fiserul de iesire vectorul R1, calculat
  % cu ajutorul functiei Iterative.
  R1 = Iterative(nume, d, eps);
  for i = 1:N
    fprintf(file_out, "%f\n", R1(i, 1));
  endfor
  fprintf(file_out, "\n");
  
  % Afisez in fiserul de iesire vectorul R2, calculat
  % cu ajutorul functiei Algebraic.
  R2 = Algebraic(nume, d);
  for i = 1:N
    fprintf(file_out, "%f\n", R2(i, 1));
  endfor
  fprintf(file_out, "\n");
  
  % Modific vectorul R2, astfel in cat pe prima coloana a vectorului, 
  % e reprezentat numarul nodului(care reprezinta pagina web)
  % si aceiasi linie, dar in a doua coloana
  % indicele PR pentru acesta nod.
  for i = 1:N
    R2(i, 2) = R2(i,1);
    R2(i, 1) = i;
  endfor
  
  % Sortez vectorul in functie de valorile PR, pentru a face clasamentul
  % paginilor web, rerpezentate de indicii nodurilor.
  for i = 1:N
    for j = 1:N
      if R2(j, 2) < R2(i, 2);
        aux = R2(i, 1); aux_1 = R2(i, 2);
        R2(i, 1) = R2(j, 1); R2(i, 2) = R2(j, 2);
        R2(j, 1) = aux; R2(j, 2) = aux_1;
      endif
    endfor
  endfor
  
  % Citesc tot graful din fisierul de intrare intr-o matrice, 
  % pentru ca s-a setez cursorul pe linia unde e val1,
  % apoi citesc val1 si val2.
  A = dlmread(file_in);
  val1 = A(N+2, 1);
  val2 = A(N+3, 1);
  
  % Afisez in fisierul de iesire, indicele din vectorul R2, indexul 
  % nodului care reprezinta pagina web si apartenenta acesteia.
  for i = 1:N
    x = Apartenenta(R2(i, 2), val1, val2);
    fprintf(file_out, "%d %d %f\n", i, R2(i, 1), x);
  endfor
   
  fclose(file_in);
  fclose(file_out);