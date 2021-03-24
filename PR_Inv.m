function B = PR_Inv(A)
  [N N] = size(A);
  I = eye(N);
  
  % Folosim algoritmul Gram-Schmidt modificat pentru a calcula 
  % inversa matricei A.
  % Pentru aceasta calculam matricea superior triunghiulara U si 
  % matricea ortogonala Q.
  for i = 1:N
    U(i, i) = norm( A(:, i), 2);
    Q(:, i) = A(:, i) / U(i,i);
    
    for j = i + 1:N
      U(i, j) = Q(:, i)' * A(:, j);
      A(:, j) = A(:, j) - Q(:, i) * U(i, j);
    endfor
  endfor
  
  % Folosim algoritmul SST pentru a rezolva sistemul .
  Q = I * Q';

  for j = 1:N
    x = zeros(N, 1);
    x(N) = Q(N, j) / U(N, N);
    for i = N - 1:-1:1
      x(i) = ( Q(i, j) - U(i, i + 1 : N) * x(i + 1 : N)) / U(i,i);
    endfor
    B(1:N, j) = x;
  endfor
  
endfunction
