-- DayFlow : structure de la base Supabase (déjà appliquée sur le projet "dayflow").

-- 1. Synchronisation : une ligne par utilisateur avec tout son planning
create table if not exists public.dayflow (
  user_id uuid primary key references auth.users (id) on delete cascade,
  data jsonb not null,
  updated_at timestamptz not null default now()
);
alter table public.dayflow enable row level security;
create policy "dayflow_select_own" on public.dayflow for select to authenticated using ((select auth.uid()) = user_id);
create policy "dayflow_insert_own" on public.dayflow for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "dayflow_update_own" on public.dayflow for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
create policy "dayflow_delete_own" on public.dayflow for delete to authenticated using ((select auth.uid()) = user_id);

-- 2. Notifications push
-- Clés serveur (paire VAPID générée par la fonction send-alerts, secret du cron) : lisibles par le service uniquement
create table if not exists public.server_keys (name text primary key, value text not null, created_at timestamptz not null default now());
alter table public.server_keys enable row level security;
revoke all on public.server_keys from anon, authenticated;
insert into public.server_keys (name, value) values ('cron_secret', encode(extensions.gen_random_bytes(32), 'hex')) on conflict (name) do nothing;

-- Appareils abonnés aux notifications
create table if not exists public.push_subscriptions (
  endpoint text primary key,
  user_id uuid not null references auth.users (id) on delete cascade,
  p256dh text not null, auth text not null,
  created_at timestamptz not null default now()
);
alter table public.push_subscriptions enable row level security;
create policy "push_select_own" on public.push_subscriptions for select to authenticated using ((select auth.uid()) = user_id);
create policy "push_delete_own" on public.push_subscriptions for delete to authenticated using ((select auth.uid()) = user_id);

-- Rappels à venir, calculés par l'appli (5 min avant chaque bloc, aujourd'hui et demain)
create table if not exists public.dayflow_alerts (
  id bigint generated always as identity primary key,
  user_id uuid not null references auth.users (id) on delete cascade,
  fire_at timestamptz not null, title text not null, body text, tag text,
  sent boolean not null default false
);
create index if not exists dayflow_alerts_due_idx on public.dayflow_alerts (fire_at) where not sent;
alter table public.dayflow_alerts enable row level security;
create policy "alerts_select_own" on public.dayflow_alerts for select to authenticated using ((select auth.uid()) = user_id);

-- Fonctions appelées par l'appli : save_push_subscription, replace_alerts, get_vapid_public_key
-- Fonction appelée par l'edge function (service uniquement) : claim_due_alerts
-- (voir le détail dans le projet Supabase > Database > Functions)

-- 3. Envoi : toutes les minutes, pg_cron appelle l'edge function "send-alerts"
create extension if not exists pg_net with schema extensions;
create extension if not exists pg_cron;
select cron.schedule('dayflow-send-alerts', '* * * * *', $job$
  select net.http_post(
    url := 'https://hejpijsacxkmdphvbwzn.supabase.co/functions/v1/send-alerts',
    headers := jsonb_build_object('Content-Type', 'application/json',
      'x-cron-secret', (select value from public.server_keys where name = 'cron_secret')),
    body := '{}'::jsonb, timeout_milliseconds := 15000);
$job$);
