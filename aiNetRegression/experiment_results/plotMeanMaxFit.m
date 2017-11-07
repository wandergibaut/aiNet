function plotMeanMaxFit(resultado,gen,f,run)
  
  pop_it=resultado.pop_it;
  x_it=resultado.x_it;
  
  pop_it=resultado.pop_it;
  
  for i=1:size(pop_it,2)
    meanFit(i) = mean(f(pop_it{i}));
  end
  
  
  
  
  figure;
  xValues = linspace(1,gen,gen);
  plot(xValues,f(x_it),'color','blue');
  ti=strcat('Best Fitness over Generations for the run number: ',int2str(run));
  title(ti);
  xlabel('generation'); % x-axis label
  ylabel('best fitness'); % y-axis label
  
  figure;
  plot(xValues,meanFit,'color','red');
  tI=strcat('Mean Fitness over Generations for the run number: ',int2str(run));
  title(tI);
  xlabel('generation') % x-axis label
  ylabel('mean fitness') % y-axis label
  
  
  
end