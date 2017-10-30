function [C] = clone_mut_select(Ab,Nc,beta,fitin,xmin,xmax,ymin,ymax,f);
	for i=1:Nc,
% Generate Nc-1 clones from each Ab and mutate using a normal dist.
		g = (randn./beta) .* exp(-fitin(i));

		Cm(:,:,i) = [Ab(:,1)*g, Ab(:,2)*g];
	end
% Keep one previous individual for each clone unmutated
  [~, I] = max(fitin);
	Cb = Ab(I,:); 
% Keeps all elements of the population within the allowed bounds
    Cm = keepBounds(Cm, Nc, xmax,xmin);
    
    for i=1:Nc
      Cbb(:,:,i) = Cb;
    end
    
    Cm = [Cbb; Cm];

   	for i=1:Nc
      %if 
      %end
   		%x(i,:) = Ab(i,:,1); 
   		%y(i,:) = Ab(i,:,2);
      fit(:,i) = f(Cm(:,:,i));
   	end
      [~, I] = max(fit');
      
    for i=1:size(I)
      for j=1:size(Cm(:,:,I(i)));
        C(j,:) = Cm(j,:,I(i));
      end
    end
      
      %C = Cm(:,:,I);
   	
% C stores only the best individual of each clone

	%Cmi = ones(1,L); Cag = C; % Maintenance of the fittest cell before maturation 
	%for i=1:n, 
   %		vones = ones(Nc(i),1); 
   %		C = [C; vones * Ab(I(i),:)]; 
   %		Cag = [Cag; vones * ag]; 
   %		Cmi = [Cmi; rand(Nc(i),L) .* D(I(i)) .* mi]; 
	%end; 

end