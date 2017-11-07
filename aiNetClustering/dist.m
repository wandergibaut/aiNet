function D = dist(A)
	D = zeros(size(A,1),size(A,1));

	for i=1:size(A,1)
		for j=1:size(A,1)
			D(i,j) = sqrt((A(i,1) - A(j,1)).^2 + (A(i,2) - A(j,2)).^2); 
		end
	end
end