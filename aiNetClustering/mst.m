%% Minimum Spanning Tree (MST) - Prim's Algorithm
%Input: X - nodes of graph (Nxdim)
%       W - weight of connections (NxN)
%Output: E - edges selected (matrix (N-1)x2)

function E = mst(X,D)

%number of nodes
N = length(X(:,1));
%vector that indicates if the node has been selected
v = zeros(1,N); v(1) = 1; E = [];

%until we have all nodes inserted
for k=2:N,
    MIN = 1e20;
    %search the minimum weighted edge that connects an marked node to one unmarked
    for j=1:N,
        %if j-th node is in MST
        if (v(j) == 1),
            %test all edges from j-th node (keeps the minimum)
            for m=1:N,
                %select minimum weighted edge
                if (v(m) == 0 && D(j,m) < MIN),
                    %update index, minimum value and edge 
                    new = m; MIN = D(j,m); edge = [j,m];
                end
            end
        end
    end
    %inserts the node indicated by new
    v(new) = 1; E = [E;edge];
end
