%% run 

gamma_result = [];
stab_result = [];


%%%%%%%%% --------------- start ---------------

% % H infty
% proposed method:
[gamma_opt_proposed_0,K_opt_proposed_0,P_opt_proposed_0] = Hinfty_proposed0(params,0);

% proposed method v2:
[gamma_opt_proposed_0_v2,K_opt_proposed_0_v2,P_opt_proposed_0_v2] = Hinfty_proposed0_v2(params,0);

% SI
[gamma_opt_SI,K_opt_SI,P_opt_SI] = Hinfty_SI(params,0);

% block-diagonal relaxation:
[gamma_opt_diag,K_opt_diag,P_opt_diag] = Hinfty_diag(params,0);

% centralized controllr:
[gamma_opt_cen,K_opt_cen,P_opt_cen] = Hinfty_centralized(params,0);


gamma_result = [gamma_opt_proposed_0,gamma_opt_proposed_0_v2,gamma_opt_SI,gamma_opt_diag,gamma_opt_cen];
stab_result = [check_stab(params,K_opt_proposed_0),check_stab(params,K_opt_proposed_0_v2),check_stab(params,K_opt_SI),check_stab(params,K_opt_diag),check_stab(params,K_opt_cen)];

function output = check_stab(params,K)
    output =  max(real(eig( params.A+params.B*K )));
end