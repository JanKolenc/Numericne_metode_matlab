M = load('marketcap.csv') %load, nujno v ''
%plot(1:size(M,1),M(:4), 1:size(M,1), M(:,6));
%legend('Microsoft', 'Apple', 'Google')

m = size(M,1); %velikost tvojega seznama/vektora
C = zeros(m,1);%zaenkrat prazen vektor vsot kapitalizacije
C(1) = sum(M(1,4:end)); %zacenta kapitalizacija
I = [1000; zeros(m-1,1)]; %zaenkrat prazen vektor, ki ti bo izpisoval indekse. tukaj je zacetni indeks 1000.
Ifloor = I; %enak I-ju, razlika je sam v tem kako bos zaokrozeval te racune. tle sam pripravs za naslednji korak
Iceil = I; %enak I-ju, razlika je sam v tem kako bos zaokrozeval te racune. tle sam pripravs za naslednji korak
Iround = I; %enak I-ju, razlika je sam v tem kako bos zaokrozeval te racune. tle sam pripravs za naslednji korak
for d = 2:m; %zanka ki ti bo sestevala/mnozila indekse glede na formulo k jo mas podano
    C(d) = sum(M(d,4:end)); %vsota kapitalizacije za dolocen dan za vsa podjetja na borzi
    r = C(d) / C(d-1); %razlika od prejsnje meritve ( za koliko se je kapitalizacija spremnenila od zadnje meritve
    I(d) = I(d-1)*r %tukej ti matlab sam računa brez zaokrozevanja
    Ifloor(d) = Ifloor(d-1)*floor(r*1000)/1000; %zaokrozevanje na dol
    Iceil(d) = Iceil(d-1)*ceil(r*1000)/1000; %zaokrozevanje na gor
    Iround(d) = Iround(d-1)*round(r*1000, 3)/1000; %zaokorozevanje na odvisno od 4 decimalke, tk je nastiman po defaultu
end
%za odgovore tukaj ko mas zadnji dan lohk uporabljas ukaz end, al pa s funkcijo st_dneva spodaj ugotovis na kateri cifri je tvoj dan ki te zanima in pol
%tk vneses notr: I(45) al pa I(end)
plot(1:m, I, 1:m, Ifloor, 1:m, Iceil, 1:m, Iround) %graf indeksov, tuki skoz pises plot(x1,y1,x2,y2,...xn,yn) x1 je od kje do kje gre x, y pa ponavad kot funkcija oz vrednosti
%stevilka dneva:
st_dneva = 0;
for i =size(M,1); %koliko i-jev naj pregleda
    if M(i,1) == 2015; %naprej so obicni pogoji, k ti najprej pogleda ce je taprav let, pol mesec, pol pa dan.
        if M(i,2) == 12;
            if M(i,3) == 31;
                st_dneva = i;
            end
        end
    end
end

I(st_dneva)
Ifloor(st_dneva)
Iceil(st_dneva)
Iround(st_dneva)

