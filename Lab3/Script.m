clear all;
A = 1;
B = 0;
C = 1;
D = 0;
IC = exp(1); 

Step = 1;
SimTime=5;
Time = 0:0.1:SimTime;
Signals = 0:0.1:SimTime;

u_t = [Time',Signals'];


B=0;
C=1;
D=0;

A = -3;

a = sim('Lab3');
DiscreteExp(a,A,Time,IC);

%2 A = -1
A = -1;
a = sim('Lab3');
DiscreteExp(a,A,Time,IC);

%A in (-1;0)
A = -0.5;
a = sim('Lab3');
DiscreteExp(a,A,Time,IC);

%A = 0
A = 0;
a = sim('Lab3');
DiscreteExp(a,A,Time,IC);

%A in (0;1)
A = 0.5;
a = sim('Lab3');
DiscreteExp(a,A,Time,IC);
%A = 1
A = 1;
a = sim('Lab3');
DiscreteExp(a,A,Time,IC);
%A > 1
A = 3;
a = sim('Lab3');
DiscreteExp(a,A,Time,IC);

% Matrix analysis %
A = eye(2);
B = [0;1];
C = eye(2);
D = [0;0];
IC = 5;
a = sim('Lab3');

%scatter(a.simout.Time,a.simout.Data(:,2),'filled');
grid

I=5;  %Illia
N=9;  %Bannitsyn

A=[0,1;-I,-N];


%3 kapitalizacja odsetek
B=0;
C=1;
D=0;

IC =10; %poczatkowy kapital
r=0.03; % nominalna stopa procentowa
n=4 % czas trwania inwestycji

m=4; %liczba kapitalizacji w roku

Step=1/m;
SimTime=n;
A= (1+r/m)^(m*n); 
a = sim('Lab3');
Discrete(a,'r');
legend
m=2; 

Step=1/m;
SimTime=n;
A= (1+r/m)^(m*n); 
a = sim('Lab3');
Discrete(a,'g');

m=1; 
Step=1/m;
SimTime=n;
A= (1+r/m)^(m*n); 
a = sim('Lab3');
Discrete(a,'b');
hold off;
legend('Kapitalizacji w roku: 4','Kapitalizacji w roku: 2','Kapitalizacji w roku: 1');

disp('Press any key ...')
pause;


%Newton-Raphson

prompt = 'Podaj punkt poczatkowy (x0): ';
x=input(prompt);


f=@(x) cos(x)-3*x+1;

df=@(x) -sin(x)-3;
a=-1; b=1;

MaxIterations=1000;
 
for i=1:1:MaxIterations
x1=x-(f(x)/df(x));
x=x1;
end
sol=x;
fprintf('Pierwiastek:  %.15f',sol)









