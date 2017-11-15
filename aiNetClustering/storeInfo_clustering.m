function [resultado] = storeInfo_clustering(Ab, resultado, it)
  pop_it = resultado.pop_it;
  %x_it = resultado.x_it;
  %x = resultado.x;
  
  %[~, I] = max(fit);
  
  
  pop_it{it} =  Ab;
  %x_it(it,:) = Ab(I,:);
  
  %refit = f(x_it);
  %refit = calcFitness(x_it, Dat, f, r)
  
  %[~, J] = max(refit);
  %x = x_it(J,:);
 
  resultado.pop_it = pop_it;
  %resultado.x_it = x_it;
  %resultado.x = x;

end