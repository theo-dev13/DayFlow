# DayFlow

**A GPS for your day.** DayFlow turns a to-do list into a realistic daily schedule: it fits your tasks around your fixed plans, adapts to how focused you feel, and reroutes the rest of your day when you miss something.

**Live app:** https://juliano135-hub.github.io/dayflow/ (in French, installable on iPhone/iPad from Safari: Share → Add to Home Screen)

## The problem

University students know *what* they have to do, but struggle to decide *when* to do it. Classes, assignments, exams, sport and social life are spread across calendars, notes and reminders, which leads to procrastination and last-minute stress.

> "I know what I need to do. I just need help deciding when to do it."

## Features

- **Automatic planning.** Tasks have a duration, priority, deadline and effort level. DayFlow places them in the free gaps between fixed plans, most urgent first.
- **Focus-aware scheduling.** Low focus gives 25-minute sprints with light tasks first; high focus gives 90-minute deep-work blocks with the hardest tasks first. Hard tasks go to your best time of day (morning, afternoon or evening).
- **GPS-style rerouting.** Tick a block as done or mark it missed and the rest of the day is recalculated instantly. Every change can be undone.
- **Focus timer.** Tap a task to start a full-screen countdown for that block.
- **Recurring fixed plans.** Classes, sport and meals repeat daily, on weekdays or on chosen days.
- **Calendar import.** Import a university timetable or a Google Calendar export (.ics), including weekly recurring events.
- **Reminders.** Notifications 5 minutes before each block while the app is open, plus a one-tap export of the day to the Calendar app with alerts.
- **Day to day.** Unfinished tasks roll over each morning, deadlines get closer automatically, overdue tasks are flagged, and the last 7 days of work are charted.
- **Accounts and sync.** Email sign-in with Supabase; the plan syncs across iPad, phone and computer, and works offline.
- **Native feel.** Apple-style interface, light and dark mode, installable as an app (PWA) with offline support.

## Positioning

Productivity tools like Motion organise your *work*. DayFlow organises your *life*: classes, study, sport, errands and free time. It is built for students on a tight budget, with a planned freemium model (Free + Premium at €2.99/month) based on our willingness-to-pay research.

## Built with

- HTML, CSS and vanilla JavaScript in a single page, no framework
- Supabase (Postgres + Auth) for accounts and sync, with row-level security so each user can only read and write their own data
- Service worker + web app manifest for installation and offline use
- Hosted on GitHub Pages

Files: `index.html` (app), `sw.js` (offline), `manifest.webmanifest` and `icon-*.png` (installation), `supabase.sql` (database schema).

## Credits

The concept, market research and buyer persona come from a group project (G1) in Product and Service Management at Universidad Europea de Andalucía, with Natalia, Zineb and Javier.
The app was designed and built by **Theo**.
