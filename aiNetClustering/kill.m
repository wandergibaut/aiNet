function Ab = kill(Ab, fit)
	I = []
	for i=1:size(fit,1)
		if fit(i) < 1
			I = [I; i]
		end
	end
	Ab = extract(Ab,I);

end