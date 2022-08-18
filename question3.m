clear; 

syms Kd;%Clarify the various Kd
A = [-0.125*Kd, -0.114; 377, 0];%The state matrix
landr = eig(A);%The eigenvalues of the state matrix are given by
Kd = -10:0.1:10;%Diifferent values of Kd


%Calculate the undamped natural frequency and damping ratio
Wn = sqrt(377*0.114);
thon = (0.125*Kd)/(2*Wn);

%Calculate the requierd results for different values of Kd
eigen = eval(subs(landr));
damF = eval(subs(Wn*sqrt(1-thon.^2)))/(2*pi);
damR = eval(subs(thon));
undamF = Wn/(2*pi);

%PLOT THE EIGENVALUE
plot(eigen(1,:),'r')
hold on
text(real(eigen(1,1)),imag(eigen(1,1))+0.5,'(Kd=-10)','color','r')
hold on
plot(eigen(2,:),'r')
hold on
text(real(eigen(1,201)),imag(eigen(1,201))+0.5,'(Kd=10)','color','r')
xlabel('real');
ylabel('imag');

