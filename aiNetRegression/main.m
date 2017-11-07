%% Schaffer function solver via aiNet

%f =  @(x)@(y) -0.5 - ((sin(sqrt((x-1)^2 + (y-1)^2))^2 - 0.5)/(1 + 0.001((x-1)^2 + (y-1)^2))^2)
f = @(V) -0.5 - ((sin(sqrt((V(:,1)-ones(size(V(:,1)))).^2 + (V(:,2)-ones(size(V(:,2)))).^2)).^2 - 0.5)./(1 + 0.001*((V(:,1)-ones(size(V(:,1)))).^2 + (V(:,2)-ones(size(V(:,2)))).^2)).^2);

ts = 0.04; 
gen = 50;
vmin = -10;
vmax = 10;
N = 100;
Nc = 100;
beta = 2;

options.limites = [-10 10];

for i=1:10
    [Ab, resultado] = aiNet(ts,f,N,Nc,beta,gen, vmin, vmax);
    plotaResultadoAiNet(resultado, f, options);
    
    name = strcat('aiNet_runX_',int2str(i),'.mat');
    save(name,'resultado');
    
end

%[Ab, resultado] = aiNet(ts,f,N,Nc,beta,gen, vmin, vmax);
%plotaResultadoAiNet(resultado, f, options);

