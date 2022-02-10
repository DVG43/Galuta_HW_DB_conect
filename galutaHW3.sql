create table if not exists list_of_gener (
	id serial primary key,
	name_gener varchar(40) unique not null
);
create table if not exists list_of_executor (
	id serial primary key,
	name_executor varchar(60) unique not null,
	date_of_birth integer not null
);
create table if not exists list_of_albom (
	id serial primary key,
	name_albom varchar(60) unique not null,
	release_year integer  not null,
	id_executor integer references list_of_executor(id)
);
create table if not exists list_of_trek (
	id serial primary key,
	name_trek varchar(80) unique not null,
	duration_min integer not null,
	id_albom integer references list_of_albom(id)
);
create table if not exists list_of_colection (
	id serial primary key,
	name_colection varchar(60) unique not null,
	release_year integer  not null
);
create table if not exists list_executors_and_geners (
	id_geners  integer references  list_of_gener(id),
    id_executor  integer references  list_of_executor(id),
	constraint aaa primary key (id_geners, id_executor)
);
create table if not exists list_executors_and_albom (
	id_albom  integer references  list_of_albom(id),
    id_executor  integer references  list_of_executor(id),
	constraint bbb primary key (id_albom, id_executor)
);
create table if not exists list_treck_and_colection (
	id_treck  integer references  list_of_trek(id),
    id_colection  integer references  list_of_colection(id),
	constraint ccc primary key (id_treck, id_colection)
);