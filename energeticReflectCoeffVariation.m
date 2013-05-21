function deltaR = energeticReflectCoeffVariation(n, k)
	r = amplitudeReflectCoeff(n, k);
	na = n(length(n));
	coeff = (conj(r) * (1 + r)^2) / na;
	deltaAn = computeDeltaAn(n, k);
	deltaR = real(coeff * deltaAn);
endfunction