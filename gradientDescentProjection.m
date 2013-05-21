function U = gradientDescentProjection(J, grad, project, iv, alpha, num_iters)

u = iv;

for iter = 1:num_iters
	u = project(u - alpha*grad(u));
end

U = u;

end

	
