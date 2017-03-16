function C = Gershg(A)
% aceasta functie ploteaza discurile Gershgorin pentru o matrice
d = diag(A);
cx = real(d);
cy = imag(d);
B = A - diag(d);
n= size(A);
%sum(matrice) intoarce intr-un vector suma elementelor pe coloana
% si de aceea trebuie sa transpunem matricea, pentru a calcula suma pe
% linie
r = sum(abs(B'))
%daca elementele de pe diagonala matricei sunt reale, atunci vectorul cy este vector de
%zerouri
C = [cx cy r(:)]
t = 0:pi/100:2*pi;
[v,d] = eig(A);
d = diag(d);
% in vectorul u1 se memoreaza partile reale ale valorilor proprii
% in vectorul u2 se memoreaza coeficientii partilor imaginare ale valorilor proprii
u1 = real(d);
v1 = imag(d);
hold on
%vrem sa apara si gridul/grila pe sistemul de axe
grid on
set(gca,'ylim',[-40 40])
set(gca,'xlim',[-40 40])


%scaleaza  axele a.i. unitatea de masura sa fie aceeasi axis
ylabel('Im')
%se ploteaza cu cerculete (o) rosii (r) valorile proprii
valpro = plot(u1,v1,'or');
hold off
%setam grosimea liniei la 1.4 pt
set(valpro,'LineWidth',1.4)
c = cos(t);
s = sin(t);
for i=n:-1:1
x = zeros(1,length(t));
y = zeros(1,length(t));
%scriem ecuatia cercului in coordonate polare
x = cx(i) + r(i)*c;
y = cy(i) + r(i)*s;

% color = rand;
hold on
disc_g = fill(x,y,[rand, rand, rand]);

%setam grosimea liniei la 1.1 pt
set(disc_g,'LineWidth',1.1)

end
hold off



title('Discurile Gershgorin si valorile proprii pentru matricea A')
