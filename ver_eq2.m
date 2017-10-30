function [Is] = ver_eq2(I); 
l = length(I); 
Is = []; 
if l > 1, 
   for i=1:l-1, 
      aux = I(i); 
      auxI = I(i+1:end); 
      el = find(auxI == aux); 
      if isempty(el), 
         Is = [Is,aux]; 
      end; 
   end; 
   Is = [Is,I(end)]; 
else, 
   Is = I; 
end; 