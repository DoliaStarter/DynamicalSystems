%Forostianyi Bohdan

clear all
gcf = figure();
set(gcf, 'Position',  [100, 100, 700, 700])

SimTime=10;



%zad 2 
H = tf([0 0 1],[1 1 2]);
nyquist(H)
pause;


H = tf([0 1 0],[1 -0.1 1]);
nyquist(H)
pause;

%zad 3

H = tf([0 1],[4 1 ]);
bode(H)
pause;

H = tf([0.4 0],[0.4 1]);
bode(H)
pause;

H = tf([0 1 0],[1 2 1]);
bode(H)
pause;

H = tf([0 0 1],[1 0.1 1]);
bode(H)
pause;



FreqV = [0.001,1,30,0.01,5];
PhV = [1,5,2,1,0];
AV = [2,3,1,2,4];




Numerator=[0 1];
Denominator=[4 2];
for i = 1:length(FreqV)
Freq = FreqV(i);
Ph = PhV(i);
A = AV(i);
a = sim('Lab_4');
plotData(a.sim_in,a.sim_out,'k',"Filter dolnoprzepustowy Czestotliwosc="+FreqV(i),'Sygnal wejsciowy','Sygnal wyjsciowy');
end

Numerator=[0.4 0]
Denominator=[0.4 1]
for i = 1:length(FreqV)
Freq = FreqV(i);
Ph = PhV(i);
A = AV(i);
a = sim('Lab_4');
plotData(a.sim_in,a.sim_out,'k',"Filter gornoprzepustowy Czestotliwosc="+FreqV(i),'Sygnal wejsciowy','Sygnal wyjsciowy');
end
    
Numerator=[1 0]
Denominator=[1 2 1]
for i = 1:length(FreqV)
Freq = FreqV(i);
Ph = PhV(i);
A = AV(i);
a = sim('Lab_4');
plotData(a.sim_in,a.sim_out,'k',"Filter psamoprzepustowy Czestotliwosc="+FreqV(i),'Sygnal wejsciowy','Sygnal wyjsciowy');
end
    
Numerator=[0 1]
Denominator=[1 0.1 1]
for i = 1:length(FreqV)
Freq = FreqV(i);
Ph = PhV(i);
A = AV(i);
a = sim('Lab_4');
plotData(a.sim_in,a.sim_out,'k',"Filter drugiego rzedu Czestotliwosc="+FreqV(i),'Sygnal wejsciowy','Sygnal wyjsciowy');
end



disp('Suma sygnalow')
Numerator=[0 1]
Denominator=[4 1]

a = sim('FilterSum');
plotDataTiled(a.sim_in,a.sim_out,'k',"Filter dolnoprzepustowy Czestotliwosc="+FreqV(i),'Sygnal wejsciowy','Sygnal wyjsciowy');

Numerator=[0.4 0]
Denominator=[0.4 1]

a = sim('FilterSum');
plotDataTiled(a.sim_in,a.sim_out,'k',"Filter gornoprzepustowy Czestotliwosc="+FreqV(i),'Sygnal wejsciowy','Sygnal wyjsciowy');
   
Numerator=[1 0]
Denominator=[1 2 1]

a = sim('FilterSum');
plotDataTiled(a.sim_in,a.sim_out,'k',"Filter pasmoprzepustowy Czestotliwosc="+FreqV(i),'Sygnal wejsciowy','Sygnal wyjsciowy');

Numerator=[0 1]
Denominator=[1 0.1 1]
a = sim('FilterSum');
plotDataTiled(a.sim_in,a.sim_out,'k',"Filter drugiego rzedu Czestotliwosc="+FreqV(i),'Sygnal wejsciowy','Sygnal wyjsciowy');





Numerator=[3 3];
Denominator=[1 2 21];

%Zadanie 1
SimTime = 10;
FreqV = [1,5,10,15];
PhV = [0,pi/3,pi/4,pi/2];
AV =  [1,2,3,4];
colors = ['r','g','b','k'];

% Zmiana czestotliwosci
disp('Chaging frequency')
for i = 1:length(FreqV)
    Freq = FreqV(i)
    Ph = PhV(1)
    A = AV(1)
    a = sim('Lab_4');
    plotDataTiled(a.sim_in,a.sim_out,'k','Zmiana czestotliwosci','Sygnal wejsciowy','Sygnal wyjsciowy');
end
%Zmiany fazy
disp('Chaging phase')
for i = 1:length(PhV)
    Freq = FreqV(1);
    Ph = PhV(i);
    A = AV(1);
    a = sim('Lab_4');
    plotDataTiled(a.sim_in,a.sim_out,'k','Zmiana fazy','Sygnal wejsciowy','Sygnal wyjsciowy');
end
%Zmiany amplitudy
disp('Chaging amplitude')
for i = 1:length(AV)
    Freq = FreqV(1);
    Ph = PhV(1);
    A = AV(i);
    a = sim('Lab_4');
    plotDataTiled(a.sim_in,a.sim_out,'k','Zmiana amplitudy','Sygnal wejsciowy','Sygnal wyjsciowy');
end






%Zadanie 4. Zamodelowany filtr
A=1;
Ph=0;
Cutoff = sqrt(length('Forostianyi')^2 + length('Bohdan')^2); 
% Cutoff frequency for low-pass RC filter = 1/RC. => R * C = 0.1 * Cutoff
R = 1/Cutoff;
C = 1;
Numerator=[0 1];
Denominator=[R*C 1];

disp('Frequency lower, than cutoff.Amplitude should be the same')
Freq = Cutoff/2;
a = sim('Lab_4');
plotData(a.sim_in,a.sim_out,'k',"Zamodelowany filtr",'Sygnal wejsciowy','Sygnal wyjsciowy');

disp('Now we on cutoff frequency. We should see, that output amplitude equals to ~0.7 of input ampitude')
Freq=Cutoff;
a = sim('Lab_4');
plotData(a.sim_in,a.sim_out,'k',"Zamodelowany filtr",'Sygnal wejsciowy','Sygnal wyjsciowy');

disp('Now we increase frequency, and see that amplitude reduced');
Freq = Cutoff*2;
a = sim('Lab_4');
plotData(a.sim_in,a.sim_out,'k',"Zamodelowany filtr",'Sygnal wejsciowy','Sygnal wyjsciowy');
