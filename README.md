# LMI-Based_Distributed_Controller_Design_with_Non-Block-Diagonal_Lyapunov_Functions

This repository presents the simulation codes for the numearical experiments in the following paper:

>> Y. Watanabe, S.  Fushimi, and K. Sakurama, “Convex reformulation of LMI-based distributed controller design
with a class of non-block-diagonal Lyapunov functions,” arXiv preprint arXiv:2404.04576, 2024.
https://arxiv.org/abs/2404.04576

One has to prepare MATLAB with an appropriate version, YALMIP, and some SDP solver (e.g., SDPT3 and SeDuMi).
Simulation results and figures under the same setting as the above paper can be generated by running 'sim_for_manuscript.m'.
If one wants to run a single simulation, run 'parameters.m' and 'test.m' in turn.

Note that several codes ('generate_SXlessS.m' and 'Hinfty_SI.m') are based on the paper (Sparsity Invariance for Convex Design od Distributed Controllers, by by Luca Furieri, Yang Zheng, Antonis Papachristodoulou, Maryam Kamgarpour, IEEE Transactions on Control of Network Systems, 2020) and the repository (https://github.com/FurieriLuca/Sparsity-Invariance).