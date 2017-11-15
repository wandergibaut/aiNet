%% Schaffer function solver via aiNet

%f =  @(x)@(y) -0.5 - ((sin(sqrt((x-1)^2 + (y-1)^2))^2 - 0.5)/(1 + 0.001((x-1)^2 + (y-1)^2))^2)
%f = @(V) -0.5 - ((sin(sqrt((V(:,1)-ones(size(V(:,1)))).^2 + (V(:,2)-ones(size(V(:,2)))).^2)).^2 - 0.5)./(1 + 0.001*((V(:,1)-ones(size(V(:,1)))).^2 + (V(:,2)-ones(size(V(:,2)))).^2)).^2);

%f = @(V) 1/(sum(sqrt((V(:,1) - V(:,3)).^2 + (V(:,2) - V(:,4)).^2)));
f = @(d) 1 - d/(30*sqrt(2));

%adicionado
r = 0.1;

%ts = 0.04; 
ts = 0.001;
gen = 5;
vmin = 0;
vmax = 30;
N = 200;
Nc = 10;
beta = 2;

load('d31.mat');

%alterado
options.limites = [0 30];

%for i=1:10
    [Ab, D, resultado] = aiNetClusteringAlt(ts,f,N,Nc,beta,gen, vmin, vmax, dados);
    %plotaResultadoAiNet(resultado, options);
    %ARIA_plot(Ab,dados,ones(size(Ab,1),0.01));
    ai_plot(Ab, dados);
    E = mst(Ab,D);
    plot_mst(Ab,E);


     name = strcat('aiNet_runX_',int2str(i),'.mat');
     save(name,'resultado');
    
%end

%[Ab, resultado] = aiNet(ts,f,N,Nc,beta,gen, vmin, vmax);
%plotaResultadoAiNet(resultado, f, options);

