-- Pirotecnia ELEANA · proyecto Supabase INDEPENDIENTE.
-- Ejecutar únicamente en un proyecto nuevo para ELEANA.
-- Nunca reutilizar las cuentas, datos ni claves de ELO o ALEXVAL.

create table public.administradores (
    usuario_id uuid primary key references auth.users(id) on delete cascade
);
create table public.productos (
    codigo text primary key default (
      'eleana-' || substr(replace(gen_random_uuid()::text, '-', ''), 1, 12)
    ),
    nombre text not null check (length(trim(nombre)) > 0),
    categoria text not null check (categoria in ('Baterías','Productos')),
    imagen text,
    recorte text,
    video text,
    activo boolean not null default false
);

alter table public.administradores enable row level security;
alter table public.productos enable row level security;

grant usage on schema public to anon, authenticated;
grant select on public.productos to anon, authenticated;
grant insert, update, delete on public.productos to authenticated;
grant select on public.administradores to authenticated;

create policy "Eleana consultar cuenta administradora"
on public.administradores for select to authenticated
using (usuario_id = (select auth.uid()));

create policy "Eleana catalogo publico lee activos"
on public.productos for select to anon, authenticated
using (activo = true);

create policy "Eleana admin consulta todos"
on public.productos for select to authenticated
using (
    exists (select 1 from public.administradores a
            where a.usuario_id = (select auth.uid()))
);

create policy "Eleana admin agrega"
on public.productos for insert to authenticated
with check (
    exists (select 1 from public.administradores a
            where a.usuario_id = (select auth.uid()))
);

create policy "Eleana admin modifica"
on public.productos for update to authenticated
using (
    exists (select 1 from public.administradores a
            where a.usuario_id = (select auth.uid()))
)
with check (
    exists (select 1 from public.administradores a
            where a.usuario_id = (select auth.uid()))
);

create policy "Eleana admin elimina ocultos"
on public.productos for delete to authenticated
using (
    activo = false
    and exists (select 1 from public.administradores a
                where a.usuario_id = (select auth.uid()))
);

insert into storage.buckets
    (id, name, public, file_size_limit, allowed_mime_types)
values (
    'productos', 'productos', true, 5242880,
    array['image/jpeg','image/png','image/webp']
) on conflict (id) do nothing;

create policy "Eleana admin consulta fotos"
on storage.objects for select to authenticated
using (
    bucket_id = 'productos'
    and exists (select 1 from public.administradores a
                where a.usuario_id = (select auth.uid()))
);
create policy "Eleana admin sube fotos"
on storage.objects for insert to authenticated
with check (
    bucket_id = 'productos' and name like 'catalogo/%'
    and exists (select 1 from public.administradores a
                where a.usuario_id = (select auth.uid()))
);
create policy "Eleana admin edita fotos"
on storage.objects for update to authenticated
using (
    bucket_id = 'productos'
    and exists (select 1 from public.administradores a
                where a.usuario_id = (select auth.uid()))
)
with check (
    bucket_id = 'productos'
    and exists (select 1 from public.administradores a
                where a.usuario_id = (select auth.uid()))
);
create policy "Eleana admin elimina fotos"
on storage.objects for delete to authenticated
using (
    bucket_id = 'productos'
    and exists (select 1 from public.administradores a
                where a.usuario_id = (select auth.uid()))
);

-- Tras registrar una cuenta en Authentication > Users,
-- asignar el permiso desde SQL Editor cambiando este correo:
--
-- insert into public.administradores(usuario_id)
-- select id from auth.users
-- where email = 'CORREO_DE_LA_ADMINISTRADORA'
-- on conflict (usuario_id) do nothing;
--
-- ¡Nunca escribir contraseñas ni claves secretas en el repositorio!
