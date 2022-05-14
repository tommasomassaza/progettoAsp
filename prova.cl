team(milan;inter;napoli;juventus;roma;lazio;fiorentina;atalanta;verona;torino;sassuolo;udinese;sampdoria;genoa;bologna;empoli;spezia;cagliari).
%*;roma;lazio;fiorentina;atalanta;verona;torino;sassuolo;udinese;sampdoria;genoa;bologna;empoli;spezia;cagliari;salernitana;venezia).*%

giornata(1..34).

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
%*
in(salernitana,salernoc).
in(venezia,veneziac).
*%

9 {partita(S1,S2,N):team(S1),team(S2)} 9:-giornata(N).
1 {partita(S1,S2,N):giornata(N)} 1:-team(S1),team(S2),S1<>S2.


:-partita(S1,S2,N1),partita(S2,S1,N2),N1<>N2,N1<18,N2<18.
:-partita(S1,S2,N1),partita(S2,S1,N2),N1>8,N1<18,N2>17,N2<N1+10.

:-partita(S1,S2,N),partita(S1,S3,N+1),partita(S1,S4,N+2).
:-partita(S2,S1,N),partita(S3,S1,N+1),partita(S4,S1,N+2).


:-partita(S1,S3,N),partita(S2,S4,N),in(S1,Citta),in(S2,Citta),S1<>S2.



%una squadra può partecipare ad una sola partita a giornata
:-partita(S1,S2,N),partita(S1,S3,N),S2<>S3.
:-partita(S1,S2,N),partita(S3,S1,N),S2<>S3.
:-partita(S1,S2,N),partita(S2,S3,N),S1<>S3.
:-partita(S1,S2,N),partita(S3,S2,N),S1<>S3.

:-partita(S1,S2,N),partita(S2,S1,N).

%fatto(S1,S2,S3,S4):-team(S1),team(S2),team(S3),team(S4),S1<>S3,S1<>S4,S2<>S3,S2<>S4.
%l(S1,S2,S3,S4):-partita(S1,S2,N),partita(S3,S4,N),not fatto(S1,S2,S3,S4).
%:-partita(S1,S2,N),partita(S3,S4,N),l(S1,S2,S3,S4).

#show partita/3.