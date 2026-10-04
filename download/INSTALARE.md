# Instalare locală Gala.xyz / 2Moons

## Pregătirea mediului

- Proiect: `C:\Users\alinv\Desktop\Gala.xyz`.
- Mediul folosit pentru pornire: XAMPP PHP 7.2.34 (`C:\xampp\php\php.exe`) și MariaDB 10.4.14 pe `127.0.0.1:3306`.
- Conexiunea se configurează în `includes/config.php`. Instalarea actuală folosește baza și utilizatorul `gala_xyz_local`, cu prefixul `uni1_`. Pentru o instalare nouă folosește o bază goală și datele proprii de conexiune.
- Serverul PHP de test nu procesează regulile Apache din `.htaccess`.

## Procedura pentru o instalare nouă

1. Folosește o copie separată a proiectului, cu toate fișierele și imaginile locale. Nu suprascrie instalarea existentă și nu copia parolele/configurarea ei într-un mediu nou.
2. Pornește MySQL/MariaDB local și creează o bază nouă, goală, plus un utilizator dedicat cu drepturi asupra ei. Alege datele conexiunii pentru noul mediu; nu importa schema peste baza existentă.
3. În copia nouă, `includes/config.php` trebuie să lipsească sau să fie gol. Creează un fișier gol `includes/FIRST_INSTALL` dacă nu există nici markerul `FIRST_INSTALL`, nici `ENABLE_INSTALL_TOOL`. La accesare, instalatorul consumă `FIRST_INSTALL` și creează temporar `ENABLE_INSTALL_TOOL`.
4. Asigură scrierea în `includes/`, `cache/`, `cache/templates/` și `cache/sessions/`.
5. Din directorul copiei noi, pornește PHP pe un port liber:

   ```powershell
   & C:\xampp\php\php.exe -S 127.0.0.1:8766 -t .
   ```

   Portul 8766 este folosit de instalarea actuală; pentru o copie rulată simultan alege alt port liber.

6. Deschide `/install/index.php` pe serverul nou. Verifică cerințele PHP, PDO MySQL și drepturile de scriere. GD este disponibil în mediul verificat.
7. Completează conexiunea la baza nouă și prefixul. Instalatorul generează `includes/config.php` și saltul parolelor.
8. Continuă importul prin instalator: acesta citește `install/install.sql`, înlocuiește `%PREFIX%`, `%VERSION%`, `%REVISION%` și `%DB_VERSION%` și completează configurarea universului. Nu importa separat același SQL încă o dată.
9. Creează administratorul în pasul 7 folosind numele, emailul și parola alese pentru noua instalare.
10. Verifică absența `includes/ENABLE_INSTALL_TOOL` și `includes/FIRST_INSTALL`. Dacă markerul de activare rămâne, șterge-l. Verifică faptul că `/install/index.php` afișează instalatorul blocat.
11. Verifică fusul orar în administrare; pentru mediul actual este `Europe/Madrid`.
12. Testează loginul, administrarea, paginile jocului, schimbarea limbii și imaginile locale. Un răspuns HTTP 200 singur nu confirmă absența erorilor: verifică și conținutul paginii/logurile.

## Prima accesare a administrării

Autentifică-te în formularul principal al jocului cu administratorul creat la instalare. Deschide `admin.php` sau linkul Administration din joc și introdu din nou parola contului când panoul o solicită.

Istoricul corecțiilor, îmbunătățirile și rezultatele verificărilor sunt documentate separat în [MODIFICARI.md](MODIFICARI.md).
