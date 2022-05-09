team(milan;inter;napoli;juventus;roma;lazio;fiorentina;atalanta;verona;torino;sassuolo;udinese;sampdoria;genoa;bologna;empoli;spezia;cagliari;salernitana;venezia).
%*;roma;lazio;fiorentina;atalanta;verona;torino;sassuolo;udinese;sampdoria;genoa;bologna;empoli;spezia;cagliari;salernitana;venezia).*%

giornata(1..38).

in(milan,milanoc).
in(inter,milanoc).
in(napoli,napolic).
in(juventus,torinoc).

in(roma,romac).
in(lazio,romac).
in(fiorentina,firenzec).
in(atalanta,bergamoc).
in(verona,veronac).
in(torino,torinoc).
in(sassuolo,sassuoloc).
in(udinese,udinec).

in(sampdoria,genovac).
in(genoa,genovac).
in(bologna,bolognac).
in(empoli,empolic).
in(spezia,speziac).
in(cagliari,cagliaric).
in(salernitana,salernoc).
in(venezia,veneziac).



10 {partita(S1,S2,N):team(S1),team(S2)} 10:-giornata(N).
1 {partita(S1,S2,N):giornata(N)} 1:-team(S1),team(S2),S1<>S2.

% la distanza tra una coppia di gare di andata e ritorno è di almeno 10 giornate, 
%ossia se SquadraA vs SquadraB è programmata per la giornata 12, il ritorno 
%SquadraB vs SquadraA verrà schedulato non prima dalla giornata 22

limite1(S1,S2,NS):-partita(S1,S2,N),N<11, NS = #count{P:partita(S2,S1,P),P<11,P<>N}.
:-limite1(S1,S2,NS),NS<>0.
limite2(S1,S2,NS):-partita(S1,S2,N),N>10,N<20, NS = #count{P:partita(S2,S1,P),P>19,P<N+10}.
:-limite2(S1,S2,NS),NS<>0.


% ciascuna squadra non deve giocare mai più di due partite consecutive in casa o fuori casa
:-partita(S1,S2,N),partita(S1,S3,N+1),partita(S1,S4,N+2).
:-partita(S2,S1,N),partita(S3,S1,N+1),partita(S4,S1,N+2).

% dividere in andata e ritorno
%:-partita(S1,S2,N1),partita(S2,S1,N2),N1<12,N2<12.

% due squadre della stessa città condividono la stessa struttura di gioco, quindi non possono giocare entrambe in casa nella stessa giornata
:-partita(S1,S3,N),partita(S2,S4,N),in(S1,Citta),in(S2,Citta),S1<>S2.




% una squadra può partecipare ad una sola partita a giornata
:-partita(S1,S2,N),partita(S1,S3,N),S2<>S3.
:-partita(S1,S2,N),partita(S3,S1,N),S2<>S3.
:-partita(S1,S2,N),partita(S2,S3,N),S1<>S3.
:-partita(S1,S2,N),partita(S3,S2,N),S1<>S3.

:-partita(S1,S2,N),partita(S2,S1,N).


#show partita/3.