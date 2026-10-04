---
name: gala-construction-ajax
description: Actualizeaza comenzile si cozile de constructie din Gala.xyz prin AJAX, pastrand panourile glisante, resursele si regulile serverului. Foloseste pentru Buildings, Research si Shipyard cand se cere eliminarea reincarcarii paginii.
---

# Actualizari de constructie in Gala.xyz

Testeaza mai intai pagina localhost ceruta. Pastreaza comenzile PHP existente si restrictiile lor; AJAX schimba prezentarea, nu regulile de constructie.

- Mecanismul comun este `scripts/game/construction-ajax.js`. Selecteaza root-ul, panoul si modul din pagina curenta; Shipyard trebuie sa pastreze `mode=fleet` sau `mode=defense` exact. Activarea pe o pagina noua necesita cererea utilizatorului.
- Actualizeaza coada, miniaturile, costurile si resursele care se schimba, pastrand documentul, meniul, fundalul si panoul deschis. Nu executa scripturile din HTML-ul raspunsului.
- Blocarea cererilor simultane previne dublarea comenzilor. Nu retransmite automat un POST dupa timeout sau eroare, deoarece serverul poate sa fi salvat comanda. Afiseaza eroare tradusa si ofera reimprospatare prin GET.
- Temporizatoarele se reinitializeaza din datele serverului, cu un singur interval activ. La finalizarea unei cercetari sau a unei unitati, reciteste starea prin GET; nu naviga intreaga pagina. Shipyard foloseste `BuildList.Queue` si `b_hangar_id_plus`; nu considera durata unei unitati durata intregului lot.
- Reinitializeaza tooltips pe elementele noi si distruge instantele vechi. Foloseste handler-e delegate pentru formulare, X si Max care pot fi inlocuite. Validarea cantitatii preceda handler-ul AJAX.
- `resourceTicker` pastreaza configuratia pe celula resursei. Dupa un raspuns AJAX actualizeaza disponibilul, productia si limita; altfel intervalul vechi rescrie suma.
- Texte prin `$LNG` si template Smarty; imagini locale. Nu modifica anularea sau rambursarea fara cerere explicita.

Verifica sintaxa JS/PHP, testele `tests/buildings-ajax.js` si o actiune localhost limitata. Pastreaza coada utilizatorului; identifica si elimina numai intrarile adaugate pentru test. Documenteaza modificarile in `MODIFICARI.md`, nu in `INSTALARE.md`.
