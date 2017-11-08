%ARIA: display of results
%Input: Ab - set of antibodies (Nxdim)
%       Ag - set of antigens (Mxdim)
%       R - radius of each antibody
%OBS: dim must be equal to 1 or 2

function ARIA_plot(Ab,Ag,R)

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
%angle vector
theta=(-pi:pi/360:pi);
%for each Ab
for i=1:N
    %show the individual recognition area
    x=R(i)*cos(theta); y=R(i)*sin(theta);
    %matrix of translation
    T=[1 0 Ab(i,1);0 1 Ab(i,2); 0 0 0];
    %coordinates of the circle
    C=T*[x;y;ones(1,length(theta))];
    %circle with radius R(i) centered in Ab(i)
    plot(C(1,:),C(2,:),'g');
end
legend('antigen','antibody');
title('ARIA - final prototype configuration');


