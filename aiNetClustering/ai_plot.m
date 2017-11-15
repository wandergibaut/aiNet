%ARIA: display of results
%Input: Ab - set of antibodies (Nxdim)
%       Ag - set of antigens (Mxdim)
%       R - radius of each antibody
%OBS: dim must be equal to 1 or 2

function ai_plot(Ab,Ag)

%extract dimensions of Ab
[N,dim] = size(Ab);
%extract number of antigens
M = length(Ag(:,1));
%check if data dimension is 1
if dim == 1
    %y coordinate is assumed to be zero
    Ag = [Ag zeros(M,1)]; Ab = [Ab zeros(N,1)];
end
%plot set of antigens Ag
plot(Ag(:,1),Ag(:,2),'b.'); hold on;
%plot Ab set of antibodies Ab
plot(Ab(:,1),Ab(:,2),'ro');
end