% Number of principle components
number_of_pc = 2;

% New data coordination in the new coordination (2D dimension)
data = new_coordination_kpca(new_data_mnist,eigvec,eigval,number_of_pc,options);

% Plot data in new coordination (2D dimension)
figure;
data_tranpose = data';
sz = 120;
scatter(data_tranpose(1:10,1),data_tranpose(1:10,2),sz,'red'); %0 

hold on;
scatter(data_tranpose(11:20,1),data_tranpose(11:20,2),sz,'green'); %1

hold on;
scatter(data_tranpose(21:30,1),data_tranpose(21:30,2),sz,'blue'); %2 

hold on;
scatter(data_tranpose(31:40,1),data_tranpose(31:40,2),sz,'yellow'); %3 

hold on;
scatter(data_tranpose(41:50,1),data_tranpose(41:50,2),sz,'magenta'); %4 

hold on;
scatter(data_tranpose(51:60,1),data_tranpose(51:60,2),sz,'cyan'); %5 

hold on;
scatter(data_tranpose(61:70,1),data_tranpose(61:70,2),sz,'black'); %6 

hold on;
scatter(data_tranpose(71:80,1),data_tranpose(71:80,2),sz,'black','diamond'); %7


hold on;
scatter(data_tranpose(21:30,1),data_tranpose(21:30,2),sz,'red','*'); %8 

hold on;
scatter(data_tranpose(21:30,1),data_tranpose(21:30,2),sz,'green','diamond'); %9 

legend('0','1','2','3','4','5','6','7','8','9');
