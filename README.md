# DayFlow

**A GPS for your day.** DayFlow turns a to-do list into a realistic daily schedule: it fits your tasks around your fixed plans, adapts to how focused you feel, and reroutes the rest of your day when you miss something.

**Live app:** https://theo-dev13.github.io/DayFlow/ (in French, installable on iPhone/iPad from Safari: Share → Add to Home Screen)

## The problem

University students know *what* they have to do, but struggle to decide *when* to do it. Classes, assignments, exams, sport and social life are spread across calendars, notes and reminders, which leads to procrastination and last-minute stress.

> "I know what I need to do. I just need help deciding when to do it."

## Features

- **A "now" card that follows the sky.** The home screen greets you by name and shows what to do right now, with one big button to start. Its gradient follows the time of day (morning, day, evening, night).
- **Write it, DayFlow plans it.** Natural-language quick add: "Réviser stats 1h demain à 17h !! #Gestión pour vendredi" sets the duration, day, time, priority, subject and deadline.
- **Energy-aware scheduling.** Tired gives 25-minute sprints with light tasks first; in shape gives 90-minute deep-work blocks with the hardest tasks first, placed at your best time of day.
- **GPS-style rerouting with gestures.** Swipe a task right when it's done, left if you missed it: the rest of the day is recalculated instantly. Every change can be undone.
- **Week view.** A 7-day projection of how your tasks fill the week, with warnings when a deadline is at risk.
- **Focus timer, subjects, steps and notes.** Colour-coded subjects, checklists inside each task, a focus timer that shows them, and confetti when the day is done.
- **Evening review and stats.** Time worked, tasks finished, streak, time per subject over 7 days.
- **Recurring fixed plans and calendar import** (.ics from a university timetable or Google Calendar).
- **Push reminders** 5 minutes before each block, even when the app is closed (installed app on iPhone/iPad, iOS 16.4+), plus export to the Calendar app.
- **Accounts and sync** across devices, offline support, installable as an app, light and dark mode.

## Positioning

Productivity tools like Motion organise your *work*. DayFlow organises your *life*: classes, study, sport, errands and free time. It is built for students on a tight budget, with a planned freemium model (Free + Premium at €2.99/month) based on our willingness-to-pay research.

## Built with

- HTML, CSS and vanilla JavaScript in a single page, no framework
- Supabase: Postgres + Auth for accounts and sync, with row-level security so each user only reads and writes their own data
- Web Push: a Supabase Edge Function (`supabase/functions/send-alerts`) called every minute by `pg_cron` encrypts and sends reminders (RFC 8291 / VAPID, WebCrypto only, no third-party push service)
- Service worker + web app manifest for installation, offline use and notifications
- Hosted on GitHub Pages

Files: `index.html` (app), `sw.js` (offline + notifications), `manifest.webmanifest` and `icon-*.png` (installation), `supabase.sql` (database), `supabase/functions/send-alerts/` (push sender).

## Credits

The concept, market research and buyer persona come from a group project (G1) in Product and Service Management at Universidad Europea de Andalucía, with Natalia, Zineb and Javier.
The app was designed and built by **Theo**.
