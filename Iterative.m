function R = Iterative(nume, d, eps)
  file_in = fopen(nume);
  
  iter = N = fscanf(file_in, "%d", 1); 
  v = ones(N,1);
  M = zeros(N, N);
  
  % In acesta bucla construiesc matricea de adiacenta.
  while iter > 0
    
   % Il citesc pe i, care reprezinta linia pe care 
   % ma plasez in matrice de adiacenta.
   i = fscanf(file_in, "%d", 1);
   
   % k reprezinta numarul de noduri cu care are legaturi nodul i.
   k = fscanf(file_in, "%d", 1); 
   z = k;
   
   % In paralel construi vectorul coloana initial R (vectorul indicilor
   % PageRank).
   R_prev(i, 1) = 1/N;
   
   % Daca intre nodul i si j este o legatura, atunci pe linia i, 
   % coloana j, a matricei M, salvez valoarea 1.
   while k > 0
     j =  fscanf(file_in, "%d", 1);
     
     % Se verifica daca nodul nu are legatura cu el insusi, daca da,
     % atunci numarul cu care o s-a impartim linia i din matricea M, 
     % scade cu 1.
     if i != j
        M(i, j) = 1;
     elseif i == j
        z--;
     endif
     k--;
   endwhile
   
   % Impartim toate elementele din matricea M, de pe linia i cu 
   % z(numarul total de noduri din care se poate ajunge din nodul i).
   for w = 1:N
    if M(i, w) != 0
      M(i, w) = M(i, w) / z;
    endif
   endfor
   
   iter--;
 endwhile
 M = M';
 

  % In acesta bucla calculam vectorul R in baza vectorului anterior 
  % R_prev si ii comparam, pana nu atingem acuratetia dorita.
  while 1
    R = d * M * R_prev + ((1 - d) / N) .* v;

    if (norm(R - R_prev)) < eps
      R = R_prev;
      break;
    endif
    
   R_prev = R;
  endwhile
  
  fclose(file_in);
endfunction