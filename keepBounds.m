function Ab = keepBounds(Ab, Nc, vmax,vmin)

	for i=1:Nc
		for j =1:size(Ab(:,:,i))
			if (Ab(j,1,i) < vmin) 
				Ab(j,1,i) = vmin;
			elseif (Ab(j,1,i) > vmax)
				Ab(j,1,i) = vmax;
			elseif (Ab(j,2,i) < vmin)
				Ab(j,2,i) = vmin;
			elseif (Ab(j,2,i) > vmax)
				Ab(j,2,i) = vmax;
			end
		end
	end

end