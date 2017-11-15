%Ag: antígenos 
%N: número de dados de entrada (antígenos) 
%dim: dimensão dos dados 
%Ab: anticorpos 
%r: raio mínimo 
%E: raio que define a vizinhança para o cálculo da densidade local 
%R: vetor com o raio de cada anticorpo 
%μ: taxa de mutação 
%decaimento: constante de decaimento da taxa de mutação 

function Ab = ARIA(N, Data,r, E, R, mi, deca, gen, vmin, vmax)

   xmin = vmin;
   ymin = vmin;
   xmax = vmax;
   ymax = vmax;

   Ab1 = xmin + rand(N,1).*(xmax - xmin);
   Ab2 = ymin + rand(N,1).*(ymax - ymin);
   Ab = [Ab1,Ab2];
   x = Ab(:,1); y = Ab(:,2);


   it = 1; 
   Nold = N + 1; 
   Nsup = N;

   while it < gen
   	Nd = size(Data,1);

   	for i =1:Nd
   		select_adapt(Ab,Data);

   	end
   	[Ab, clonNI] = supress(Ab,sp); %vetor q indica se foi estimulado ou n
   	clona(clonNI);
   	calc_dens();
   	%atualiza R
   	supress
   	atualizeR();
   	reduce_Mutation();

   end



end