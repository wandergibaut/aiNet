function FDat = prepareDataForFit(Ab, Dat, r)
	%FDat = ones(size(Ab));
	Fdat = Ab;

	for i =1:size(Ab,1)
		for j =1:size(Dat,1)
			dist = sqrt((Ab(j,1) - Dat(j,1)).^2 + (Ab(j,2) - Dat(j,2)).^2);

			if dist <= r
				FDat(i,:), = [Ab(j,:) Dat(j,:)];
			end
		end
	end
end