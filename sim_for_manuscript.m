clear all;
num_sim = 50;

gamma_result_hist = zeros(num_sim,5);
stab_result_hist = zeros(num_sim,5);

for iii = 1:num_sim
    parameters;
    test
    gamma_result_hist(iii,:) = gamma_result;
    stab_result_hist(iii,:) = stab_result;
end

%% 
for ll = 1:num_sim
    for lll = 1:4
        if stab_result_hist(ll,lll)>=0
            gamma_result_hist(ll,lll) = 10^8;
        else
            gamma_result_hist(ll,lll) = gamma_result_hist(ll,lll)/gamma_result_hist(ll,5);
        end
    end
end

%% 
clf;

ms = 10;
%% 
ran = 1:num_sim;
% semilogy(ran,gamma_result_hist(:,5),'LineStyle','none','MarkerSize',20,'Marker',"pentagram",'MarkerFaceColor','k');
% hold on

semilogy(ran,gamma_result_hist(:,1),'LineStyle','none','MarkerSize',15,'Marker','o','MarkerFaceColor','r');
hold on
semilogy(ran,gamma_result_hist(:,2),'LineStyle','none','MarkerSize',15,'Marker',"pentagram",'MarkerFaceColor','g');

semilogy(ran,gamma_result_hist(:,3),'LineStyle','none','MarkerSize',13,'Marker','square','MarkerFaceColor','b');
semilogy(ran,gamma_result_hist(:,4),'LineStyle','none','MarkerSize',8,'Marker',"diamond",'MarkerFaceColor','c');

hold off

xlabel('Sample number')
ylabel('$\gamma_*/\gamma_\mathrm{*,cen}$','Interpreter', 'latex','FontSize',20)


yticks([0.1 1 10 10^2 10^3 10^4 10^5 10^6 10^8])
yticklabels({" " "1", "10", "10^2", "10^3", "10^4", "10^5", "10^6","fail"})


% legend('proposed method 1','proposed method 2','SI-based relaxation','block-diagonal relaxation')
legend('proposed method 1','proposed method 2','SI-based relaxation','block-diagonal relaxation')