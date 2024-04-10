function [ X ] = generate_SXlessS( S )

%% This code is based on the following paper and GitHub repository:
% Sparsity Invariance for Convex Design od Distributed Controllers, by by Luca Furieri, Yang Zheng, Antonis Papachristodoulou, Maryam Kamgarpour, IEEE Transactions on Control of Network Systems, 2020
% https://github.com/FurieriLuca/Sparsity-Invariance


    % Generate a maximally sparsity-wise invariant (MSI) subplace with respect
% to X
% See Section 3.2 of the following paper
% "Minimizing suboptimality in Distritbued Control: a Framework-Independent Approach"

m = size(S,1);
n = size(S,2);
X = ones(n,n);

% Analytical solution with complexity mn^2
for i = 1:m
    for k = 1:n
        if S(i,k)==0
            for j = 1:n
                if S(i,j) == 1
                    X(j,k) = 0;
                end
            end
        end
    end
end

end

