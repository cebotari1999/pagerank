function y = Apartenenta(x, val1, val2)
  if x >=  0 && x < val1
    y = 0;
  elseif x >= val1 && x <= val2
    y = (x - val1) / (val2 - val1);
  elseif x > val1 && x <= 1
    y = 1;
  endif
	