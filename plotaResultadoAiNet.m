function []=plotaResultadoPSO_v2(resultado,fun,options)
% Entradas da Fun��o:
%   resultado: estrutura contendo os resultados
%           resultado.totalIt: # total de itera��es
%           resultado.pop_it: matriz contendo as posi��es de cada part�cula
%                             em cada uma das itera��es (cada par de vetor
%                             colunas corresponde a uma itera��o)
%           resultado.x_it: matriz contendo a melhor posi��o (solu��o) de
%                             cada itera��o (cada linha corresponde a uma itera��o)
%           resultado.x:   vetor linha de dimens�o 2, corresponde a melhor
%                             solu��o encontrada pelo algoritmo
%
%   fun: um function_handle contendo a fun��o a ser plotada:
%        exemplo:
%                   fun=@(a)-((a(1)-1)^2+(a(2)-1)^2);
%
%  options: estrutura contendo as op��es
%           options.limites: [lmin lmax] -> limites m�nimo e m�ximo do
%                            gr�fico
%           


maxIt=resultado.totalIt;
lim=options.limites;

x=linspace(lim(1),lim(2),200);
y=linspace(lim(1),lim(2),200);
[X,Y] = meshgrid(x,y);

for i=1:200
    for j=1:200
        a=[x(i) y(j)];
        F(i,j)=fun(a);
    end
end

figura=figure('Position', [900    300    1000    400]);

figura3d=subplot(1,2,1);
superficie=surf(x,y,F,'EdgeColor','none');
alpha(superficie,0.3)
hold
colormap(parula)
% savefig(Figura,['funcao3d.fig']);


figura2d=subplot(1,2,2);

contourf(x,y,F,50,'EdgeColor','none')
hold
colormap(parula)
colorbar
axis([-10 10 -10 10])
pbaspect([1 1 1])
xticks([-10 -8 -6 -4 -2 0 1 2 4 6 8 10])
yticks([-10 -8 -6 -4 -2 0 1 2 4 6 8 10])
grid
% savefig(Figura,['funcao2d.fig']);


pop_it=resultado.pop_it;
x_it=resultado.x_it;

%for i=1:maxIt
%  N(i) = size(pop_it{i});
%end
%N=size(pop_it,2);
%N=size(pop_it,2);

%modificar
%ind=round(linspace(1,N-1,maxIt));

%mod
x1=pop_it{1}(:,1);
x2=pop_it{1}(:,2);

X1=x_it(1,1); X2=x_it(1,2);

subplot(figura2d)
plot(x1,x2,'.','color',[0 0 0]);
part2d=plot(x1,x2,'.','color',[0.8 0 0]);
melhor2d=plot(X1,X2,'*','color',[1 0 0]);

title(['Itera��o: 1']);

subplot(figura3d)
for j=1:max(size(x1))
    f(j)=fun([x1(j),x2(j)]);
end
F=fun([X1,X2]);
plot3(x1,x2,f,'.','color',[0 0 0]);
part3d=plot3(x1,x2,f,'.','color',[0.8 0 0]);
melhor3d=plot3(X1,X2,F,'*','color',[1 0 0]);
title(['Itera��o: 1']);

pause(0.1)    
%modificar
for i=1size(pop_it)
%for i=2:size(ind,2)

%    x1=pop_it{ind(i)}(:,1);
%    x2=pop_it{ind(i)}(:,2);

    x1=pop_it{i}(:,1);
    x2=pop_it{i}(:,2);

    X1=x_it(i,1); X2=x_it(i,2);

    for j=1:max(size(x1))
        f(j)=fun([x1(j),x2(j)]);
    end

    F=fun([X1,X2]);

    set(part2d,'XData',x1,'YData',x2);
    set(melhor2d,'XData',X1,'YData',X2);
    set(part3d,'XData',x1,'YData',x2,'ZData',f);
    set(melhor3d,'XData',X1,'YData',X2,'ZData',F);
    subplot(figura2d)
    title(['Itera��o: ',num2str(i)]);
    subplot(figura3d)
    title(['Itera��o: ',num2str(i)]);
    pause(0.1)


end

subplot(figura2d)
x_sol=resultado.x;
plot(x_sol(1),x_sol(2),'r*')

subplot(figura3d)
plot3(x_sol(1),x_sol(2),fun([x_sol(1),x_sol(2)]),'r*')
    

