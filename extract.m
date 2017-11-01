function [M] = extract(M,I) 
Maux = zeros(size(M)); 
Maux(I,:) = M(I,:); 
M = M - Maux; 
[I] = find(M(:,1)~=0); 
M = M(I,:);
end