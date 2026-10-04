# Modificări și erori remediate — Gala.xyz / 2Moons

Istoric consemnat la 3 octombrie 2026. Pașii pentru o instalare nouă sunt în [INSTALARE.md](INSTALARE.md).

## Compatibilitate, instalator și imagini locale

1. `includes/libs/Smarty/sysplugins/smarty_internal_compilebase.php`: apelul depreciat `each()` a fost înlocuit cu `key()`, `current()` și `next()`, păstrând avansarea cursorului.
2. `language/en/INGAME.php`: apostrofurile din cele patru mesaje `admin_access_2`, `px_no_deuterium`, `sys_nomore_level` și `tr_not_enought` au fost escapate.
3. `language/es/FAQ.php`: newline după ultimul terminator heredoc `BODY;`, necesar pentru PHP folosit.
4. `styles/templates/install/ins_header.tpl`: viewport și clasa `installer` pe body.
5. `styles/templates/install/ins_req.tpl`: trei închideri greșite `</th>` înlocuite cu `</td>`.
6. `styles/resource/css/install/main.css`: finisări comune instalatorului; tabele adaptabile, spațiere fără suprapuneri, butoane mărite și coloane verticale sub 600px.
7. `styles/templates/login/main.header.tpl`: animația de încărcare pornește la DOM ready, fără să aștepte încărcarea tuturor resurselor.
8. `styles/resource/css/login/bgfade.css`: fonturi locale și valoarea corectă `background-repeat: no-repeat`.
9. `styles/resource/css/login/main.css`: imaginea locală `styles/resource/images/login/background.jpg` ca fundal de rezervă.
10. Cele nouă imagini Imgur ale paginilor de login sunt salvate în `styles/resource/images/login/external/`, cu numele originale. CSS-ul de login folosește aceste fișiere locale.
11. Cele 78 de imagini externe referite de CSS-ul, template-urile și scripturile jocului sunt salvate în `styles/resource/images/game/external/`. Păstrează acest director împreună cu referințele locale actualizate. Căile CSS sunt relative la fișierul CSS; căile din template-uri și scripturi sunt relative la pagina jocului.
12. Referințele vechi `gebaeude/` și `planeten/` din template-urile jocului folosesc acum directoarele existente `buildings/` și `planets/`. Miniaturile planetelor folosesc extensia `.gif`, resturile `.png`, iar scriptul comerciantului de flote folosește imaginile navelor `.png`.
13. `includes/classes/class.StatBanner.php` rezolvă calea fontului prin `realpath()` înainte de apelurile GD. Bannerul `userpic.php?id=1` a fost retestat și livrează o imagine.
14. Calea pictogramei `false.png` și referința `.gifv` a unui fundal au fost corectate. Rezultatul retestării celor 25 de pagini accesibile din meniu este salvat în `IMAGINI-VERIFICARE.json`: fără imagini IMG defecte, mesaje PHP de eroare sau imagini/fundaluri externe în DOM-ul verificat. Conținutul condiționat de alte conturi, flote sau planete nu a fost testat integral.

## Compatibilitatea administrării cu PHP 7.2

În `includes/classes/Database_BC.class.php`, metoda `query()` acceptă parametrul opțional `$resultmode = MYSQLI_STORE_RESULT` și îl transmite către `mysqli::query()`. Astfel, semnătura este compatibilă cu PHP 7.2 și apelurile existente cu un singur argument își păstrează comportamentul.

## Bara de sus a administrării

Butoanele din bara orizontală au fost mărite și spațiate, cu aranjare pe mai multe rânduri când spațiul este insuficient. Înălțimea cadrului se adaptează la încărcare și redimensionare. Linkurile, acțiunile și schimbarea universului au fost păstrate. Modificările sunt în `styles/templates/adm/ShowTopnavPage.tpl`.

## Corecții HTML/CSS și tooltip-uri în joc

- Cele 19 atribute `data-tooltip-content` din nouă template-uri capturează HTML-ul prin Smarty și îl escapează la nivel de atribut. Browserul îl decodează pentru Tooltipster; ghilimelele din textele dinamice nu mai rup cardurile.
- Inițializarea Tooltipster din `main.header.tpl` citește conținutul atributului înainte de fiecare deschidere. Tooltip-urile cu HTML își păstrează tabelele, iar titlurile simple rămân text.
- `layout-fixes.css`, încărcat după tema jocului, aranjează listele de clădiri/cercetări/nave fără dimensiuni verticale fixe și conține elementele flotante ale structurii comune. Dimensiunile sprite-urilor și identificatorii resurselor/progresului sunt păstrați.
- Au fost corectate virgula finală invalidă din selectorul listelor, `collspan`, formularele repetate din Buildings și închiderile rândurilor cozii. Butonul de cantitate maximă din tooltip-ul șantierului are ghilimele JavaScript valide și selectează câmpul din propriul formular.
- Scriptul incomplet `scripts/game/test.js` definește acum valid funcția `initRetinaImages`, fără declarația `Tipped` trunchiată.
- Rezultatul verificării a 25 de pagini se află în `HTML-CSS-VERIFICARE.json`. Tooltip-ul Buildings și actualizarea cronometrului au fost verificate vizual. Ecranele blocate de lipsa laboratorului/șantierului și toate stările condiționale nu sunt acoperite integral.

## Investigarea sesiunii expirate

`index.php?code=3` indică o sesiune absentă sau invalidă. Autentifică-te mai întâi în formularul principal al jocului, apoi deschide `admin.php` sau linkul Administration din joc. Panoul solicită încă o dată parola contului înainte de a activa accesul administrativ. Acest flux a fost verificat în browser cu contul `admin`, până la panoul care afișează „No warnings”. Nu dezactiva validarea sesiunilor pentru a evita redirecționarea.

## Verificarea sintaxei traducerilor

```powershell
Get-ChildItem language -Recurse -Filter *.php -File | ForEach-Object {
    & C:\xampp\php\php.exe -l $_.FullName
}
```

Cele 87 de fișiere PHP de traduceri au trecut această verificare după corecții. Testarea funcțională a întregului joc rămâne separată de verificarea sintaxei și de instalare.

## Buildings: progres vertical și cronometru centrat

- Construcția activă are umplere verde de jos în sus, calculată din timpul rămas și durata totală. Cronometrul este centrat peste imaginea de 65 × 65 px.
- Modificările sunt în `page.buildings.default.tpl`, `layout-fixes.css` și `scripts/game/buildlist.js`. Acțiunile cozii și anularea sunt păstrate.
- Verificare pe localhost cu o previzualizare temporară folosind scriptul și CSS-ul proiectului: progresul a crescut de la 50% la 51,33%, înălțimea de la 32,5 la 33,36 px, cu baza fixă și lățimea de 65 px; cronometrul a scăzut de la 00:05:00 la 00:04:52. Centrul cronometrului coincide cu centrul imaginii. Previzualizarea a fost eliminată. Construcția inițială din cont s-a terminat înainte de retestarea versiunii finale; nu au fost adăugate construcții pentru test.

## Buildings: numele construcțiilor în coadă

Numele traduse apar lângă iconița fiecărei construcții, inclusiv cea activă, într-o coloană compactă de 95 px cu text de 11 px și împărțire pe rânduri pentru numele lungi. Au fost modificate doar template-ul Buildings și CSS-ul comun, cu selectori limitați la această pagină. Limita cozii și configurarea din admin nu au fost modificate. Verificare vizuală pe localhost cu patru construcții prezente: numele, cronometrul și butoanele de anulare sunt afișate fără suprapuneri.

## Overview: timpul și progresul construcției pe imagine

Cronometrul construcției active este centrat pe imagine; umplerea verde urcă de jos în sus, folosind durata reală din coada existentă și timpul rămas. Template-ul Overview, scriptul `overview.js`, CSS-ul și datele de prezentare ale controllerului au fost actualizate. Verificat pe localhost cu o construcție activă: timpul a scăzut de la 00:08:26 la 00:08:16, umplerea a crescut de la 21,02 la 21,89 px cu baza fixă, iar cronometrul este centrat pe imagine. Ambele fișiere PHP Overview au trecut verificarea sintaxei.

## Buildings: imagine activă fără clipire

Animația blink este dezactivată doar pentru imaginea construcției active din Buildings. Zona necompletată primește o umbrire neagră de 28%, a cărei înălțime scade odată cu progresul verde. Verificat pe localhost: animație `none`, progres 31,94%, umplere 20,75 px și umbrire 44,23 px din imaginea de 65 px. Cronometrul și acțiunile cozii sunt păstrate.

## Chat: integrare și resurse locale refăcute

Tabelele `chat_bans`, `chat_invitations`, `chat_messages` și `chat_online` există în `install/install.sql` și în baza locală cu prefixul `uni1_`; schema nu a fost reimportată sau modificată. Redirecționarea către `/chat/install/index.php` provenea din verificarea unei căi relative din directorul chatului. Bootstrap-ul folosește acum rădăcina proiectului, sesiunea curentă și adaptorul mysqli existent. Apelurile configurării și semnătura `getAllChannels` au fost adaptate; constructorii vechi au devenit `__construct`, iar parserul template-urilor folosește `preg_replace_callback` în locul modificatorului `/e` eliminat din PHP. Directorul lipsă `chat/lib/lang` a fost refăcut cu limbile disponibile în joc și româna din https://github.com/Frug/AJAX-Chat/tree/master/chat/lib/lang ; portugheza folosește resursa upstream `pt-pt`. Accesul fără sesiune redirecționează la loginul jocului.

Verificări: sintaxa fișierelor PHP din `chat/lib` și `includes/common.php`, încărcarea interfeței pe localhost, autentificare automată, utilizator online și mesaj automat de intrare vizibile, înregistrare în `uni1_chat_online`; fără imagini IMG defecte în iframe. Nu au fost trimise mesaje manuale de test.

## Research: tooltip-uri fără derulare orizontală

Tabelul tooltip-urilor de cercetare folosește lățime adaptabilă, fără margini procentuale și fără coloane suplimentare fictive. Toate tooltip-urile din `researchOv` primesc o lățime maximă de 320 px; CSS-ul specific permite împărțirea textului pe rânduri. Conținutul dinamic și funcțiile jocului sunt păstrate. Verificare vizuală pe localhost pentru Computer Technology: `clientWidth = scrollWidth = 320`, fără depășire orizontală. Celelalte tehnologii folosesc același template; stările condiționale nu au fost testate integral.

## Research: coadă cu progres vertical și nume

Cercetarea activă are progres verde de jos în sus, zona rămasă umbrită cu 28% și timpul centrat pe imagine. Imaginile cozii nu mai clipesc, iar numele traduse apar lateral într-o coloană de 95 px. Structura rândurilor tabelului a fost corectată, păstrând acțiunile insert/cancel/remove și identificatorii cozii. Modificări în template-ul Research, `research.js` și CSS. Verificat pe localhost cu două cercetări în coadă: animație none, imagine de 50 px, umplere plus umbrire corespunzătoare înălțimii; timpul a scăzut de la 00:03:11 la 00:02:59 și umplerea a crescut de la 23,47 la 25,13 px. Nu au fost executate acțiuni de modificare a cozii în timpul verificării.

## Research: nume pe un singur rând

Numele din coada Research folosesc `white-space: nowrap`, `overflow: hidden` și `text-overflow: ellipsis` în coloana de 95 px. Numele complet rămâne disponibil la trecerea mouse-ului prin atributul title. Verificat pe localhost: Computer Technology are lățime naturală 108 px și este scurtat în spațiul de 95 px, fără împărțire pe două rânduri.

## Admin: formular de acces centrat

În `styles/templates/adm/LoginPage.tpl`, formularul este centrat orizontal, cu lățime maximă de 480 px, spațiere uniformă și adaptarea etichetelor pe ecrane înguste. Butonul Enter are 110 × 38 px și text de 14 px. Verificat pe localhost: centrul butonului este la 506,5 px într-o fereastră de 1013 px. Autentificarea nu a fost modificată.

## Overview: progres Research și miniaturi egale

Research din Overview folosește indicatorul verde vertical și cronometrul centrat pe imagine, calculând progresul din durata reală a cercetării. Miniatura Buildings a fost redusă la 50 × 50 px, egală cu cea Research. Verificat pe localhost cu ambele activități: ambele imagini au 50 × 50 px, iar timpul Research a scăzut de la 00:05:40 la 00:05:29 în timp ce umplerea a crescut. Verificările de sintaxă ale controllerelor Overview au trecut.

## Overview: numele cercetării lângă miniatură

Numele cercetării active apare lateral, lângă miniatura Research, într-o coloană de 95 px, pe un singur rând. Numele prea lungi sunt scurtate cu puncte de suspensie; atributul title păstrează numele complet. Modificări în template-ul Overview și `layout-fixes.css`. Verificat pe localhost cu Energy Technology: numele apare lângă imagine, iar timpul și progresul verde rămân pe miniatură.

## Oficiali: vizualizare compactă și detaliată

Pagina `game.php?page=officier` are selector Compact / Detaliat, cu alegerea păstrată în localStorage. Varianta compactă afișează două coloane, miniaturi de 72 px, bonusuri, costuri și descrieri extensibile prin Detalii. Varianta detaliată afișează o singură coloană și toate descrierile. Recruit este sub imagine; formularul POST, identificatorii, disponibilitatea și limita de nivel sunt păstrate. Timpul rămas al bonusurilor temporare apare centrat pe imagine și folosește cronometrul existent. Oficialii pe nivel nu au timp de construcție în logica jocului, deci afișează nivelul, fără cronometru inventat. Modificări în template-ul paginii, noul `officer.card.tpl`, `officier.js` și CSS izolat pe `#officer-page`.

Verificat pe localhost: 14 carduri, toate imaginile încărcate, comutare între două coloane și una, deschidere Detalii, descrieri deschise în modul detaliat, alegere păstrată după reîncărcare și cronometre descrescătoare. Formularele POST au păstrat destinația și identificatorii. Nu s-au efectuat recrutări în timpul verificării.

## Oficiali: integrarea textelor în sistemul de limbi

Textele selectorului și Detalii nu mai sunt scrise direct în template. Se folosesc `{$LNG.of_view}`, `{$LNG.of_view_compact}`, `{$LNG.of_view_detailed}` și `{$LNG.of_details}`. Cheile au fost adăugate în secțiunea oficialilor din INGAME.php pentru de, en, es, fr, pl, pt, ru și tr. Contul curent afișează pe localhost Compact, Detailed și Details, cu eticheta accesibilă Officer view. Sintaxa PHP a celor opt fișiere a fost verificată. Nu s-a schimbat limba contului.

Skill reutilizabil: `C:/Users/alinv/.codex/skills/gala-project-ui/SKILL.md`. Include integrarea traducerilor, păstrarea funcțiilor jocului, testarea inițială și finală pe localhost și separarea documentației de instalare de modificări. Validatorul automat al skill-creator nu a putut rula: modulul Python PyYAML lipsește din ambele runtime-uri disponibile; structura simplă a skill-ului a fost verificată prin citire.

## Oficiali: selector în bara de sus și nivel peste portret

Selectorul Compact / Detailed a fost mutat sub imaginile oficialilor din bara de sus, cu Compact la stânga și Detailed la dreapta, fără fundal sau bordură de buton. Rămâne disponibil numai pe pagina officier și păstrează traducerile și alegerea memorată. Cele șapte miniaturi ale oficialilor cu nivel folosesc overlay-ul local `h0KeE3G.gif` din Buildings, adaptat la 72 px, cu nivelul curent în dreapta jos. Bonusurile temporare păstrează cronometrul, fără nivel fictiv. Verificat pe localhost: ambele vizualizări se comută, fundalul selectorului este transparent, iar nivelurile afișate sunt 16, 0, 8, 2, 2, 1 și 1. Nu s-au efectuat recrutări.

## Oficiali: portrete potrivite cu overlay-ul Buildings

Miniaturile celor șapte oficiali cu nivel au fost redimensionate la 100 × 100 px, dimensiunea nativă a overlay-ului Buildings. Containerul, imaginea și overlay-ul au aceleași dimensiuni și coordonate, confirmate pe localhost. Nivelul curent rămâne în colțul din dreapta jos; Recruit este aliniat sub portret. Bonusurile temporare nu au fost redimensionate.

## Oficiali: spațiu la finalul paginii

Adăugat padding-bottom de 60 px numai pe `#officer-page`, pentru ca ultimul card și butonul Recruit să nu fie acoperite de navigarea fixă de jos. Verificat la capătul paginii în Compact și Detailed pe localhost; ultimul card este complet vizibil, cu spațiu liber sub el.

## Buildings: eliminarea unei singure poziții din coadă

În RemoveBuildingFromQueue, codul folosea tipul construcției precedente și elimina toate intrările ulterioare de acel tip. Eliminarea vizează acum numai poziția selectată; construcția activă și celelalte intrări sunt păstrate. Nivelurile ulterioare ale tipului eliminat sunt ajustate, iar duratele și termenele sunt recalculate cu nivelul și modul build/destroy. Pozițiile inexistente sunt respinse fără modificări. Corecție în ambele versiuni ale controllerului Buildings.

Testul izolat `tests/buildings-queue-remove.php` a trecut pentru ambele controllere: eliminare prima intrare în așteptare, mijloc și final; păstrarea următoarei intrări cu tip repetat; ajustare nivel/durată; timp de demolare; poziții invalide. Testul nu folosește baza de date. Pagina Buildings a fost reîncărcată pe localhost fără eroare; nu au fost anulate construcții din coada reală.

## Buildings: nivelul în numele intrărilor în așteptare

Eticheta fiecărei construcții queued include acum `$List.level`, valoarea individuală transmisă de controller, lângă numele tradus. Construcția activă nu a fost modificată. Verificat pe localhost: Robot Factory afișează 4 și 5. Cele două Solar Power plant din coada existentă au ambele valoarea 9 în datele transmise, deci afișarea arată 9 și 9; această modificare nu rescrie datele cozii și nu inventează nivelul 8.

## Buildings: niveluri consecutive corecte pentru toate tipurile

Adăugat `BuildFunctions::normalizeBuildingQueueLevels`: calculează fiecare nivel din nivelul real al planetei și comenzile anterioare pentru același tip, inclusiv când alte construcții sunt intercalate. Build stochează nivelul rezultat; destroy păstrează convenția existentă a nivelului demolat. Ambele controllere Buildings normalizează coada înainte de afișare sau acțiuni; dacă nivelurile vechi sunt greșite, recalculează duratele și termenele comenzilor în așteptare, păstrând termenul construcției active și toate comenzile.

Testul izolat `tests/buildings-queue-levels.php` verifică Solar 7 → 8 → 9, Robot 3 → 4 → 5, tipuri intercalate, stabilitatea recalculării și build/destroy combinate. A trecut, împreună cu testele de eliminare din coadă și verificările de sintaxă PHP. Pe localhost coada existentă a fost corectată și afișează Solar Power plant 8, Robot Factory 4, Robot Factory 5, Solar Power plant 9. Nu au fost adăugate sau anulate construcții.

## Research: nivel înaintea numelui în coadă

Etichetele cercetării active și ale intrărilor în așteptare afișează acum nivelul din `$List.level` înaintea numelui tradus, separate prin ·. Coloana rămâne de 95 px, pe un singur rând, cu ellipsis pentru numele lungi; atributul title include nivelul și numele complet. Verificat pe localhost: 3 · Energy Technology și 3 · Computer Technology, nivel vizibil înaintea textului scurtat. Logica cercetării și coada nu au fost modificate.

## Oficiali: aspect Compact după modelul Research

Compact afișează o grilă de miniaturi de 100 px, nivelul pe overlay deplasat spre stânga și butonul Recruit sub portret. Numele, descrierea, nivelul/maximul, bonusurile și costurile sunt disponibile în tooltip HTML escapate în atribut; bonusurile temporare includ durata și păstrează timpul rămas pe imagine. Detailed păstrează descrierile vizibile. Tooltipurile oficialilor folosesc același stil și limita de 320 px din Research. Verificat pe localhost cu Geologist: informații corecte, clientWidth = scrollWidth = 320, fără bară orizontală; selectorul Detailed/Compact funcționează. Nu au fost efectuate recrutări.

## Oficiali: portret în interiorul chenarului overlay

Imaginea oficialilor cu nivel are acum 98 × 98 px și este poziționată la 1 px în interiorul miniaturii de 100 × 100 px, cu colțuri rotunjite de 3 px. Overlay-ul rămâne la dimensiunea sa nativă, aliniat stânga sus. Verificat pe localhost: imaginea este încadrată cu 1 px pe fiecare latură, inclusiv dreapta jos. Nivelul și funcțiile de recrutare nu au fost schimbate.

## Oficiali: Maximum Level pe imagine

Oficialii aflați la nivel maxim afișează `{$LNG.of_maximum_level}` într-un overlay centrat pe portret, cu text de 10 px, în locul mesajului de sub miniatură. Titlul păstrează mesajul complet bd_maxlevel. Cheia nouă este tradusă în toate cele opt fișiere INGAME.php, în secțiunea oficialilor. Recruit rămâne absent la nivel maxim. Verificat pe localhost cu cinci oficiali la limită: Maximum Level încape pe imagine (clientWidth = scrollWidth = 98 px), fără formular de recrutare pentru acești oficiali. Sintaxa PHP a tuturor celor opt fișiere de limbă este validă.

## Oficiali: overlay maxim mai transparent

Maximum Level folosește alb la 82% opacitate și fundal negru la 40% opacitate, pentru a păstra portretul vizibil. Verificat prin stilurile calculate pe localhost. Restul overlay-ului și comportamentul recrutării sunt neschimbate.

## Oficiali: mesaj Maximum Level în partea de sus

Overlay-ul Maximum Level este poziționat la 1 px de partea de sus a portretului, fără transformarea de centrare verticală. Culorile și transparența sunt păstrate. Verificarea vizuală nu a putut fi finalizată: localhost:8766 a refuzat conexiunea în timpul reîncărcării.

## Oficiali: nivel actual și maxim pe miniatură

Overlay-ul nivelului afișează acum nivelul actual/maximul, de exemplu 5/10, pentru toți oficialii cu nivel. Ambele valori provin din controller; tooltipul avea deja aceeași informație. Mesajul Maximum Level și recrutarea sunt păstrate. Modificarea este limitată la eticheta din officer.card.tpl.

## Oficiali: overlay deplasat la dreapta

Fundalul overlay-ului de nivel este deplasat cu 1 px la dreapta în miniaturile oficialilor cu nivel, pentru a acoperi colțul portretului din dreapta jos. Dimensiunile, numerele și funcțiile de recrutare sunt păstrate.

## Oficiali: nume pe portret și colțuri rotunjite

Portretele oficialilor cu nivel au colțuri rotunjite de 7 px și linkul decupează conținutul la aceeași rază, inclusiv overlay-ul. Numele tradus apare sus pe portret, păstrat și la nivel maxim; Maximum Level este poziționat dedesubt la 22 px. Ambele etichete păstrează alb la 82% opacitate și fundal negru la 40%. Numele prea lungi folosesc ellipsis. Verificat pe localhost pentru nouă oficiali, inclusiv Technocrat și oficialii la limită. Recrutarea nu a fost modificată.

## Oficiali: nivel maxim indicat prin culoare

Eliminat mesajul Maximum Level de pe portret. Eticheta nivel actual/maxim devine roșie (#ff5555) numai dacă nivelul actual atinge limita; ceilalți oficiali păstrează portocaliul existent. Numele rămâne sus. Verificat pe localhost: 20/20, 10/10, 3/3, 2/2 și 1/1 sunt roșii; 5/20 și 6/10 sunt portocalii. Niciun overlay Maximum Level nu mai este generat.

## Oficiali: culoarea costului Dark Matter în tooltip

Suma resursei 921 din tooltip este verde dacă `costOverflow[921] == 0`, altfel roșie. Se folosește verificarea existentă din controller, independent de atingerea nivelului maxim. Verificat pe localhost cu resurse suficiente: suma 1.000 este rgb(0,255,0). Condiția pentru insuficiență este implementată; nu s-a redus soldul contului pentru testare.

## Oficiali: dialog de informații cu spațiere și nivel

Dialogul deschis prin click pe portret are padding-left de 16 px pentru textul oficialilor și afișează nivelul real al contului înaintea titlului Bonus, folosind of_lvl și in_bonus. OfficerLevel este transmis de ambele controllere Information numai pentru elementele din reslist.officier. Celelalte tipuri de informații păstrează aspectul existent. Verificat pe localhost cu Geologist: Level 20 · Bonus și spațiu între imagine și text. Valorile bonusurilor existente nu au fost modificate. Sintaxa PHP a controllerelor este validă.

## Techtree: vizualizare mai lizibila

Tabelul tehnologiilor are coloane stabile, miniaturi de 36 px, randuri aerisite si categorii delimitate. Navigarea de sus permite saltul la fiecare dintre cele sase categorii. Cerintele sunt etichete verzi sau rosii in functie de nivelurile existente, fara modificarea calculelor ori a dialogurilor. Toate textele folosesc traducerile existente. Stilurile sunt limitate la #tech-tree-page. Verificat pe localhost: 85 elemente, 6 categorii, nicio imagine lipsa, nicio eticheta taiata si fara depasire orizontala la dimensiunea ferestrei verificate; saltul la Oficiali functioneaza.

## Latimi aliniate la imaginea planetei din Overview

Techtree, Alliance, FleetTable, FleetDealer, Officier si iframe-ul Chat sunt limitate la 654 px, latimea imaginii planetei. Tabelele principale din Alliance/FleetTable/FleetDealer folosesc latimea zonei disponibile; formularele si functiile existente sunt pastrate. In Overview, meniul planetelor si bannerul local sunt grupate intr-o coloana laterala langa planeta, eliminand pozitionarea veche in afara ecranului. Verificat pe localhost in fiecare pagina: zonele principale/tabelele/iframe-ul au 654 px; bannerul se incarca si este vizibil in dreapta planetei. Nu s-au modificat actiunile jocului.

## Galaxy, Trader si Imperium: latime comuna

Zonele de continut si tabelele principale din game.php?page=galaxy, game.php?page=trader si game.php?page=imperium folosesc limita de 654 px a imaginii planetei din Overview. Galaxy permite impachetarea titlurilor coloanelor; Imperium are celule mai aerisite. Stilurile sunt limitate la aceste trei pagini. Verificat vizual pe localhost inainte si dupa: toate tabelele principale au 654 px, fara depasire interna si fara imagini lipsa in starea contului verificata. Formularele, schimburile, navigarea galaxiei si datele imperiului nu au fost modificate.

## Overview: nivelul constructiei active in titlu

Titlul de pe bara albastra deasupra miniaturii Buildings include numele tradus si nivelul din buildInfo.buildings.level, intre paranteze. Se aplica tuturor constructiilor active. Verificat pe localhost: Solar Power plant (10), concordant cu Build to the next level 10. Timerul, progresul si logica de constructie raman neschimbate.

## Overview: nivel Research langa imagine

Eticheta cercetarii active langa miniatura afiseaza nivelul in curs inaintea numelui, folosind buildInfo.tech.level. Numele pastreaza limitarea cu trei puncte; atributul title contine nivelul si numele complet. Verificat pe localhost: 4 · Energy Technology, concordant cu titlul Energy Technology (4). Timerul si progresul sunt pastrate.

## Overview: Hangar cu progres vertical

Hangar foloseste aceeasi miniatura de 50x50 px, timer centrat pe imagine si overlay verde crescator de jos in sus ca Buildings/Research. Durata este buildInfo.fleet.time, iar timpul ramas ramane cel calculat de controller pentru lotul activ. Titlul albastru afiseaza numele tradus si cantitatea la final; lateral apare cantitatea inaintea numelui, cu ellipsis pentru nume lung si title complet. Se reutilizeaza CSS-ul si actualizarea overview.js existente, fara schimbari in productia navelor. Verificat pe localhost cu Solar Satellite (1), lateral 1 · Solar Satellite, durata 180 secunde si progres actualizat automat (24.53%, ancorat bottom:0).

## Overview: descrieri laterale Research si Hangar

Numele nu se mai repeta langa miniatura. Research afiseaza bd_tech_next_level si nivelul activ, iar Hangar rs_amount si cantitatea activa. Titlurile de sus si overlay-urile sunt pastrate. Textul lateral se poate impacheta pentru a ramane complet lizibil. Verificat pe localhost: Research to the next level 4 si Quantity 1.

## Trader: pagina si formular de schimb mai lizibile

Selectia Metal/Crystal/Deuterium foloseste trei casete centrate, cu spatiere si contrast mai clare. Formularul de schimb are coloane proportionate, celule aerisite, campuri de 34 px inaltime si buton Trade de 140x40 px. Corectate ID-urile duplicate ale selectoarelor si un div inchis suplimentar. Toate textele provin din traducerile existente. Verificat vizual pe localhost fiecare formular; tabelul ramane la 654 px fara depasire. Nu s-au trimis schimburi si nu s-au modificat calculele sau costurile.

## Resources: selectoare de productie functionale

Inlocuite selectoarele ascunse si inlocuitorul gol fara interactiune cu selectoare native vizibile (0%-100%). Adaugate etichete accesibile, corectat colspan-ul barei la cele sase coloane si eliminat atributul invalid type de pe formular. Factorul afisat nu mai este fix 100%, ci valoarea prodLevel calculata de controller; atribuire adaugata in ambele variante de controller. Verificat pe localhost: toate cele cinci selectoare disponibile au 11 optiuni; schimbarea Metal de la 100% la 90% se salveaza si modifica productia afisata din 66 in 59. Setarea a fost restabilita la 100%, iar productia a revenit la 66. Sintaxa PHP a controllerului activ este valida. Aceasta verificare nu certifica toate formulele economice si toate situatiile de joc.

## Regula comuna pentru paginile cu tabele si skill

layout.full.tpl aplica clasa game-table-layout zonei principale a paginilor cu tabele. Cadrul are 654 px si inset de 8 px, raportat la imaginea Overview; imaginile specifice paginilor se pastreaza. Overview, Buildings, Research, Shipyard si Resources pastreaza structura grafica existenta, verificata la 654 px. Tabelele principale au latime comuna, celule aerisite, texte care se impacheteaza si controale mai usor de utilizat. Regulile evita tabelele tooltip-urilor si paginile popup. Simulatorul are matrici interne aliniate sus, campuri dimensionate si antet HTML corect; Settings avea doua colspan=3 intr-un tabel cu doua coloane, corectate la 2. Nu s-au trimis actiuni de joc sau formulare de cont.

Skill-ul C:/Users/alinv/.codex/skills/gala-project-ui/SKILL.md include acum regula de dimensiune/pozitionare, pastrarea imaginilor proprii, controale lizibile si verificare localhost. Auditul inainte/dupa este in TABELE-VERIFICARE.json: 19 pagini verificate dupa schimbari, toate zonele principale 654 px si fara overflow al tabelelor principale in starea contului verificata. Nu au fost disponibile liste de lupte populate, pagini de membri ai unei aliante ori Imperium cu mai multe planete; aceste stari nu sunt certificate de audit.

## Overview: intrarea animata a informatiilor planetei

La incarcarea paginii, etichetele din prima coloana a planetDetails intra din stanga (-35px), iar valorile din a doua coloana din dreapta (+35px), cu aparitie progresiva si durata de 0.8 secunde. Animatia ruleaza o singura data; pozitia finala si datele raman neschimbate. Este limitata la Overview si respecta prefers-reduced-motion. Verificat pe localhost: cele patru perechi Diameter/Temperature/Position/Points au animatiile corespunzatoare, durata 0.8s, iar la final transformarea este zero si opacitatea 1.

## Overview: animatie secventiala corectata

Etichetele si valorile intra una dupa alta, in ordinea randurilor: Diametru, date, Temperatura, date, Pozitie, date, Puncte, date. Fiecare intrare dureaza 0.4 secunde; urmatoarea incepe dupa terminarea celei anterioare. Directiile stanga/dreapta se pastreaza. Verificat pe localhost: intarzieri de la 0 la 2.8 secunde pentru primele opt texte. Randurile suplimentare continua aceeasi succesiune.

## Overview: spatiu pentru valorile din dreapta

Padding-ul din dreapta pentru celulele data din planetDetails a crescut de la 5 la 12 px. Verificat pe localhost: 12 px si aliniere la dreapta pentru fiecare valoare. Animatia secventiala este pastrata.

## Overview: corectie spatiu in stanga

La clarificarea utilizatorului, spatiul de 12 px este aplicat primei coloane (etichetele Diametru, Temperatura, Pozitie etc.). Eliminata modificarea din dreapta, care revine la 5 px. Confirmat prin stilurile calculate pe localhost; animatia este pastrata.

## Overview: spatiu stanga redus

Spatiul etichetelor din stanga a fost redus de la 12 la 8 px, la cererea utilizatorului. Restul stilurilor si animatia sunt pastrate.

## Overview: spatiu stanga de 5 px

La cererea utilizatorului, padding-left pentru etichetele planetDetails este acum 5 px.

## Oficiali: comutator grila/lista cu pictograma

Butoanele Compact/Detaliat sunt inlocuite de un singur buton in dreapta titlului Official. Pictograma indica vizualizarea disponibila la click: linii pentru Detaliat, patru patrate pentru Compact. Etichetele title/aria-label folosesc traducerile existente. Se pastreaza localStorage officerView si toate formularele. Verificat pe localhost: click in ambele sensuri, schimbarea pictogramei si amplasarea in officer-section-title.

## Dark Matter Shop: comutator grila/lista

Adaugat acelasi comutator cu pictograma in dreapta titlului Dark Matter Shop, fara ID-uri duplicate. Ambele comutatoare controleaza vizualizarea existenta a paginii si raman sincronizate. Verificat pe localhost: doua butoane, click din Shop schimba vizualizarea si etichetele ambelor; revenirea la Compact functioneaza.

## BattleSimulator: probe functionale

Testate pe localhost doua lupte cu valori introduse manual, fara trupe reale sau flote trimise. Proba 1: 10 Light Fighters contra 5 Missile Launchers, victorie atacator, zero pierderi atacator, 10.000 pierderi aparator. Proba ACS: aceleasi unitati, tehnologie atac 5 si al doilea atacator cu 2 Light Cargo, resurse tinta 10.000 Metal; raportul include doi atacatori, Firepower 150% pentru primul si captura 5.000 Metal. Add ACS-Slot pastreaza campurile; Reset atacator sterge doar coloana lui (aparatorul ramane la 3). Doua rapoarte de simulare au fost generate normal; nu exista erori PHP noi in includes/error.log. Fereastra raportului nu a aparut automat in browserul integrat, dar rapoartele deschise direct sunt valide; cauza exacta a comportamentului popup nu este confirmata. Nu s-a modificat codul simulatorului si probele nu certifica toate formulele/scenariile.

## Imperium: file orizontale

Imperium are sase file orizontale cu traducerile existente: Empire, Resources, Buildings, Technologies, Ships si Defenses. Se afiseaza un singur tbody la un moment dat, selectat prin click sau sageti stanga/dreapta; Empire este selectat la incarcarea paginii. Sectiunile de date pastreaza totalurile si coloanele planetelor, cu numele planetelor in antetul fiecarei matrici. Controllerul si calculele nu au fost modificate. Verificat pe localhost fiecare fila: un singur panou vizibil si tabel de 654 px.

## Admin: tooltipuri, Save si viteze de test

Headerul admin incarca Tooltipster local si scripts/admin/ui-fixes.js, care initializeaza textele data-tooltip-content existente, inclusiv focus/touch. Nu s-au adaugat texte hardcodate. CSS admin/ui-fixes.css mareste butoanele submit la minimum 140x40 px. Verificat pe localhost: Universe Configuration 45 tooltipuri initializate si text Normal speed: 1 vizibil; Server Configuration 13 tooltipuri si explicatia TTF vizibila. Save are 40 px inaltime. Prin formularul admin universului 1 s-au salvat game_speed=10, fleet_speed=10, resource_multiplier=10 si halt_speed=10 (anterior 7,4,7,3). Valoarea game_speed de 10 in admin inseamna 25000 intern si afecteaza constructii/cercetare/nave/aparare. energySpeed nu a fost schimbat. Cozile deja pornite nu au fost rescrise.


## Admin: navigatie restaurata si rubrici orizontale
- Config/configuni deschise separat revin in cadrul principal cu meniul lateral si bara superioara. Parametrul view permite numai aceste doua pagini.
- Rubricile existente sunt selectoare orizontale (5 Server, 8 Universe), cu o singura sectiune vizibila, folosind titlurile traduse existente. Toate campurile raman in formular pentru salvare; Save ramane vizibil.
- Verificat localhost: meniu restaurat, schimbare Server/Universe si SMTP; vitezele 10 pastrate. PHP ShowIndexPage trece verificarea sintaxei.


## Admin: meniul lateral acordeon
- General, Edit Menu, Game si Tools sunt butoane de deschidere/inchidere. O singura categorie este deschisa; initial sunt toate restranse.
- Textele traduse, permisiunile si destinatiile linkurilor existente sunt pastrate. Butoanele au aria-expanded si indicator +/minus.
- Verificat pe localhost: toate cele patru categorii, inchiderea la al doilea click si ascunderea categoriei precedente.


## Admin: dimensionare comuna pentru subcategorii
- Stiluri comune limitate la continutul administratiei (exclud meniul, bara superioara si autentificarea): tabele fluide, celule cu text incadrat, controale cu inaltime lizibila, imagini si campuri limitate la spatiul disponibil. Nu se ascunde overflow-ul pentru a masca informatii.
- Corectat colspan 9 la 2 pentru tabelul cu doua coloane al meniului Account Editor.
- Verificate 23 subpagini principale si 17 variante de formulare/filtre la 796px: latimea documentului nu depaseste spatiul disponibil. Nu au fost trimise formulare de modificare a datelor; actiunile statsupdate/clearcache nu au fost executate.
- News nu afiseaza editorul asteptat, ci continut Overview; aspectul editorului de stiri nu poate fi confirmat. Verificarile nu acopera toate starile posibile cu liste populate.


## Game > Online: prezentare lizibila
- Numai lista Online: filtre pe doua randuri si rezultate grupate per utilizator, cu etichete pentru toate cele 11 informatii/actiuni. Datele, linkurile de editare/stergere si numele parametrilor formularului sunt pastrate.
- 3 coloane pentru informatii; 2 coloane pe ecrane inguste. Eliminat spatiul tabelelor goale de paginare; mesajele de eroare ale filtrarii sunt pastrate.
- Verificat localhost cu 2 utilizatori online si 8 controale de filtrare; latime document 781px egala cu spatiul disponibil, fara derulare orizontala.

- Online, ajustare la cererea utilizatorului: toate cele 8 filtre intr-un singur rand; lista utilizatorilor revine la tabel compact cu 11 coloane. Corectat colspan-ul sumarului pentru a nu genera coloane goale si ingusta artificial datele.

## Game > Active Planets
- Aceeasi prezentare compacta ca Online: filtre pe un singur rand, tabel cu toate cele 10 coloane si sumar colspan corect. Editarea, stergerea si criteriile de cautare sunt pastrate.
- Verificat localhost cu cele 2 planete active existente, fara derulare orizontala.

## Game > Player List si Planet List
- Extins aspectul compact existent numai pentru aceste doua liste: filtre pe un singur rand, tabel cu toate coloanele si sumar corect. Parametrii, datele si actiunile originale sunt pastrate.
- Verificat localhost: Player List 11 coloane/2 utilizatori; Planet List 10 coloane/2 planete; latime document 796px egala cu spatiul disponibil, fara derulare orizontala.

## Game > News: eroare lista goala
- Initializat NewsList ca array: count(null) provoca warning PHP 7.2 si pagina de eroare/Overview. Parametrii action/mode au valori implicite sigure; formularul create primeste valori goale pentru id/title/text.
- Corectate tr duplicat si inchidere th gresita; escape pentru titlu si continut in formular.
- PHP lint reusit; lista goala si formularul create verificate pe localhost, fara overflow orizontal (796px). Nu a fost publicata/stearsa nicio stire in timpul verificarii.

## Defense: Build si Max
- Numai modul defense: Build urmat de Max intr-un rand flex aliniat la stanga sub cantitate. Corectate ghilimelele handlerului Max.
- Verificat localhost: trei perechi orizontale; Max completeaza 55479 pentru primul element, cantitatea apoi restabilita la 0. Nu au fost comandate constructii.

- Defense: Max si Build au aceleasi clase/stiluri, 42x25px si spatiu de 2px; efecte comune hover, active si focus. Dimensiunile si alinierea identica verificate in localhost pentru toate cele 3 perechi disponibile.

- Defense: campul de cantitate limitat la 80px, cu border-box, pentru a se incadra in miniatura de 80px.

- Defense: overlay miniatura redus la 76x76px si aliniat dreapta/sus; cantitatea mutata 2px in sus si spre dreapta, font 10px. Zona click si imaginea principala raman 80x80px.

- Defense: campul cantitatii redus suplimentar de la 80px la 76px, la cererea utilizatorului.

- Defense: campul cantitatii de sub imagine mutat 3px spre stanga; Max si Build din tooltip au inaltime minima 32px, font 12px si padding mai mare. Numai formularul tooltip defense este vizat.

## Defense: dialogul de informatii la click
- Wrapper de stil numai pentru elementele Defense (400-599): tabele centrate pe latimea dialogului, imagine 100px, distanta de 16px fata de descriere, padding uniform si valori numerice aliniate la dreapta. Restul dialogurilor folosesc stilurile existente.
- Verificat prin click pe Missile Launcher: dialog 590px fara overflow orizontal, imagine si statistici vizibile.

- Dialog Defense: inaltime automata dupa continut si incarcarea imaginilor, limitata la inaltimea ferestrei; latimea ramane 590px. Verificat Missile Launcher: 363px inaltime in loc de 620px. Restul dialogurilor pastreaza dimensiunile existente.

## Overview: randuri alternate si stiri
- Detaliile planetei au tonuri albastre alternate discrete; animatiile existente sunt pastrate.
- Zona news era comentata, iar controllerul citea numai OverviewNewsText. Acum citeste ultima stire din NEWS (date/id desc), cu fallback la mesajul configurat, respectand OverviewNewsFrame. Stirea apare sub detalii in acelasi tabel.
- Eliminata inaltimea fixa 100px care taia stirea; continut flexibil pana la 145px, cu derulare verticala pentru texte lungi.
- Verificat localhost: NEWS / test news one vizibil, detalii 138px; PHP lint reusit. Nu s-au modificat stirile sau setarile in baza de date.

- Overview: titlul stirii urmat automat de doua puncte si mesaj pe o singura linie, derulare stanga-dreapta in bucla (18 secunde), limitata la latimea tabelului. Respecta prefers-reduced-motion.

- Overview: directia stirii inversata la cererea utilizatorului: intra din dreapta si iese spre stanga; durata si bucla raman identice.

- Overview: tabelul detaliilor si stirii ancorat la marginea inferioara a imaginii planetei; coltul superior stang rotunjit 8px.

- Overview: corectie pozitie detalii: ridicat 6px si deplasat 2px spre dreapta, pana la marginea imaginii.

- Overview: anulata deplasarea spre dreapta (right 2px), tabelul coborat 2px (bottom 4px).

## Technology Tree: categorii selectabile
- Initial numai Buildings. Click pe categoria de sus afiseaza numai randurile ei. Categoria activa evidentiata; navigare cu sageti stanga/dreapta. Datele, imaginile, cerintele si dialogurile existente sunt pastrate.
- Verificate toate cele 6 categorii pe localhost: exact o categorie vizibila la fiecare selectare.

- Technology Tree: dialogurile tuturor miniaturilor au inaltime automata dupa continut, pastrand latimea 590px si limita ferestrei. Tabelele informatiei sunt incadrate, cu padding uniform. Verificat Metal Mine (751px, tabel productie lung) si prima tehnologie Research (209px), fara overflow orizontal.

## Technology Tree: harta de dependente
- Inlocuita lista tabelara cu grupuri de noduri: fiecare element are miniatura, nume si nivel actual, conectat prin linii SVG cu coturi la cerintele directe. Cerintele arata nivel actual/cerut si verde/rosu; nodul tinta este verde numai daca toate cerintele sunt indeplinite.
- Datele provin din resource/requeriments si nivelurile reale USER/PLANET. Elementele blocate raman vizibile pentru informare. Click pe o cerinta deschide acum informatia acelei cerinte. Nu s-au schimbat regulile de constructie.
- Verificat localhost toate 6 categorii: numarul liniilor egal cu numarul cerintelor (16,38,66,31,5,28); 85 noduri tinta si imagini fara erori de incarcare. PHP lint reusit.

- Technology Tree: miniaturile folosesc imaginile locale buildings 100x100 in loc de techtree 25x25, pastrand afisarea 40/48px. Verificate 269 imagini de noduri fara erori de incarcare.

- Technology Tree: corectata incarcarea versiunii scriptului hartii (browserul pastra scriptul anterior), cu redesenarea liniilor dupa incarcarea imaginilor. Verificat Buildings: 16 conexiuni SVG vizibile; celelalte categorii ascunse initial.

- Dialogurile informatiei au buton tradus catre pagina potrivita (Buildings/Research/Hangar/Defenses/Officers), cu focus pe element. Navigare in fereastra principala, fara comanda automata de constructie. Verificat Metal Mine: butonul duce la game.php?page=buildings&focus=1. Corectata si variabila temporara panelOpen din template Technology Tree.

- Research: X-ul cercetarilor in asteptare redus vizual de la 17px la aproximativ 13px, ancorat dreapta-jos. Prima cercetare activa, miniaturile si actiunile de anulare sunt neschimbate.


### Research: miniaturi din coadă ca în Buildings
- Miniaturile cercetărilor în așteptare sunt de 35 × 35 px, la fel ca în Buildings.
- X-ul de anulare păstrează dimensiunea de 17 × 17 px și poziția din colțul dreapta-jos, cu deplasarea de 2 px spre dreapta și 3 px în jos folosită vizual în Buildings.
- Cercetarea activă, timpul, nivelurile și funcțiile de anulare rămân neschimbate.


### Fleet și Defenses: butoane Build / MAX
- Aceeași prezentare verde pentru ambele butoane, cu stări hover, apăsare și focus comune.
- Sub miniaturi: Build și MAX alăturate, fiecare 42 × 25 px. În tooltip: fiecare 110 × 32 px.
- Eticheta MAX folosește cheia de limbă existentă, convertită în majuscule. Funcțiile de construire și completare a cantității nu sunt schimbate.
- Paginile locale se încarcă cu template-ul comun actualizat. Verificarea vizuală a butoanelor este limitată momentan de blocarea Hangarului prin construcția în curs (NotBuilding=false).


### Defenses: alinierea overlay-ului de hover
- Overlay-ul acoperă miniatura complet: 80 × 80 px în starea normală și la hover.
- Eliminată deplasarea de 1 px a ancorei față de imagine; păstrate poziția numărului și acțiunea de click.


### Galaxy: adaptare vizuală după referința OGame
- Navigarea Galaxy/System și View este pe un singur rând; păstrate galaxy_submit, numele câmpurilor și traducerile existente.
- Panou de 654 px cu gradient albastru, tabel compact, celule închise și iconițe aliniate; celulele goale sunt vizibile.
- Stiluri limitate la #galaxy-view; păstrate datele, tooltip-urile, condițiile și acțiunile existente. Nu sunt încărcate scripturile originale sau resurse externe.
- Verificat pe localhost: navigare sistem 1 → 2 → 1, 15 poziții, imagini încărcate și fără depășirea panoului de către tabel. Captură: galaxy-adaptare.png.


### Galaxy: iconițe pentru selectarea coordonatelor
- Galaxy și System folosesc sprite-ul local addon/top/cdn/cdnee/e81e8e6d5e6a45e1ad45505ef3dc52.png, 18 × 17 px, poziții 0 -65 px și 0 -82 px din CSS-ul original.
- Denumirile traduse rămân ca tooltip și etichete accesibile; controalele și funcțiile sunt păstrate.


### Galaxy: fundalul original disponibil local
- Descărcat JPEG-ul original https://gf2.geo.gfsrv.net/cdn4e/d07c90d96bbc823d6d53953a94aacb.jpg în styles/resource/images/game/galaxy-background.jpg.
- Aplicat exclusiv paginii Galaxy, centrat și fix la derulare, conform CSS-ului original; încărcarea ulterioară nu depinde de CDN.


### Joc: fundal local comun tuturor paginilor principale
- Fundalul original galaxy-background.jpg este aplicat prin body.full în stylesheet-ul comun al jocului, inclusiv Overview, Officers, Resources, Trader și Imperium.
- Imaginea este reutilizată din același fișier local; login, instalare și admin nu folosesc acest stylesheet.


### Overview: adaptation după înregistrarea video
- Analizată înregistrarea de 95 secunde, inclusiv cadrele de intrare a detaliilor și panourile de Buildings/Defense.
- Etichetele Overview sunt bleu, bold, 12 px; valorile alb-deschis, bold, 12 px.
- Intrarea alternativă stânga/dreapta păstrează ordinea rândurilor, cu durata și decalajul de 0,25 secunde în loc de 0,4 secunde; păstrat prefers-reduced-motion.
- Înlocuirea ferestrei Buildings cu panou în pagină așteaptă clarificarea utilizatorului.


### Buildings: panou de detalii în pagină
- Clickul pe miniatură selectează clădirea și deschide panoul deasupra listei: imagine, nivel curent, descriere, costuri, timp și formularul original de construire.
- Un singur panou este vizibil; se poate închide prin X, Escape sau repetarea clickului pe miniatura selectată.
- Details încarcă informațiile complete existente în interiorul panoului, fără fereastra modală; traduceri din cheile existente.
- Verificate selecția Metal Mine → Crystal Mine, închiderea și redeschiderea pe localhost, fără construcții pornite. Panoul nu are depășire orizontală.


### Buildings: slide în sus fără deplasarea listei
- Panoul este poziționat absolut peste imaginea de sus, în suprafața existentă de 654 × 300 px, după modelul detail_screen din CSS-ul cdn43.
- Deschiderea dezvăluie panoul de jos în sus în 0,3 secunde; lista miniaturilor nu își schimbă poziția. Informațiile lungi au derulare în interiorul panoului.


### Buildings: fundalul original al panoului
- Referința dab435e02e060b479363268ca63b0e.gif este prezentă în CSS-ul cdn43 pentru div.detail_screen și #technologydetails_content. Imaginea nu era disponibilă local în addon/top; descărcată din linkul furnizat în styles/resource/images/game/buildings-panel-background.gif.
- Aplicat fundalul original de 654 × 300 px, cu imaginea clădirii în zona de 200 × 200 px din stânga. Slide-ul și poziția listei sunt păstrate.

### Buildings: glisare bidirecțională și aliniere
- Panoul glisează efectiv prin transform translateY, în 0,35 secunde, în sus la deschidere și în jos la închidere; ascunderea se face după animație.
- Deplasare cu 8 px spre dreapta: marginile panoului coincid cu imaginea de fundal.
- Verificat pe localhost: lista rămâne la 515 px; al doilea click declanșează tranziția înainte de ascundere.


### Buildings: panou apropiat de captura detaliată
- Titlu și nivel portocalii în antet, timp și energie sus, costuri cu imaginile resurselor, sprite original local pentru Build, demolare și Technologies; descriere în partea de jos.
- Energia actuală și diferența la următorul nivel folosesc formulele și energySpeed deja existente în ShowBuildingsPage.
- Demolarea folosește comanda existentă destroy; butonul arată costul și timpul în tooltip. Nicio construcție sau demolare nu a fost executată în verificare.
- Informațiile complete rămân în Details. PHP lint trecut; Solar Power Plant verificat în browser.


### Buildings: eliminată secțiunea Details
- Eliminat butonul Details și iframe-ul aferent din panoul Buildings, împreună cu stilurile și handler-ul folosite exclusiv de această secțiune. Restul panoului rămâne neschimbat.


### Buildings: X original în bara de titlu
- Butonul de închidere folosește iconița de 16 × 16 px din sprite-ul original buildings-panel-actions.png, aliniată la 4 px de marginile de sus și dreapta; păstrată închiderea animată.


### Buildings: Build sau Improve după nivelul actual
- Butonul din panou afișează Build la nivelul 0 și Improve de la nivelul 1. Adăugată cheia bd_improve în secțiunea Buildings pentru toate cele opt limbi.


## Atlas local pentru icoanele tehnologiilor

- Sursa: `addon/top/cdn/cdn53/7a9861be0c38bf7de05a57c56d73cf.jpg` (4000 × 6000), copiată local în `styles/resource/images/game/technology-atlas.jpg`.
- `technology-atlas.css` mapează 58 de elemente existente pe regiunile de 200 × 200 din atlas, folosind pozițiile verificate în CSS-ul original. Miniaturile și imaginile mari folosesc aceeași regiune, redimensionată la dimensiunile existente.
- Aplicare în Buildings, Research, Hangar, Defenses și imaginile corespunzătoare din Overview/harta tehnologiilor. Elementele specifice 2Moons fără corespondent verificat păstrează imaginile originale.
- Atlasul este folosit direct ca background CSS; `technology-transparent.svg` păstrează geometria imaginilor HTML și textele alternative. Nivelurile, tooltip-urile, progresul și comenzile de construcție rămân pe structura existentă.
- Fără cereri către CDN la rularea jocului.
- Verificat pe localhost în Buildings (miniaturi și panou Solar Power Plant), Research, Hangar, Defenses, Overview (imaginea construcției în curs) și Techtree (212 imagini mapate; fără imagini HTML defecte). Nu au fost trimise comenzi de construire sau anulare.


## Shipyard și Defenses: panou de construcție în pagină

- Click pe miniatură deschide un panou de 654 × 250 peste fundalul existent; glisează în sus fără să deplaseze lista. X, Escape sau al doilea click pe aceeași miniatură îl închid prin glisare în jos.
- Imagine mare locală, nume și cantitate existentă, durata per unitate, costuri per unitate, câmp de cantitate, MAX și buton Build, după captura furnizată. Formularul trimite în continuare `fmenge[ID]` către ruta originală fleet/defense. Restricțiile existente pentru construcție și elemente unice sunt păstrate.
- Tooltip-ul de hover se închide și este suspendat cât timp panoul este deschis, pentru a evita suprapunerea. Textele noi folosesc chei în toate cele opt fișiere INGAME.php.
- Fișiere noi: `scripts/game/shipyard-panel.js`, `styles/resource/css/ingame/shipyard-panel.css`; modificare în template-ul Shipyard. Logica serverului nu a fost schimbată.
- Verificat pe localhost: deschidere/închidere, introducere cantitate, MAX în fleet și defense, lipsa deplasării listei (poziție 427px înainte/după) și formularul corect pentru fiecare mod. Nu s-au trimis comenzi de construire. Sintaxa PHP a tuturor fișierelor de limbă a trecut verificarea.


## Shipyard/Defenses: comenzi numai în panoul superior

- Eliminate câmpul cantității și butoanele Build/MAX de sub miniaturi, precum și formularul din tooltip-ul de hover. Hover-ul păstrează doar informațiile.
- Cantitatea existentă se afișează pe overlay-ul miniaturii, inclusiv valoarea 0. Introducerea cantității, MAX și Build rămân exclusiv în panoul superior.


## Defenses: card compact pentru construcția în curs

- Adăugate miniatură de 55px, timp peste imagine și progres verde vertical per unitate, nume și cantitate rămasă în lateral.
- Lista pentru anulare se adaptează între 2 și 4 rânduri; avertismentul de rambursare este disponibil într-o secțiune extensibilă. Butonul de anulare este mai vizibil.
- Modificarea aspectului este limitată la modul defense; formularul și indicii de anulare rămân aceiași. Cardul folosește datele și timerul existente.
- Verificat pe localhost cu Atmospheric Shield în curs: cantitate 1, timer actualizat și listă compactă. Nu s-a anulat construcția.


## Defenses: simplificarea construcției în curs

- Cardul păstrează doar imaginea, timpul și progresul. Lista de selecție, numele/cantitatea laterală, timpul total și secțiunea Cancel sunt eliminate din afișare.
- Un singur buton Cancel construction trimite indicele 0 către mecanismul existent și anulează doar lotul în curs. Avertismentul de rambursare rămâne în atributul title. Selectul ascuns rămâne exclusiv pentru compatibilitatea timerului existent.


## Defenses: confirmare înainte de anulare

- Cancel construction deschide o confirmare cu avertismentul existent din limba contului: recuperare 60% din resursele investite, corespunzător FACTOR_CANCEL_SHIPYARD = 0.6.
- Refuzul confirmării oprește trimiterea formularului; acceptarea folosește aceeași comandă de anulare a lotului în curs.


## Defenses: anulare din X-ul panoului

- Numele construcției în curs reapare lângă imagine; butonul Cancel construction de jos este eliminat.
- X-ul panoului elementului din primul lot al cozii deschide confirmarea de anulare. Pentru alte elemente, X închide panoul. Al doilea click pe miniatură și Escape continuă să închidă panoul fără anulare.
- Anularea păstrează formularul pentru indicele 0 și avertismentul de recuperare 60%.


## Defenses: overlay și imagine Atmospheric Shield

- Overlay-ul cantității este mutat 2px spre dreapta, până la marginea miniaturii; numărul este alb și bold pentru lizibilitate. Colțurile miniaturilor Defenses sunt rotunjite la 5px.
- Atmospheric Shield (409) folosește icoana Small Shield Dome (407) din atlas, la cererea utilizatorului. Datele și funcțiile elementului 409 sunt păstrate.

- Ajustare suplimentară Defenses: overlay-ul cantității mutat încă 2px spre dreapta (`right: -2px`).

- Corecție Defenses: fundalul overlay-ului este deplasat independent cu 4px spre dreapta; numărul rămâne cu 4px în interiorul imaginii, pentru a nu fi tăiat de colțul rotunjit.

- Defenses: overlay readus la poziția inițială centrată (număr right: 2px); imaginile miniaturilor sunt reduse la 76 × 76px și insetate 2px în zona de click/overlay de 80 × 80px.


## Defenses: anularea producției indisponibilă în interfață

- La cererea utilizatorului, X închide exclusiv panoul glisant, la fel ca al doilea click pe miniatură.
- Formularul și dialogul de anulare din Defenses, precum și handler-ele de confirmare, au fost eliminate. Anularea producției nu mai este disponibilă din această pagină.
- Mecanismul de anulare și rambursare există în codul serverului; reintroducerea lui în interfață este amânată. Nu s-a modificat logica serverului sau anularea din modul fleet.


## Research: panou glisant în pagină

- Click pe miniatură afișează panoul de 654 × 250 peste banner, cu imagine locală, nume, nivel, timp, costurile nivelului următor și comanda de cercetare existentă. X, Escape și al doilea click închid panoul. Lista nu se deplasează.
- Sunt păstrate restricțiile laboratorului, cozii și nivelului maxim.
- Defenses: demolarea unitatilor deja construite este separata de productie. Cantitatea este limitata la stocul disponibil; confirmarea precizeaza recuperarea a 60% din costul resurselor. X continua sa inchida exclusiv panoul.

- Verificare localhost: deschidere/inchidere Research, miniaturile raman la aceeasi pozitie. Testul izolat tests/defense-recycle.php verifica rambursarea 60%, cantitatea maxima, cereri invalide, rachete si pastrarea cozii. Controllerul si toate cele opt fisiere de limba trec lint PHP 7.2. Nu au fost demolate unitati din cont.

## Buildings: miniaturi incadrate in overlay

- Miniaturile disponibile au fost reduse de la 100 la 96 px, cu colturi usor rotunjite. Overlay-ul de nivel pastreaza dimensiunea si pozitia existente.

## Buildings: constructie numai din panoul glisant

- Formularul si butonul rapid de constructie din miniatura au fost eliminate. Butonul Build/Improve din panoul glisant pastreaza comanda si restrictiile existente.

- Buildings: nivelul miniaturii este aliniat in dreapta jos, inclusiv nivelul 0; nivelul maxim existent ramane afisat unde este definit.

- Buildings: marginea nivelului a fost ajustata la 5 px fata de dreapta si baza miniaturii.

- Buildings: textul nivelului coborat cu 2 px pentru incadrarea in overlay; marginea din dreapta ramane 5 px.

- Buildings: nivelul coborat cu inca 1 px, la cererea utilizatorului.

- Buildings: nivelul coborat cu inca 1 px; margine finala 1 px jos si 5 px dreapta.

- Buildings: miniatura selectata pastreaza overlay-ul original de hover cat timp panoul este deschis; eliminata marginea suplimentara de selectie.

- Buildings: ultima modificare pentru overlay persistent a fost retrasa la cererea utilizatorului; restabilita marginea de selectie anterioara. Celelalte ajustari raman.

## Buildings: comenzi si coada actualizate prin AJAX

- Build/Improve, demolare si anulare folosesc controllerul existent prin AJAX. Raspunsul actualizeaza coada, miniaturile, informatiile panoului si resursele; meniul, fundalul si documentul raman pe loc. Panoul deschis se pastreaza.
- Temporizatorul actualizeaza timpul si progresul vertical si cere o actualizare la finalizare, fara navigare completa. Resursele folosesc noile valori si productii in temporizatorul existent.
- Cererile simultane sunt blocate; o comanda POST esuata nu este retransmisa automat. Eroarea afiseaza un link de reincarcare din limba contului.
- Verificare localhost: Metal Mine nivel 6 adaugat prin Improve in coada existenta, apoi eliminata numai aceasta intrare de test prin AJAX. Crystal Storage si Metal Storage au ramas in coada. Panoul s-a pastrat deschis, iar X a fost verificat dupa actualizare.
- Testul izolat tests/buildings-ajax.js verifica actualizarea la expirarea timpului, blocarea cererilor duplicate, asteptarea dupa eroare si lipsa retransmiterii POST. Verificarile de sintaxa JS si PHP au trecut. Finalizarea reala a constructiei existente nu a fost asteptata in aceasta proba.

## Research si Shipyard fleet: AJAX si productie compacta

- Mecanismul comun scripts/game/construction-ajax.js este folosit de Buildings, Research si Shipyard mode=fleet. Pastreaza pagina si panoul deschis, actualizeaza coada, miniaturile, costurile si resursele. Temporizatorul cercetarii si al fiecarei unitati cere starea serverului la finalizare. Defenses pastreaza temporizatorul anterior.
- Productia fleet afiseaza imagine de 55 px, progres verde vertical, timpul pe imagine si cantitatea inaintea numelui. Controalele existente de anulare fleet sunt pastrate intr-o sectiune pliabila.
- Handler-ele X, Max si validarea cantitatii functioneaza dupa inlocuirea continutului prin AJAX. Validarea opreste formularul inainte de cererea AJAX.
- Proba localhost: pornire/anulare Spy Technology numai pentru test, cu restabilirea resurselor si pastrarea panoului. Shipyard: adaugare si eliminare a unui Solar Satellite de test; Atmospheric Shield existent a fost pastrat. Anularea navei respecta regula existenta de 60% (cost net al probei: 800 crystal si 200 deuterium). Max functioneaza dupa actualizare.
- tests/buildings-ajax.js a trecut pentru toate cele trei pagini, inclusiv finalizare, cereri duplicate, intarzierea reincercarii GET si lipsa retransmiterii POST. Finalizarea reala a productiei existente de peste 41 ore nu a fost asteptata.
- Skill gala-construction-ajax salvat in skills/gala-construction-ajax/SKILL.md si instalat in directorul Codex de skills.

## Fleet: anulare prin X pe imagine

- Sectiunea Cancel de sub productie inlocuita cu X alb pe fundal rosu, in dreapta sus pe miniatura productiei curente. X deschide avertismentul tradus existent pentru rambursarea 60%; confirmarea foloseste comanda delete, auftr[]=0, prin AJAX. Anularea din Defenses ramane indisponibila.

- Fleet: mesajul despre rambursarea 60% eliminat din confirmare; procentul serverului ramane neschimbat. X foloseste sprite-ul local qvplA7d.png si pozitiile normale/hover din Buildings.

- Fleet: X mutat in dreapta jos a miniaturii, cu depasire de 2 px pe ambele margini.

## Defenses: X numai pentru productia in curs

- Același X din Buildings, dreapta jos cu depasire 2 px, anuleaza exclusiv prima intrare a cozii prin comanda existenta delete/auftr[]=0. Confirmarea tradusa din Defenses precizeaza 60% resurse returnate si 40% pierdere. Fleet pastreaza confirmarea fara procent.
- Eliminata reciclarea/demolarea apararii deja construite din interfata si controller, conform noii cerinte. Productia Defense foloseste mecanismul comun AJAX pentru actualizarea cozii.

- Defenses: mesajul confirmarii scurtat la o singura informatie: rambursarea a 60% din resurse.

## Research: tehnologii indisponibile vizibile

- Lista include si tehnologiile cu cerinte neindeplinite. Miniaturile indisponibile sunt intunecate si fara culori, dar pot deschide panoul. Costurile, timpul si nivelul sunt calculate normal; comanda Research este dezactivata cand cerintele, resursele, laboratorul sau coada nu permit cercetarea. Validarea serverului ramane neschimbata.

- Research: corectata intunecarea tuturor miniaturilor cand laboratorul/coada blocheaza temporar comenzile. Efectul fara culori se aplica numai indisponibilitatii individuale (cerinte, resurse, nivel maxim); butoanele pastreaza restrictiile reale ale cozii.

- Research: distanta orizontala 20 px intre miniaturi; fiecare intrare rezerva 80 px inaltime, eliminand suprapunerea randurilor dupa afisarea tuturor tehnologiilor.


## 2026-10-04 - Migrare jQuery, etapa 1: pregatirea compatibilitatii

- Eliminata incarcarea duplicata scripts/login/bgjquery.js din headerul activ de login. Biblioteca activa ramane momentan jQuery 1.8.3; cele patru alerte Dependabot nu sunt inca remediate.
- Validatorul foloseste evenimente delegate on/off pentru modul live, izolate pe formular cu namespace jqv; detach elimina corect handlerul submit. Numararea elementelor foloseste length.
- Inchiderea mesajelor de validare foloseste un singur handler delegat; tooltip-ul foloseste addBack in loc de andSelf. Resetarea din simulator si stergerea shortcut-urilor flotei folosesc on in loc de live.
- Verificare initiala si dupa schimbari pe localhost: Research afiseaza cele 19 miniaturi. Testele AJAX pentru Buildings, Research si Shipyard trec; sintaxa celor patru scripturi modificate este valida.
- Test izolat tests/jquery-migration.html: PASS pentru camp obligatoriu adaugat dinamic, detach, reattach fara duplicare si valoare valida. Testul nu modifica baza de date.
- Urmeaza adaptarea Fancybox/tablesorter si a celorlalte API-uri vechi, apoi trecerea la jQuery 3.7.1 si jQuery UI compatibil, cu teste pe login, admin, panouri, tooltips si AJAX inainte de publicare. Nu s-a publicat aceasta etapa pe GitHub.


## 2026-10-04 - Migrare jQuery, etapa 2: jQuery 3.7.1 local

- scripts/base/jquery.js este distributia oficiala completa 3.7.1; scripts/base/jquery.ui.js este distributia oficiala 1.13.3, compatibila cu noul core. Ambele sunt servite local.
- Headerele active pentru joc, administrare, login si instalare folosesc versiuni explicite in URL pentru invalidarea cache-ului. Copia duplicata bgjquery.js este inlocuita cu un comentariu; loginul incarca o singura biblioteca.
- Fancybox foloseste document.documentMode si detectia reala a proprietatii CSS opacity, in loc de $.browser si $.support.opacity; filtrele sunt eliminate prin CSS. Tablesorter si formatarea numerelor nu mai necesita $.browser. navigation.js foloseste length in loc de size pentru continut.
- Testul izolat tests/jquery-migration.html verifica biblioteca efectiva 3.7.1, blocarea prototype pollution, progressbar, sortare, deschiderea/inchiderea Fancybox si cele patru teste de validare din etapa 1. Toate au trecut in browser pe localhost.
- Verificare interactiva: panourile Research, Buildings si Defenses se deschid; pagina de login incarca doar jQuery 3.7.1. Formularul de autentificare admin incarca noua biblioteca; rubricile protejate nu au fost testate in aceasta etapa deoarece cer reautentificare. Nu s-au initiat constructii sau schimbari de configurare.
- Testele izolate AJAX pentru Buildings, Research si Shipyard au trecut. Sintaxa scripturilor migrate este valida.
- Cele patru vulnerabilitati raportate pentru core 1.8.3 sunt remediate prin versiunea locala 3.7.1. GitHub nu a primit aceasta etapa si alertele de acolo nu au fost inchise manual. Verificarea nu constituie audit complet al tuturor pluginurilor vechi.
