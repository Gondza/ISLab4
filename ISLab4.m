close all
clear all
clc
% Skaiciu pavyzdzio nuskaitymas ir pozymiu skaiciavimas
pavadinimas = 'train_data.jpg';
pozymiai_tinklo_mokymui = pozymiai_raidems_atpazinti(pavadinimas, 5);
% Atpazintuvo kurimas
% pozymiai is celiu masyvo perkeliami i matrica
P = cell2mat(pozymiai_tinklo_mokymui);
% sukuriama teisingu atsakymu matrica: 5 eilutes po 10 skaiciu mokymui
T = [eye(10), eye(10), eye(10), eye(10), eye(10)];
% sukuriamas SBF tinklas duotiems P ir T sarysiams
tinklas = newrb(P,T,0,1,10); %su 9 neuronais jau nebeveikia teisingai, nes maiso devyneta su penketu pirmajam teste

% Tinklo patikra
% skaiciuojamas tinklo isejimas nezinomiems pozymiams
P2 = P(:,11:20);
Y2 = sim(tinklas, P2);
% ieskoma, kuriame isejime gauta didziausia reiksme
[a2, b2] = max(Y2);
% Rezultato atvaizdavimas
% apskaiciuosime skaiciu skaiciu - pozymio P2 stulpelio skaiciu
skaiciu_sk = size(P2,2);
% rezultata saugosime kintamajame 'atsakymas'
atsakymas = [];
for k = 1:skaiciu_sk
    switch b2(k)
        case 1
            atsakymas = [atsakymas, '1'];
        case 2
            atsakymas = [atsakymas, '2'];
        case 3
            atsakymas = [atsakymas, '3'];
        case 4
            atsakymas = [atsakymas, '4'];
        case 5
            atsakymas = [atsakymas, '5'];
        case 6
            atsakymas = [atsakymas, '6'];
        case 7
            atsakymas = [atsakymas, '7'];
        case 8
            atsakymas = [atsakymas, '8'];
        case 9
            atsakymas = [atsakymas, '9'];
        case 10
            atsakymas = [atsakymas, '0'];
    end
end
figure(7), text(0.1,0.5,atsakymas,'FontSize',38), axis off

% Numerio "97531" pozymiu isskyrimas 
pavadinimas = 'test_data_1.jpg';
pozymiai_patikrai = pozymiai_raidems_atpazinti(pavadinimas, 1);
% Skaiciu atpazinimas
% pozymiai is celiu masyvo perkeliami i matrica
P2 = cell2mat(pozymiai_patikrai);
% skaiciuojamas tinklo isejimas nezinomiems pozymiams
Y2 = sim(tinklas, P2);
% ieskoma, kuriame isejime gauta didziausia reiksme
[a2, b2] = max(Y2);
% Rezultato atvaizdavimas
% apskaiciuosime skaiciu skaiciu - pozymiu P2 stulpeliu skaiciu
skaiciu_sk = size(P2,2);
% rezultata saugosime kintamajame 'atsakymas'
atsakymas = [];
for k = 1:skaiciu_sk
    switch b2(k)
        case 1
            atsakymas = [atsakymas, '1'];
        case 2
            atsakymas = [atsakymas, '2'];
        case 3
            atsakymas = [atsakymas, '3'];
        case 4
            atsakymas = [atsakymas, '4'];
        case 5
            atsakymas = [atsakymas, '5'];
        case 6
            atsakymas = [atsakymas, '6'];
        case 7
            atsakymas = [atsakymas, '7'];
        case 8
            atsakymas = [atsakymas, '8'];
        case 9
            atsakymas = [atsakymas, '9'];
        case 10
            atsakymas = [atsakymas, '0'];
    end
end
figure(8), text(0.1,0.5,atsakymas,'FontSize',38), axis off

% Numerio "08642" pozymiu isskyrimas 
pavadinimas = 'test_data_2.jpg';
pozymiai_patikrai = pozymiai_raidems_atpazinti(pavadinimas, 1);
% Skaiciu atpazinimas
% pozymiai is celiu masyvo perkeliami i matrica
P2 = cell2mat(pozymiai_patikrai);
% skaiciuojamas tinklo isejimas nezinomiems pozymiams
Y2 = sim(tinklas, P2);
% ieskoma, kuriame isejime gauta didziausia reiksme
[a2, b2] = max(Y2);
% Rezultato atvaizdavimas
% apskaiciuosime skaiciu skaiciu - pozymiu P2 stulpeliu skaiciu
skaiciu_sk = size(P2,2);
% rezultata saugosime kintamajame 'atsakymas'
atsakymas = [];
for k = 1:skaiciu_sk
    switch b2(k)
        case 1
            atsakymas = [atsakymas, '1'];
        case 2
            atsakymas = [atsakymas, '2'];
        case 3
            atsakymas = [atsakymas, '3'];
        case 4
            atsakymas = [atsakymas, '4'];
        case 5
            atsakymas = [atsakymas, '5'];
        case 6
            atsakymas = [atsakymas, '6'];
        case 7
            atsakymas = [atsakymas, '7'];
        case 8
            atsakymas = [atsakymas, '8'];
        case 9
            atsakymas = [atsakymas, '9'];
        case 10
            atsakymas = [atsakymas, '0'];
    end
end
figure(9), text(0.1,0.5,atsakymas,'FontSize',38), axis off

function pozymiai = pozymiai_raidems_atpazinti(pavadinimas, pvz_eiluciu_sk)
%  pozymiai = pozymiai_raidems_atpazinti(pavadinimas, pvz_eiluciu_sk)
% taikymo pavyzdys:
% pozymiai = pozymiai_raidems_atpazinti('test_data.png', 8) 
%
%
% Vaizdo su pavyzdziais nuskaitymas
V = imread(pavadinimas);
%figure(12), imshow(V)
% Skaiciu iskirpimas ir sudeliojimas i kintamojo 'objektai' celes
V_pustonis = rgb2gray(V);
% vaizdo keitimo dvejetainiu slenkstines reiksmes paieska
slenkstis = graythresh(V_pustonis);
% pustonio vaizdo keitimas dvejetainiu
V_dvejetainis = imbinarize(V_pustonis,slenkstis);
% rezultato atvaizdavimas
%figure(1), imshow(V_dvejetainis)
% vaizde esanciu objektu konturu paieska
V_konturais = edge(uint8(V_dvejetainis));
% rezultato atvaizdavimas
%figure(2),imshow(V_konturais)
% objektu konturu uzpildymas 
se = strel('square',7); % strukturinis elementas uzpildymui
V_uzpildyti = imdilate(V_konturais, se); 
% rezultato atvaizdavimas
%figure(3),imshow(V_uzpildyti)
% tustumu objetu viduje uzpildymas
V_vientisi= imfill(V_uzpildyti,'holes');
% rezultato atvaizdavimas
%figure(4),imshow(V_vientisi)
% vientisu objektu dvejetainiame vaizde numeravimas
[O_suzymeti, Skaicius] = bwlabel(V_vientisi);
% apskaiciuojami objektu dvejetainiame vaizde pozymiai
O_pozymiai = regionprops(O_suzymeti);
% nuskaitomos pozymiu - objektu ribu koordinaciu - reiksmes
O_ribos = [O_pozymiai.BoundingBox];
% kadangi riba nusako 4 koordinates, pergrupuojame reiksmes
O_ribos = reshape(O_ribos,[4 Skaicius]); % Skaicius - objektu skaicius
% nuskaitomos pozymiu - objektu masës centro koordinaciu - reiksmes
O_centras = [O_pozymiai.Centroid];
% kadangi centra nusako 2 koordinates, pergrupuojame reiksmes
O_centras = reshape(O_centras,[2 Skaicius]);
O_centras = O_centras';
% pridedamas kiekvienam objektui vaize numeris (trecias stulpelis salia koordinaciu)
O_centras(:,3) = 1:Skaicius;
% surusiuojami objektai pagal x koordinate - stulpeli
O_centras = sortrows(O_centras,2);
% rusiojama atsizvelgiant i pavyzdziu eiluciu ir skaiciu skaiciu
raidziu_sk = Skaicius/pvz_eiluciu_sk;
for k = 1:pvz_eiluciu_sk
    O_centras((k-1)*raidziu_sk+1:k*raidziu_sk,:) = sortrows(O_centras((k-1)*raidziu_sk+1:k*raidziu_sk,:),3);
end
% is dvejetainio vaizdo pagal objektu ribas iskerpami vaizdo fragmentai
for k = 1:Skaicius
    objektai{k} = imcrop(V_dvejetainis,O_ribos(:,O_centras(k,3)));
end
% vieno is vaizdo fragmentu atvaizdavimas
%figure(5),
%for k = 1:Skaicius
%   subplot(pvz_eiluciu_sk,raidziu_sk,k), imshow(objektai{k})
%end
% vaizdo fragmentai apkerpami, panaikinant fona is krastu (pagal staciakampi)

for k = 1:Skaicius % Skaicius = 50, jei yra 50 skaiciu
    V_fragmentas = objektai{k};
    % nustatomas kiekvieno vaizdo fragmento dydis
    [aukstis, plotis] = size(V_fragmentas);
    
    % 1. Baltu stulpeliu naikinimas
    % apskaiciuokime kiekvieno stulpelio suma
    stulpeliu_sumos = sum(V_fragmentas,1);
    % naikiname tuos stulpelius, kur suma lygi auksciui
    V_fragmentas(:,stulpeliu_sumos == aukstis) = [];
    % perskaiciuojamas objekto dydis
    [aukstis, plotis] = size(V_fragmentas);
    % 2. Baltu eiluciu naikinimas
    % apskaiciuokime kiekvienos seilutes suma
    eiluciu_sumos = sum(V_fragmentas,2);
    % naikiname tas eilutes, kur suma lygi plociui
    V_fragmentas(eiluciu_sumos == plotis,:) = [];
    objektai{k}=V_fragmentas;% irasome vietoje neapkarpyto
end
% vieno is vaizdo fragmentu atvaizdavimas
%figure(6),
%for k = 1:Skaicius
%   subplot(pvz_eiluciu_sk,raidziu_sk,k), imshow(objektai{k})
%end
%
% Suvienodiname vaizdo fragmentu dydzius iki 70x50
for k=1:Skaicius
    V_fragmentas=objektai{k};
    V_fragmentas_7050=imresize(V_fragmentas,[70,50]);
    % padalinkime vaizdo fragmenta i 10x10 dydzio dalis
    for m=1:7
        for n=1:5
            % apskaiciuokime kiekvienos dalies vidutini sviesuma 
            Vid_sviesumas_eilutese=sum(V_fragmentas_7050((m*10-9:m*10),(n*10-9:n*10)));
            Vid_sviesumas((m-1)*5+n)=sum(Vid_sviesumas_eilutese);
        end
    end
    % 10x10 dydzio dalyje maksimali sviesumo galima reiksme yra 100
    % normuokime sviesumo reiksmes intervale [0, 1]
    Vid_sviesumas = ((100-Vid_sviesumas)/100);
    % rezultata (pozymius) neuronu tinklui patogiau pateikti stulpeliu
    Vid_sviesumas = Vid_sviesumas(:);
    % issaugome apskaiciuotus pozymius i bendra kintamaji
    pozymiai{k} = Vid_sviesumas;
end
end