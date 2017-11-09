function [C] = clone_mut_select_clustering(Ab,Nc,beta,fitin,xmin,xmax,ymin,ymax,f, DATA, r)
% Generate Nc-1 clones from each Ab and mutate using a normal dist.
    for i=1:size(Ab,1)
        for j=1:Nc
            g = (randn./beta) .* exp(-fitin(i));
            h = (randn./beta) .* exp(-fitin(i));
            Cm(:,:,j) = [Ab(:,1)+g, Ab(:,2)+h];
        end
	end
% Keep one previous individual for each clone unmutated
    %[~, I] = max(fitin);
	%Cb = Ab(I,:); 
    Cb = Ab;
% Keeps all elements of the population within the allowed bounds
    Cm = keepBounds(Cm, Nc, xmax,xmin);
    
%     for i=1:Nc
%       Cbb(:,:,i) = Cb;
%     end
    
    Cm(:,:,Nc+1) = Cb;
%     Cm = [Cm; Cbb];

   	for i=1:Nc+1
      %if 
      %end
   		%x(i,:) = Ab(i,:,1); 
   		%y(i,:) = Ab(i,:,2);
      %fit(:,i) = f(Cm(:,:,i));
      fit(:,i) = calcFitness(Cm(:,:,i), DATA, f, r);
   	end
      [~, I] = max(fit,[],2);
      
% C stores only the best individual of each clone      
    for i=1:size(I,1)
%       for j=1:size(Cm(:,:,I(i)),1);
        C(i,:) = Cm(i,:,I(i));
        fitness(i) = fit(i,I(i));
%       end
    end
    
% sort
    %fitness = f(C);
    %fitness = calcFitness(C, DATA, f, r)
    [~,fitSort]=sort(fitness); %Get the order of B
    
%     for i=1:size(fitSort)
%         Ctemp(i,:) = C(fitSort(i),:);
%     end
    C = C(fitSort,:);

      %C = Cm(:,:,I);
   	


	%Cmi = ones(1,L); Cag = C; % Maintenance of the fittest cell before maturation 
	%for i=1:n, 
   %		vones = ones(Nc(i),1); 
   %		C = [C; vones * Ab(I(i),:)]; 
   %		Cag = [Cag; vones * ag]; 
   %		Cmi = [Cmi; rand(Nc(i),L) .* D(I(i)) .* mi]; 
	%end; 

end