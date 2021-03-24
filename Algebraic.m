function R = Algebraic(nume, d)
  file_in = fopen(nume);
  N = fscanf(file_in, "%d", 1); 
  iter = N;
  
  v = ones(N,1);
  M = zeros(N, N);
  I = eye(N, N);
  
  % Folosim acelasi algoritm ca la functia Iterative pentru a calcula
  % matricea M
  while iter > 0
    i = fscanf(file_in, "%d", 1);
    k = fscanf(file_in, "%d", 1);
    z = k;
    
    while k > 0
      j =  fscanf(file_in, "%d", 1);
      if i != j
        M(i, j) = 1;
      elseif i == j
        z--;
      endif
      k--;
    endwhile
    
    for k = 1:N
      if M(i, k) != 0
        M(i, k) = M(i, k) / z;
      endif
    endfor
    iter--;
  endwhile
  M = M';
  
  % Pentru a calcula vectorul R(vectorul indicilor PageRank), 
  % este nevoie sa facem inversa matricei A calculata dupa 
  % formula din algoritmul PageRank.
  A = (I - d * M);
  A_inv = PR_Inv(A);
  
  % Calculam R dupa formula algoritmului algebraic PageRank.
  R = A_inv * ((1 - d)/ N) * v;
  fclose(file_in);
  
 endfunction
