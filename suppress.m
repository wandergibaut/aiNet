function [Ab] = suppress(Ab,ts);
% Given that the pairwise distance between any to Ab’s is below ts, stay only with the one with higher fitness
	
	% M   -> memory matrix 
% D1  -> idiotypic affinity matrix 
	D1 = dist(Ab); 
	aux = triu(D1,1); 
	[Is,Js] = find(aux>0 & aux<ts); 
	if ~isempty(Is), 
   		Is = ver_eq2(Is); 
   		Ab = extract(Ab,Is); 
   % D1 = extract(D1,Is); 
	end; 
end;