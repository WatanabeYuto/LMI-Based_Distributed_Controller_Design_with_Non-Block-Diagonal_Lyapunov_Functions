% clear all;

%% define parameters
%%%%%%%%% --------------- start ---------------
params.n = 8; %% the number of nodes 偶数とする
params.d = 1; %% dimension


params.G = generate_graph(params.n,0.4);
plot(params.G);
% system's parametersx

% define A's eigen values (to be stabilizable)
eig_A_real = - rand(params.n/2,1)/2;
eig_A_real = [eig_A_real; eig_A_real];
eig_A_complex = rand(params.n/2,1);
eig_A_complex = [eig_A_complex; - eig_A_complex];
eig_A = complex(eig_A_real, eig_A_complex);

tmp = rand(params.n,params.n);
params.A = tmp - place(tmp,eye(params.n), eig_A); 
tmp = rand(params.n,params.n);
params.A = tmp \ params.A * tmp;


dd = 1;
params.B = diag([ones(params.n-dd,1);zeros(dd,1)]);

params.C = eye(params.n);
params.D = eye(params.n);
%% exogenous noises
params.Bw = eye(params.n);
params.Dw = eye(params.n);

%%%%%%%%% --------------  end  ---------------
fprintf('Rank of the contrability matrix - n:%8.2e \n', rank(ctrb(params.A,params.B))-params.n);


% params.solver_chosens = 'sedumi';
params.solver_chosens = 'sdpt3';