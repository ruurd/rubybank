# rubybank

## Running it

The usual stuff. If you want to use a different database than PostgreSQL adjust database.yml in config.

## Requirements
### Via console kun users aanmaken met password

    u = User.new(email: 'bar@here.local', password: 'foobarqux')
    u.save

Of ga met browser naar /user/sign_up of kies Gebruiker | Registreren als gebruiker
Voor een gebruiker met administratieve rechten (die kan ook rails_admin gebruiken vanuit het menu)

    u.admin = true
    u.save


### User kan inloggen

Ga met browser naar /user/sign_in of kies Gebruiker | Aanmelden

### Via console kun user saldo opvragen

    Account.find(1).balance.to_s

### User heeft bankrekening met saldo

Als je die aanmaakt tenminste. Gaat niet automatisch!
    
    a = Account.new(user_id: 3, iban: 'NL11RUBY0121212123', comment: 'Rekening', initial_balance_cents: 12300, initial_balance_currency: 'EUR')

### Users kunnen geld naar elkaar overmaken

Kies Transfers uit het menu, kies twee verschillende rekeningen en een bedrag

### Users mogen niet rood staan

Zie de code in the TransfersController en de extra validaties in het Account model

### Achterhaalbaar hoe een user aan een bepaald saldo is gekomen.

Zie de mutations tabel.

### Het is belangrijk dat er niet zomaar geld kan verdwijnen of bij kan komen

Mutaties worden in één transactie in de database verwerkt. Controleren met

    Mutation.all.sum(:amount_cents)
    
Als alles in orde is komt daar nul uit.

## Loose ends

Er zijn nog wel een paar losse eindjes: 

* Dit is gemaakt in ninja-mode, dus geen testen geschreven terwijl dat eigenlijk wel zou moeten. 
* Er zou een betere manier moeten zijn om bedragen te specificeren in het Transfer formulier.
* Nog niet alles is netjes vertaald.

Enjoy,
Ruurd