f = @(V) -0.5 - ((sin(sqrt((V(:,1)-ones(size(V(:,1)))).^2 + (V(:,2)-ones(size(V(:,2)))).^2)).^2 - 0.5)./(1 + 0.001*((V(:,1)-ones(size(V(:,1)))).^2 + (V(:,2)-ones(size(V(:,2)))).^2)).^2);
gen = 50;
for i=1:10
    name = strcat('aiNet_runX_',int2str(i),'.mat');
    load(name);
    
    plotMeanMaxFit(resultado,gen,f,i)
    
end