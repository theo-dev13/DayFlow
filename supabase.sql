-- DayFlow : table de synchronisation (déjà appliquée sur le projet Supabase "dayflow")
create table if not exists public.dayflow (
  user_id uuid primary key references auth.users (id) on delete cascade,
  data jsonb not null,
  updated_at timestamptz not null default now()
);

alter table public.dayflow enable row level security;

-- Chaque utilisateur ne voit et ne modifie que sa propre ligne
create policy "dayflow_select_own" on public.dayflow for select to authenticated using ((select auth.uid()) = user_id);
create policy "dayflow_insert_own" on public.dayflow for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "dayflow_update_own" on public.dayflow for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
create policy "dayflow_delete_own" on public.dayflow for delete to authenticated using ((select auth.uid()) = user_id);
