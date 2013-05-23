function r = amplitudeReflectCoeff(n, k, options)
	% options reading
	na = options(2);
	
	A = computeAdmitanceVector(n, k, options);
	
	Aa = A(length(A));
	r = (na - Aa)/(na + Aa);
endfunction 