# language: de
Funktionalität: Job-Suche
  Um Jobs zu finden
  Als ein Gast
  Soll es möglich sein mittels einer Suche Jobs zu finden
  Szenario: Auffinden durch Titel
    Angenommen wir befinden uns auf der Startseite
    Wenn wir "Rails" für "search" eintippen
    Und die folgenden Jobs sind vorhanden:
       | title                    |  visible  |
       | Ruby on Rails Entwickler |   true    |
       | Java Programmierer       |   true    |
    Und wir auf den Button "Suchen" klicken
    Dann sehen wir "Ruby on Rails Entwickler"
