function R = energeticReflectCoeff(n, k, h)
	r = amplitudeReflectCoeff(n, k, h);
	R = r .* conj(r);
endfunction