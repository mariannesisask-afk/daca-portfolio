# Week 1 — SQL Põhitõed

## Mida ma tegin

- Tutvusin UrbanStyle.ltd andmebaasi struktuuri ja SQL-i põhitõdedega.
- Kasutasin UrbanStyle'i ametlikku `urbanstyle_schema.sql` skeemi.
- Lõime meeskonna ühises Supabase projektis `urbanstyle-marketing-data` UrbanStyle'i andmebaasi tabelid.
- Impordisin `customers.csv` faili ühisesse `customers` tabelisse.
- Kontrollisin, et `customers` tabelis on **3 150 kirjet** ja **9 veergu**.
- Uurisin `customers` tabeli struktuuri, veerge ja andmetüüpe.
- Harjutasin SQL-i päringuid esmalt `sales_import` tabeli peal.
- Kasutasin `SELECT`, `AS`, `LIMIT`, `ORDER BY`, `WHERE`, `DISTINCT`, `COUNT`, `AND`, `OR` ja `GROUP BY` konstruktsioone.
- Harjutasin andmete filtreerimist, sorteerimist, loendamist ja rühmitamist.
- Uurisin ka andmekvaliteedi ja ärilise tähenduse seoseid.

## Minu roll

**Customer Data Explorer**

Minu vastutus Week 1 jooksul on uurida `customers` tabelit ja saada aru:

- kui palju kliente on;
- millised veerud ja andmetüübid tabelis on;
- millised linnad on esindatud;
- kus esineb puuduvaid väärtusi;
- kas esineb duplikaate;
- millised väärtused vajavad täiendavat kontrolli.

## `customers` tabel

`customers` tabelis on järgmised veerud:

- `customer_id`
- `first_name`
- `last_name`
- `email`
- `phone`
- `city`
- `registration_date`
- `loyalty_tier`
- `birth_year`

Tabelis on **3 150 kirjet**.

Oluline tähelepanek: kõik tekstilised väljad ei ole automaatselt probleemivabad. Näiteks võib `email` olla `NULL`, mistõttu tuleb puuduvate väärtuste olemasolu eraldi kontrollida.

## SQL-i peamised õppetunnid

### SELECT

Õppisin valima tabelist ainult vajalikke veerge.

```sql
SELECT customer_id, total_price, sale_date
FROM sales_import;
```

### AS

Õppisin veergudele tulemuses arusaadavamaid nimetusi andma.

```sql
SELECT
    customer_id AS klient,
    total_price AS summa,
    sale_date AS kuupäev
FROM sales_import;
```

### LIMIT

Õppisin tulemuste arvu piirama.

```sql
SELECT *
FROM sales_import
LIMIT 10;
```

### ORDER BY

Õppisin tulemusi sorteerima.

```sql
SELECT *
FROM sales_import
ORDER BY total_price::numeric DESC;
```

### WHERE

Õppisin andmeid tingimuste järgi filtreerima.

```sql
SELECT *
FROM sales_import
WHERE total_price::numeric > 500;
```

### DISTINCT ja COUNT

Õppisin leidma unikaalseid väärtusi ja neid loendama.

```sql
SELECT DISTINCT channel
FROM sales_import;
```

```sql
SELECT COUNT(DISTINCT channel)
FROM sales_import;
```

### AND ja OR

Õppisin kombineerima mitut tingimust.

```sql
SELECT *
FROM sales_import
WHERE total_price::numeric > 500
  AND channel = 'online';
```

Samuti õppisin, et keerukamate `AND` ja `OR` tingimuste puhul tuleb kasutada sulge, et tingimuste loogika oleks üheselt arusaadav.

### GROUP BY

Õppisin andmeid rühmitama ning kasutama koos `COUNT`, `AVG` ja `SUM` funktsioone.

```sql
SELECT
    channel AS kanal,
    COUNT(*) AS müükide_arv,
    AVG(total_price::numeric) AS keskmine_müük,
    SUM(total_price::numeric) AS müükide_kogusumma
FROM sales_import
WHERE channel IN ('online', 'pood')
GROUP BY channel
ORDER BY keskmine_müük DESC;
```

## Oluline SQL-i õppetund

Week 1 jooksul sain aru, et SQL-i süntaksi tundmine ei ole veel piisav.

Näiteks võib päring:

```sql
SELECT SUM(total_price::numeric)
FROM sales_import;
```

olla tehniliselt täiesti korrektne, kuid enne tulemuse kasutamist tuleb kontrollida, kas andmed ise on usaldusväärsed.

Kontrollida tuleb näiteks:

- duplikaate;
- NULL-väärtusi;
- negatiivseid summasid;
- vale kuupäevi;
- ebaloogilisi koguseid;
- vale kanalit;
- vale toodet või klienti;
- hinnasummade loogikat.

See aitas mul paremini mõista, miks andmete uurimine ja puhastamine on enne ärianalüüsi oluline.

## Andmekvaliteet ja äriline tähendus

Week 1 jooksul õppisin vaatama andmeid ka ärilise riski kaudu.

Näiteks võib negatiivne `total_price` tähendada tagastust. Kui tagastusi ei käsitleta õigesti, võib müügiaruanne näidata ettevõtte tegelikust müügist erinevat pilti.

Samuti võivad duplikaadid suurendada näilist müüki ning vale kuupäev võib viia müügi valesse kuusse või perioodi.

Seetõttu ei piisa küsimusest:

> "Kas SQL päring töötab?"

Tuleb küsida ka:

> "Kas selle päringu tulemus kirjeldab päriselt ettevõtte olukorda?"

## Mida ma õppisin

- SQL-is on oluline mõista päringu loogikat, mitte ainult süntaksit.
- `SELECT` ja `FROM` abil saab andmeid lugeda.
- `WHERE` abil saab andmeid filtreerida.
- `DISTINCT` aitab leida erinevaid väärtusi.
- `COUNT` aitab andmeid loendada.
- `ORDER BY` ja `LIMIT` aitavad tulemusi uurimiseks paremini kontrollida.
- `AND`, `OR` ja sulud määravad filtreerimise loogika.
- `GROUP BY` võimaldab andmeid rühmade kaupa võrrelda.
- Kui tabeli veerud on tekstina, tuleb numbriliste arvutuste jaoks vajadusel kasutada tüübi teisendust, näiteks `::numeric`.
- Andmete tehniline korrektsus ja äriline korrektsus ei ole sama asi.
- Enne äriotsuste tegemist tuleb kontrollida andmekvaliteeti.

## Failid

- `week-1/README.md` — nädala töö ja minu osa kirjeldus
- `week1_[tabel]_exploration.sql` — minu SQL-päringud
- `week1_results_screenshot.png` — päringute tulemuste ekraanipilt

## Meeskonna töö

Meeskonna ühises Supabase projektis:

`urbanstyle-marketing-data`

Team GitHub repository:

https://github.com/mariannesisask-afk/urbanstyle-turundus

Team Charter:

https://github.com/mariannesisask-afk/urbanstyle-turundus/blob/main/charter.md

## Kokkuvõte

Week 1 jooksul liikusin töövahendite seadistamisest päris andmete uurimise juurde. Õppisin kasutama SQL-i UrbanStyle'i andmete lugemiseks, filtreerimiseks, loendamiseks ja rühmitamiseks.

Minu peamine fookus oli `customers` tabel ja Customer Data Explorer roll. Samal ajal sain paremini aru, et hea andmeanalüüs algab andmete tundmaõppimisest ja kvaliteedi kontrollimisest enne äriliste järelduste tegemist.

