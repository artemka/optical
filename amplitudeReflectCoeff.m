function r = amplitudeReflectCoeff(n, k, h)
	A = computeAdmitanceVector(n, k, h);
	Aa = A(:, length(A))';
	na = n(length(n));
	r = (na - Aa)./(na + Aa);
endfunction 