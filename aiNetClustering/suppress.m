function [Ab, fit] = suppress(Ab,ts,f, DATA, fit)
% Given that the pairwise distance between any to Ab’s is below ts, stay only with the one with higher fitness
	
	% M   -> memory matrix 
% D1  -> idiotypic affinity matrix 
	Iaux = [];
    %fit = calcFitness(Ab, DATA, f, ts)
    %fit = f(Ab);
    D1 = dist(Ab); 
	aux = triu(D1,1); 
	[Is,Js] = find(aux>0 & aux<ts);
    
    while ~isempty(Is)
    for i=1:size(Is)
        if fit(Is(i)) >= fit(Js(i))
            Iaux = [Iaux Js(i)]; 
        else
            Iaux = [Iaux Is(i)]; 
        end
    end
    Ab = extract(Ab,Iaux);
    fit = extract(fit,Iaux);
    %fit = f(Ab);
    %fit = calcFitness(Ab, DATA, f, ts)
    D1 = dist(Ab); 
	aux = triu(D1,1); 
    [Is,Js] = find(aux>0 & aux<ts);
    Iaux = [];
    end
    
     
% 	if ~isempty(Is), 
%    		Is = ver_eq3(Is); 
%    		Ab = extract(Ab,Is); 
   % D1 = extract(D1,Is); 
% 	end; 
end