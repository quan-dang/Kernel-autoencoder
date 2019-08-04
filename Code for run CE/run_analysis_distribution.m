load('quan_mnist.mat');

pcs = 1:50; % 100 principal components
num_kernel_parameters = 11; % 1 is the initial parameter, 1->10 implies to the most tuned parameter
kernel_parameters = best_individuals(1:3:31,:);

distribution = zeros(num_kernel_parameters, size(pcs,2));

for h = 1:size(kernel_parameters,1)  
    for k = 1:size(pcs,2)
        distribution(h,k) = calculate_distribution(k,kernel_parameters(h,:),mnist); 
    end
end

figure
plot(pcs,distribution(1,:),'r');
hold on
plot(pcs,distribution(2,:),'--');
hold on
plot(pcs,distribution(3,:),':'); 
hold on
plot(pcs,distribution(4,:),':');
hold on
plot(pcs,distribution(5,:),'-.');
hold on
plot(pcs,distribution(6,:),'y');
hold on
plot(pcs,distribution(7,:),'m');
hold on
plot(pcs,distribution(8,:),'c');
hold on
plot(pcs,distribution(9,:),'k');
hold on
plot(pcs,distribution(10,:),'g');
hold on
plot(pcs,distribution(11,:),'b');

hold off

title('Distribution of eigenvalues - ten principle components');
xlabel('Number of principle components');
ylabel('Distribution of eigenvalues');
legend('Ini.','Gen.3','Gen.6','Gen.9','Gen.12','Gen.15','Gen.18','Gen.21','Gen.24','Gen.27','Gen.30','Location','northwest')

