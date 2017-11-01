function Ab = keepBounds(Ab, Nc, vmax,vmin)

	for i=1:Nc
		for j =1:size(Ab(:,:,i),1)
			if (Ab(j,1,i) < vmin) 
				Ab(j,1,i) = vmin;
            end
			if (Ab(j,1,i) > vmax)
				Ab(j,1,i) = vmax;
            end
			if (Ab(j,2,i) < vmin)
				Ab(j,2,i) = vmin;
            end
			if (Ab(j,2,i) > vmax)
				Ab(j,2,i) = vmax;
			end
		end
	end

end