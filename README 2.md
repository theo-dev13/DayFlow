# DayFlow

**Le GPS de la journée étudiante.** DayFlow transforme une liste de tâches en planning réaliste. Il place les tâches entre les cours et les autres plans fixes, s'adapte à l'énergie du jour et recalcule la suite dès qu'un créneau est manqué.

- **Appli :** https://theo-dev13.github.io/DayFlow/ (installable sur iPhone et iPad depuis Safari : Partager → Sur l'écran d'accueil)
- **Étude de cas :** https://theo-dev13.github.io/DayFlow/etude-de-cas.html

## Le problème

Les étudiants savent ce qu'ils doivent faire, mais pas quand le faire. Cours, devoirs, révisions, sport et vie sociale sont éparpillés entre agendas, notes et rappels. Résultat : procrastination et rush de dernière minute.

> « Je sais ce que je dois faire. J'ai juste besoin d'aide pour décider quand le faire. »
> Lucas, le persona étudiant défini par notre groupe

## Positionnement

Les outils comme Motion organisent le travail. DayFlow organise la vie étudiante entière : cours, révisions, sport, courses et temps libre. Le modèle prévu est un freemium, avec une version gratuite et un Premium à 2,99 € par mois, issu de notre étude de disposition à payer.

## Fonctionnalités

- **Une carte « En ce moment » qui suit le ciel.** L'écran d'accueil salue l'utilisateur par son prénom et affiche la tâche à faire maintenant, avec un bouton pour démarrer. Ses couleurs suivent le moment de la journée.
- **L'ajout en une phrase.** « Réviser stats 1h demain à 17h !! #Gestión pour vendredi » donne la durée, le jour, l'heure, la priorité, la matière et l'échéance.
- **Un planning selon l'énergie.** Fatigué : blocs de 25 min, tâches légères d'abord. Ça va : blocs de 50 min. En forme : blocs de 90 min, le plus dur d'abord, placé au meilleur moment de la journée.
- **Un recalcul façon GPS, avec des gestes.** Une tâche glissée vers la droite est faite ; vers la gauche, elle est manquée et la suite de la journée se recalcule. Chaque action peut être annulée.
- **Une vue semaine** qui projette les tâches sur 7 jours et prévient quand une échéance risque d'être ratée.
- **Mode focus, matières, étapes et notes.** Minuteur plein écran, matières en couleur, listes d'étapes à cocher, et des confettis quand la journée est bouclée.
- **Bilan du soir et statistiques** : temps de travail, tâches finies, jours d'affilée, temps par matière sur 7 jours.
- **Plans fixes récurrents et import d'emploi du temps** (fichier .ics de la fac ou de Google Agenda).
- **Rappels 5 min avant chaque bloc**, même appli fermée (appli installée, iOS 16.4 ou plus), et export de la journée vers le Calendrier.
- **Comptes et synchronisation** entre appareils, fonctionnement hors ligne, mode sombre.

## Démarche

Testée à chaque étape, l'appli a évolué en partant d'un constat précis à chaque fois :

1. **Prouver le concept.** L'idée du groupe n'existait que sur papier : un prototype qui place les tâches dans les créneaux libres et recalcule la journée.
2. **Le rendre agréable.** Le prototype était austère : un design inspiré d'Apple, puis plus de couleur et de personnalité.
3. **Le rendre utile au quotidien.** Un planning doit suivre la vraie vie : cours récurrents, import d'emploi du temps, vue semaine, comptes synchronisés et rappels.
4. **Le rendre rapide à utiliser.** L'appli devenait trop chargée : quatre onglets, l'ajout en une phrase et des gestes pour avancer.

## Technique

- HTML, CSS et JavaScript sans framework, dans une seule page
- Supabase (serveurs à Paris) pour les comptes et la base de données Postgres, avec une sécurité par ligne (RLS) : chaque compte ne voit que ses propres données
- Notifications push : une fonction Supabase (Edge Function), appelée chaque minute par `pg_cron`, chiffre et envoie les rappels selon les standards Web Push (RFC 8291 et VAPID). Son code est déployé sur Supabase.
- Service worker et manifest pour l'installation et le fonctionnement hors ligne
- Hébergement sur GitHub Pages

Fichiers du dépôt : `index.html` (l'appli), `sw.js` (hors ligne et notifications), `manifest.webmanifest` et `icon-*.png` (installation), `supabase.sql` (structure de la base), `etude-de-cas.html` (l'étude de cas).

## Crédits

Concept, étude de marché et persona : projet de groupe G1 du cours Product and Service Management à l'Universidad Europea de Andalucía, avec Natalia, Zineb et Javier.

Application : conçue et pilotée par **Theo** (vision, priorités, design, tests), développée avec un assistant IA.
