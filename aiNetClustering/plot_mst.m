%% plot the minimum spanning tree
function plot_mst(Ab,E)

figure();
%extracts number of edges 
N = length(E(:,1));
%plot the nodes
plot(Ab(:,1),Ab(:,2),'b*'); hold on
%inserts the N edges
for k=1:N,
    line([Ab(E(k,1),1) Ab(E(k,2),1)],[Ab(E(k,1),2) Ab(E(k,2),2)])
end
title('Minimum spanning tree');