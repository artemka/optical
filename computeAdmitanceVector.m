function [A, deltaA] = computeAdmitanceVector(refractiveIndexes, k, h)
	
	l = length(refractiveIndexes);
	kl = length(k);
	
	k = 2 * 3.1415 / k;
	
	A = ones(kl, l);
	deltaA = ones(kl, l - 2);
	
	A(:, 1) = refractiveIndexes(1);
	
	for n=2:l
		nj = refractiveIndexes(n);
		phij = k' * nj * h;
		A(:, n) = ( i * nj * sin(phij) + A(:, n-1) .* cos(phij) )./( cos(phij) + (i/nj) * A(:, n-1) .* sin(phij)); 
	end
	
	#{
	deltaA(:, 1) = refractiveIndexes(1);
	for m=2:(l-1)
		nj = refractiveIndexes(m);
		phij = k' * nj * h;
		numerator = i * phij - (i * k * h) / nj * A(: ,m-1).^2 + i / 2 * sin(2 * phij) * (1 + (A(m-1)/nj)^2) - 2 / nj * A(m-1) * sin(phij)^2;
		denominator = ( cos(phij) + (i/nj) * A(m-1) * sin(phij))^2;
		deltaA(m - 1) = numerator / denominator;
	end
	#}
endfunction


