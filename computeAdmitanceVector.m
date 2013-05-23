function [A, deltaA] = computeAdmitanceVector(n, k, options)
	% reading options
	n0 = options(1);
	na = options(2);
	H = options(3);
	N = options(4);
	
	
	d = H / N; % layer thickness
	
	nExtended = [n0 n];
	
	l = length(nExtended);
	kl = length(k);
	
	A = ones(1, l);
	deltaA = ones(kl, l - 2);
	
	A(1) = nExtended(1);
	
	for m=2:l
		nj = nExtended(m);
		phij = k * nj * d;
		A(m) = ( i * nj * sin(phij) + A(m-1) * cos(phij) )/( cos(phij) + (i/nj) * A(m-1) * sin(phij)); 
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


