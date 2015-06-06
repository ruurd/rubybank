# rubybank
## Requirements
### Via console kun users aanmaken met password

    u = User.new(email: 'bar@here.local', password: 'foobarqux')
    u.save

Of ga met browser naar /user/sign_up of kies Gebruiker | Registreren als gebruiker

### User kan inloggen

Ga met browser naar /user/sign_in of kies Gebruiker | Aanmelden

### Via console kun user saldo opvragen

    a = Account.find(1).balance.to_s

### User heeft bankrekening met saldo

Als je die aanmaakt tenminste. Gaat niet automatisch!
    
    u = User.find(id: 5)
    a = Account.new(user_us: u.id, iban: 'NL11RUBY0121212123', comment: 'Rekening', initial_balance: 123)

### Users kunnen geld naar elkaar overmaken

Kies Transfers uit het menu, kies twee verschillende rekeningen en een bedrag

### Users mogen niet rood staan

Zie de code in the TransfersController

### Achterhaalbaar hoe een user aan een bepaald saldo is gekomen.

Zie de mutations tabel.

### Het is belangrijk dat er niet zomaar geld kan verdwijnen of bij kan komen

Mutaties worden in één transactie in de database verwerkt.