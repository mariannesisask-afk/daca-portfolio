# Week 1 — SQL Põhitõed

## Mida ma tegin

- Tutvusin UrbanStyle.ltd andmebaasi struktuuri ja SQL-i põhitõdedega.
- Kasutasin UrbanStyle'i ametlikku urbanstyle_schema.sql skeemi.
- Lõime meeskonna ühises Supabase projektis urbanstyle-marketing-data UrbanStyle'i andmebaasi tabelid.
- Impordisin customers.csv faili ühisesse Supabase projekti.
- Kontrollisin, et customers tabelis on **3 150 kirjet** ja **9 veergu**.
- Uurisin customers tabeli struktuuri, veerge ja andmetüüpe.
- Kuna minu week-2 rolliks oli customer explorer, siis tegin erinevaid SQL-i päringuid, mille tulemusi esitlesin tiimikaaslastele ja juhtkonnale.
- Kasutasin eelkõige SELECT, AS, LIMIT, ORDER BY, WHERE, DISTINCT, COUNT, AND, OR ja GROUP BY konstruktsioone.
- Harjutasin andmete filtreerimist, sorteerimist, loendamist ja rühmitamist.
- Uurisin ka andmekvaliteedi ja ärilise tähenduse seoseid ja tegin ettepanekuid juhtkonnale.

## Meekonnatöö

Lisasin team TURUNDUS GitHubi week 2 kausta README ja igaüks tegeles grupitöö raames enda rolliga. 

W1-session3-demo 


## Minu roll

**Customer Data Explorer**

Minu vastutus Week 1 jooksul on uurida customers tabelit ja saada aru:

- kui palju kliente on;
- millised veerud ja andmetüübid tabelis on;
- millised linnad on esindatud;
- kus esineb puuduvaid väärtusi;
- kas esineb duplikaate;
- millised väärtused vajavad täiendavat kontrolli


Tabelis on **3 150 kirjet**.

Oluline tähelepanek: kõik tekstilised väljad ei ole automaatselt probleemivabad. Näiteks võib email olla NULL, mistõttu tuleb puuduvate väärtuste olemasolu eraldi kontrollida, samuti esines samadel väärtustel erinevat kirjapilti, mida sql erinevaks luges, nt linnad. See vajab väga palju tähelepanu, sest sellisel kujul on tulemused valed ja väärtusetud. Lähemalt esitlesin leide ja ettepanekuid meeskonnatöö slaidiesitluses: 


## Mida ma õppisin

- SQL-is on oluline mõista päringu loogikat, mitte ainult süntaksit.
- SELECT ja `FROM` abil saab andmeid lugeda.
- WHERE abil saab andmeid filtreerida.
- DISTINCT aitab leida erinevaid väärtusi.
- COUNT aitab andmeid loendada.
- ORDER BY ja LIMIT aitavad tulemusi uurimiseks paremini kontrollida.
- AND, OR ja sulud määravad filtreerimise loogika.
- GROUP BY võimaldab andmeid rühmade kaupa võrrelda.
- Kui tabeli veerud on tekstina, tuleb numbriliste arvutuste jaoks vajadusel kasutada tüübi teisendust, näiteks `::numeric`.
- Andmete tehniline korrektsus ja äriline korrektsus ei ole sama asi.
- Enne äriotsuste tegemist tuleb kontrollida andmekvaliteeti.

- Kontrollida tuleb näiteks ka:

- duplikaate;
- NULL-väärtusi;
- negatiivseid summasid;
- vale kuupäevi;
- ebaloogilisi koguseid;
- vale kanalit;
- vale toodet või klienti;
- hinnasummade loogikat.

See aitas mul paremini mõista, miks andmete uurimine ja puhastamine on enne ärianalüüsi oluline.

## Failid

- week-1/README.me — nädala töö ja minu osa kirjeldus
- week-1 SQL-päringud sql failina
- Week-1 päringute ja tulemuste ekraanipildid


## Kokkuvõte

Week 1 jooksul liikusin töövahendite seadistamisest päris andmete uurimise juurde. Õppisin kasutama SQL-i UrbanStyle'i andmete lugemiseks, filtreerimiseks, loendamiseks ja rühmitamiseks.

Minu peamine fookus oli customers tabel ja Customer Data Explorer roll. Samal ajal sain paremini aru, et hea andmeanalüüs algab andmete tundmaõppimisest ja kvaliteedi kontrollimisest enne äriliste järelduste tegemist.

