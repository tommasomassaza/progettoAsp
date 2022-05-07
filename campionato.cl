team(milan;inter;napoli;juventus;roma;lazio;fiorentina;atalanta;verona;torino;sassuolo;udinese;bologna;empoli;sampdoria;spezia;cagliari;salernitana;genoa;venezia).
%*;roma;lazio;fiorentina;atalanta;verona;torino;sassuolo;udinese;bologna;empoli;sampdoria;spezia;cagliari;salernitana;genoa;venezia).*%

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
in(bologna,bolognac).
in(empoli,empolic).
in(sampdoria,genovac).
in(spezia,speziac).
in(cagliari,cagliaric).
in(salernitana,salernoc).
in(genoa,genovac).
in(venezia,veneziac).

giornata(1..38).

% dividere in andata e ritorno
:-partita(S1,S2,N1),partita(S2,S1,N2),N1<20,N2<20.

% due squadre della stessa città condividono la stessa struttura di gioco, quindi non possono giocare entrambe in casa nella stessa giornata
:-partita(S1,S2,N),partita(S3,S4,N),in(S1,Citta),in(S3,Citta),S1<>S3.

1 {partita(S1,S2,N):giornata(N)} 1:-team(S1), team(S2), S1<>S2.
10 {partita(S1,S2,N):team(S1),team(S2)} 10:-giornata(N).

% si potrebbe fare anche con il count, poi vediamo
:-giornata(N),partita(S1,S2,N),partita(S1,S3,N),S2<>S3.
:-giornata(N),partita(S1,S2,N),partita(S3,S1,N),S2<>S3.
:-giornata(N),partita(S1,S2,N),partita(S2,S3,N),S1<>S3.
:-giornata(N),partita(S1,S2,N),partita(S3,S2,N),S1<>S3.




#show partita/3.