function J = costFunction(R, RDes, lambda1, lambda2)
	J = @(n) quadcc(@(lambda) abs(R(n, lambda) - RDes(lambda))^2, lambda1, lambda2);
endfunction 