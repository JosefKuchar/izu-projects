% Zadani c. 5:
% Napiste program resici ukol dany predikatem u5(LIN,VOUT), kde LIN je vstupni
% celociselny seznam a VOUT je vystupni promenna, ve ktere se vraci hodnota -1/1/0,
% pokud seznam LIN obsahuje pouze licha cisla/pouze suda cisla/v ostatnich pripadech.

% Testovaci predikaty:                                   	% VOUT
u5_1:- u5([5,27,-1,0, 16,-4],VOUT),write(VOUT).	        	% 0
u5_2:- u5([5,27,-1,1,15,-5],VOUT),write(VOUT).		       	% -1
u5_3:- u5([6,28,-2,0,16,-4],VOUT),write(VOUT).       		% 1
u5_r:- write('Zadej LIN: '),read(LIN),u5(LIN,VOUT),write(VOUT).

% Reseni:
u5(LIN, VOUT):-
    ((liche(LIN), VOUT = -1);                       % Vsechny cisla jsou liche
    (sude(LIN), VOUT = 1);                          % Vsechny cisla jsou sude
    (\+ liche(LIN), \+ sude(LIN), VOUT = 0)), !.    % Ostatni pripady

% Pomocne predikaty
liche([X|Xs]):- X mod 2 =:= 1, (liche(Xs); prazdny(Xs)).
sude([X|Xs]):- X mod 2 =:= 0, (sude(Xs); prazdny(Xs)).
prazdny([]).
