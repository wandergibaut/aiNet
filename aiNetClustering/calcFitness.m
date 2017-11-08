function fit = calcFitness(Ab, Dat, f, r)
	fit = zeros(size(Ab,1),1);
	distM = ones(size(Ab,1),size(Dat,1));

	for i =1:size(Ab,1)
		FDat = [];
		betterDist = 100;
		for j =1:size(Dat,1)
			distM(i,j) = sqrt((Ab(i,1) - Dat(j,1)).^2 + (Ab(i,2) - Dat(j,2)).^2);
			%dist = sqrt((Ab(i,1) - Dat(j,1)).^2 + (Ab(i,2) - Dat(j,2)).^2);

%			if dist <= r
			%if dist < betterDist
			%	betterDist = dist;
			%	FDat = [Ab(i,:) Dat(j,:)];
			%end
		end
		[~, J] = min(distM(i,:));
		FDat = [Ab(i,:) Dat(J,:)];
		%if size(FDat,1) ~=0
			fit(i) = f(FDat);
		%else 
		%	fit(i) = 0;
		%end
		
	end
end
