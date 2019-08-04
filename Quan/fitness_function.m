function out = fitness_function(in)

options = struct('KernelType','Gaussian','t',in);

images = loadMNISTImages('train-images-idx3-ubyte');

x00 = images(1:784,2);x01 = images(1:784,22);x02 = images(1:784,35);x03 = images(1:784,38);x04 = images(1:784,52);
x05 = images(1:784,57);x06 = images(1:784,64);x07 = images(1:784,69);x08 = images(1:784,70);x09 = images(1:784,76);

x10 = images(1:784,4);x11 = images(1:784,7);x12 = images(1:784,9);x13 = images(1:784,15);x14 = images(1:784,24);
x15 = images(1:784,25);x16 = images(1:784,41);x17 = images(1:784,60);x18 = images(1:784,68);x19 = images(1:784,71);

x20 = images(1:784,6);x21 = images(1:784,17);x22 = images(1:784,26);x23 = images(1:784,29);x24 = images(1:784,77);
x25 = images(1:784,83);x26 = images(1:784,110);x27 = images(1:784,121);x28 = images(1:784,123);x29 = images(1:784,144);

x30 = images(1:784,8);x31 = images(1:784,11);x32 = images(1:784,13);x33 = images(1:784,28);x34 = images(1:784,31);
x35 = images(1:784,45);x36 = images(1:784,50);x37 = images(1:784,51);x38 = images(1:784,75);x39 = images(1:784,87);

x40 = images(1:784,3);x41 = images(1:784,10);x42 = images(1:784,21);x43 = images(1:784,27);x44 = images(1:784,54);
x45 = images(1:784,59);x46 = images(1:784,61);x47 = images(1:784,62);x48 = images(1:784,65);x49 = images(1:784,90);

x50 = images(1:784,1);x51 = images(1:784,12);x52 = images(1:784,36);x53 = images(1:784,48);x54 = images(1:784,66);
x55 = images(1:784,101);x56 = images(1:784,133);x57 = images(1:784,146);x58 = images(1:784,174);x59 = images(1:784,176);

x60 = images(1:784,14);x61 = images(1:784,19);x62 = images(1:784,33);x63 = images(1:784,37);x64 = images(1:784,40);
x65 = images(1:784,63);x66 = images(1:784,67);x67 = images(1:784,74);x68 = images(1:784,84);x69 = images(1:784,91);

x70 = images(1:784,16);x71 = images(1:784,30);x72 = images(1:784,39);x73 = images(1:784,43);x74 = images(1:784,53);
x75 = images(1:784,72);x76 = images(1:784,80);x77 = images(1:784,85);x78 = images(1:784,92);x79 = images(1:784,97);

x80 = images(1:784,18);x81 = images(1:784,32);x82 = images(1:784,42);x83 = images(1:784,47);x84 = images(1:784,56);
x85 = images(1:784,86);x86 = images(1:784,95);x87 = images(1:784,98);x88 = images(1:784,125);x89 = images(1:784,138);

x90 = images(1:784,5);x91 = images(1:784,20);x92 = images(1:784,23);x93 = images(1:784,34);x94 = images(1:784,44);
x95 = images(1:784,46);x96 = images(1:784,49);x97 = images(1:784,55);x98 = images(1:784,58);x99 = images(1:784,81);

new_data_mnist = [x00,x01,x02,x03,x04,x05,x06,x07,x08,x09,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31,x32,x33,x34,x35,x36,x37,x38,x39,x40,x41,x42,x43,x44,x45,x46,x47,x48,x49,x50,x51,x52,x53,x54,x55,x56,x57,x58,x59,x60,x61,x62,x63,x64,x65,x66,x67,x68,x69,x70,x71,x72,x73,x74,x75,x76,x77,x78,x79,x80,x81,x82,x83,x84,x85,x86,x87,x88,x89,x90,x91,x92,x93,x94,x95,x96,x97,x98,x99];
new_data_labels_mnist = [0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6,6,7,7,7,7,7,7,7,7,7,7,8,8,8,8,8,8,8,8,8,8,9,9,9,9,9,9,9,9,9,9];

[eigvec, eigval] = peiyan_kpca(new_data_mnist',options);

number_of_pc = 10;

data = new_coordination_kpca(new_data_mnist,eigvec,eigval,number_of_pc,options);

z = zeros(784,100);

% Run the peiyan_kernel_linear_regression.m function

for c = 1:784
    z(c,:) = peiyan_kernel_linear_regression(data,new_data_mnist(c,:),data,options);
end

%out = immse(new_data_mnist,z);
[output, ssim_map] = ssim_index(z,new_data_mnist);
out = 1-output;