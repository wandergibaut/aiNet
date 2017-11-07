function plotMeanMaxFit(resultado,gen,f)
  
  pop_it=resultado.pop_it;
  x_it=resultado.x_it;
  
  pop_it=resultado.pop_it;
  
  for i=1:size(pop_it,2)
    meanFit(i) = mean(f(pop_it{i}));
  end
  
  
  
  
  figure;
  xValues = linspace(1,gen,gen);
  plot(xValues,f(x_it),'color','blue');
  title('Best Fitness over Generations');
  xlabel('generation'); % x-axis label
  ylabel('best fitness'); % y-axis label
  
  figure;
  plot(xValues,meanFit,'color','red');
  title('Mean Fitness over Generations')
  xlabel('generation') % x-axis label
  ylabel('mean fitness') % y-axis label
  
  
  
end