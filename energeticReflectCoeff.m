function R = energeticReflectCoeff(n, k, options)
	r = amplitudeReflectCoeff(n, k, options);
	R = r .* conj(r);
endfunction