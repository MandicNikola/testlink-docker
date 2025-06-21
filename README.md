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