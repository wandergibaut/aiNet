function [Ab, D, resultado] = aiNetClusteringAlt(ts,f,N,Nc,beta,gen, vmin, vmax, DATA)
%   Internal functions: CLONE, SUPPRESS, NORMA
% Ab     -> matrix of memory cells
% ts    -> suppression threshold
% N     -> clone number multiplier
% Nc    -> no. of clones to be generated
% beta  -> decay of the inverse exponential function
% gen   -> maximum number of generations
%
% Initial Random Population Within the Intervals (xmin/xmax; ymin/ymax)

   %ymin e max
   xmin = vmin;
   ymin = vmin;
   xmax = vmax;
   ymax = vmax;

   Ab1 = xmin + rand(N,1).*(xmax - xmin);
   Ab2 = ymin + rand(N,1).*(ymax - ymin);
   Ab = [Ab1,Ab2];
   x = Ab(:,1); y = Ab(:,2);
% Define f here
   
   %f = -0.5 - ((sin(sqrt((x-ones(size(x))).^2 + (y-ones(size(y))).^2)).^2 - 0.5)./(1 + 0.001*((x-ones(size(x))).^2 + (y-ones(size(y))).^2)).^2)
   %f = func;
   %f = -0.5
   %fit = eval(f);

%   fit = calcFitness(Ab, DATA, f, ts);
   %[fit, Ab] = calcFitnessAlt(Ab, DATA, f);

   %fit = f(Ab);
   fit = zeros(size(Ab,1),1);
   it = 1; 
   Nold = N + 1; 
   Nsup = N;
   
   avfitold = mean(fit); 
   avfit = avfitold-1;
   
   %[~, I] = max(fit);
   
   resultado.totalIt = gen;
   resultado.pop_it = {Ab};
   %resultado.x_it(it,:) = Ab(I,:);
   %resultado.x = Ab(I,:);
   
% Main Loop
   while it < gen,
      for i=1:size(DATA,1)
         dist = [];
         C =[];
         for j=1:size(Ab,1)
            dist(j) = euclidian(DATA(i,:),Ab(j,:)); 
         end
         [d, J] = min(dist);
         C = Ab(J,:);

         %fit(J) = f(d);
         [AbC, fff] = clone_mut_select_clusteringAlt(C,Nc,beta,fit(J),xmin,xmax,ymin,ymax,f, DATA(i,:));
         Ab = [Ab; AbC];

         fit = [fit; fff];
      end
% Immune Network Interactions After a Number of Iterations
      if rem(it,5) == 0,
         if abs(1-avfitold/avfit) < .001,
            [Ab, fit] = suppress(Ab,ts,f, fit);
         end;
      end;

      [Ab, fit] = kill(Ab,fit);

% Insert randomly generated individuals
      d = round(.4*N);
      Ab1 = xmin + rand(d,1).*(xmax - xmin);
      Ab2 = ymin + rand(d,1).*(ymax - ymin);
      Ab = [Ab;Ab1,Ab2];
      fit = [fit; zeros(size(Ab1,1),1)];
% Evaluating Fitness
      %fit = eval(f); 
      %fit = f(Ab);
      
      %fit = calcFitness(Ab, DATA, f, ts);
      %[fit, Ab] = calcFitnessAlt(Ab, DATA, f);

      

      %fit = calcFitness(Ab, DATA, f, ts);
      avfitold = avfit; 
      avfit = mean(fit);
      it = it + 1;
       
      resultado = storeInfo_clustering(Ab, resultado, it);

   end;
   [Ab, fit] = kill(Ab,fit);
   %[Ab, fit] = suppress(Ab,1,f, DATA, fit);
   
   %[fit, Ab] = calcFitnessAlt(Ab, DATA, f);
   D = disT(Ab);
   %fit = calcFitness(Ab, DATA, f, ts);
   resultado = storeInfo_clustering(Ab, resultado, it);
end
