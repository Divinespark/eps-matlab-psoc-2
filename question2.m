clear;

syms Kd;%Clarify the various Kd

A = [-0.125*Kd, -0.114; 377, 0];%The state matrix
landr = eig(A);%The eigenvalues of the state matrix are given by
Kd = [0,-10,10];%Diifferent values of Kd
Wn = sqrt(377*0.114);%Calculate the undamped natural frequency and damping ratio
thon = (0.125*Kd)/(2*Wn);

%Calculate the requierd results for different values of Kd
eigen = eval(subs(landr));
damF = eval(subs(Wn*sqrt(1-thon.^2)))/(2*pi);
damR = eval(subs(thon));
undamF = Wn/(2*pi);

%Use 'table' to show the results
kd = Kd';
Eigenvalues1 = eigen(1,:)';
Eigenvalues2 = eigen(2,:)';
Damped_frequency = damF';
Damping_ratio = damR';
Undamped_natural_frequency = [undamF;undamF;undamF];

table(kd,Eigenvalues1,Eigenvalues2,Damped_frequency,Damping_ratio, ...
    Undamped_natural_frequency)