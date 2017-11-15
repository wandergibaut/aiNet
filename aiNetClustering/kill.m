function [Ab, fit] = kill(Ab, fit)
	I = []
	for i=1:size(fit,1)
		if fit(i) < 0.4 %1/r
			I = [I; i]
		end
	end
	Ab = extract(Ab,I);
	fit = extract(fit,I);

end