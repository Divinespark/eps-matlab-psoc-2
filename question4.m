clear;

syms H;%Clarify the various 
A = [-5/H, -0.4565/H; 377, 0];%The state matrix H
landr = eig(A);%The eigenvalues of the state matrix are given by
Wn = sqrt(377*0.4563/H);%Calculate the undamped natural frequency and damping ratio
thon = 5./(2*H*Wn);
H = 2:0.1:10;%Diifferent values of H

%Calculate the requierd results for different values of H
eigen = eval(subs(landr));
damF = eval(subs(Wn*sqrt(1-thon.^2)))/(2*pi);
damR = eval(subs(thon));
undamF = Wn/(2*pi);
%PLOT THE EIGENVALUE
plot(eigen(1,:),'r')
hold on
text(real(eigen(1,1)),imag(eigen(1,1))+0.5,'(H=2)','color','r')
hold on
plot(eigen(2,:),'r')
hold on
text(real(eigen(1,81)),imag(eigen(1,81))+0.5,'(H=10)','color','r')
xlabel('real');
ylabel('imag');
