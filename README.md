# TestLink Aplikacija – Uputstvo za Pokretanje

Ovo uputstvo će vas provesti kroz pokretanje TestLink aplikacije korišćenjem Docker-a i `docker-compose` alata.

## Preduslovi

- Instaliran **Docker** i **Docker Compose**


## Instalacija docker-a
Za instalaciju docker-a pogledati dokument koji se nalazi u repozitorijumu.

## Pokretanje aplikacije
Da vi pokrenuli aplikaciju otvoriti terminal i pozicionirati se na mesto gde ste klonirali repoiztorijum.

Pokrenuti komandu.
  ```bash
  docker-compose up --build
  ```
Ova komanda ce pokrenuti sve neophodne docker kontejnere i aplikacija moze da se koristi.

Da zaustavimo sve kontejnere mozemo koristi jednu od dve opcije.
Ukoliko je terminal otvoren koristiti CTRL + C
ili
```bash
docker-compose down
```

**Korisna komanda**
```bash 
docker ps 
```
Ova komanda nam prikazuje koji svi kontejneri trce.


# Student FTN Aplikacija – Uputstvo za Pokretanje

Student FTN aplikacija se nalazi unutar foldera `student-ftn` da bi je mogli pokrenuti neophodno je da terminal pozicioniramo na tu putanju. 
**Napomena:** Ovde se podrazumeva da je terminal otvoren unutar folder-a gde ste skinuli ovaj repozitorjium.
Unutar terminala otkucati komandu
```bash 
cd student-ftn
```
Ova komanda nam je neophodna zbog `Docker Compose`
Docker compose prilikom pokretanja unutar terminala trazi 
`docker-compose.yml` fajl koji se nalazi na istoj putanji gde je i **terminal**.
Pokrenuti komandu.
  ```bash
  docker-compose up --build
  ```
Ova komanda ce pokrenuti sve neophodne docker kontejnere i aplikacija moze da se koristi.

Aplikaciji pristupiti na linku nakon uspesnog pokretanja
http://localhost:3000
