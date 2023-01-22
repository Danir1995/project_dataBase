CREATE SCHEMA IF NOT EXISTS notion ;
CREATE TABLE teams(
    team_id bigint unique PRIMARY KEY NOT NULL ,
    name varchar(20) not null
);
CREATE TABLE users(
    user_id bigint unique  PRIMARY KEY NOT NULL,
    name varchar(15) NOT NULL,
    last_name varchar(30) NOT NULL,
    email varchar(255) unique NOT NULL,
    date_of_birth date NOT NULL,
    password varchar(255) NOT NULL,
    CHECK ( date_of_birth < '2007-01-19')
);

CREATE TABLE block_notes(
    block_note_id bigint unique NOT NULL PRIMARY KEY,
    name varchar(255) NOT NULL,
    time_of_creation TIMESTAMP default(current_timestamp) NOT NULL,
    color_of_the_cover valid_colors default ('black')
);

CREATE TABLE notes(
    note_id bigint unique NOT NULL Primary Key,
    name varchar(255) NOT NULL,
    date_of_creation TIMESTAMP default (current_timestamp) NOT NULL,
    last_update TIMESTAMP default (current_timestamp),
    block_note_id bigint references block_notes(block_note_id) on delete cascade
);

CREATE TABLE entries(
    entries_id bigint unique not null primary key,
    type type_of_obj not null,
    content varchar,
    programming_language programming_languages,
    link varchar(255),
    serial_number int not null,
    note_id bigint references notes(note_id) on delete cascade,
    CHECK (serial_number > 0)
);

CREATE TABLE teams_users(
    team_id bigint references teams(team_id) on delete cascade,
    user_id bigint references users(user_id) on delete cascade,
    constraint teams_users_pk PRIMARY KEY (team_id, user_id)
);

CREATE TABLE users_block_notes(
    user_id bigint references users(user_id) on delete cascade ,
    block_note_id bigint references block_notes(block_note_id) on delete cascade,
    constraint users_block_notes_pk PRIMARY KEY (user_id, block_note_id)
);


CREATE OR REPLACE FUNCTION what_type_trigger() RETURNS TRIGGER
AS $$
    BEGIN
    if new.type  in ('text', 'header', 'quote') and new.content  is null
    then  RAISE EXCEPTION 'You must put a content!';
elseif new.type in ('code') and (new.content is null or new.programming_language is null)
    then RAISE EXCEPTION 'content and programming_language can not be empty!';
elseif new.type in ('file', 'image') and new.link is null
    then RAISE EXCEPTION 'link can not be empty!';
elseif new.type in ('youtube_video') and new.link is null
    then RAISE EXCEPTION 'Video must have a link!';
elseif new.type = 'note' and new.link is null
    then RAISE EXCEPTION 'note must have a link to another post!';
else return new;
end if;
    END;
$$LANGUAGE plpgsql;

DROP TRIGGER tr_what_type ON entries CASCADE ;
CREATE TRIGGER tr_what_type BEFORE INSERT ON entries
FOR EACH ROW WHEN (pg_trigger_depth() < 1) EXECUTE PROCEDURE what_type_trigger();

CREATE OR REPLACE FUNCTION check_if_different_serial_num() RETURNS TRIGGER
AS $$
    BEGIN
    IF (select count(serial_number) from entries where note_id = new.note_id and serial_number = new.serial_number) > 0
    THEN RAISE EXCEPTION 'serial number must be different in one page';
    ELSE RETURN new;
    END IF;
    END;
$$LANGUAGE plpgsql;

DROP TRIGGER tr_check_different_serial_num ON entries CASCADE ;
CREATE TRIGGER tr_check_different_serial_num BEFORE INSERT ON entries
FOR EACH ROW WHEN ( pg_trigger_depth() < 1 ) EXECUTE PROCEDURE check_if_different_serial_num();


CREATE OR REPLACE FUNCTION relations_checker() RETURNS TRIGGER
AS $$
    BEGIN
    if (select count(distinct users_block_notes.user_id) from users_block_notes where block_note_id in (select users_block_notes.block_note_id from users_block_notes where users_block_notes.user_id = old.user_id)) < 2
        then delete from block_notes where block_note_id in (select users_block_notes.block_note_id from users_block_notes where users_block_notes.user_id = old.user_id);

    return old;
    else return null;
    end if;
    END;
$$LANGUAGE plpgsql;

drop function relations_checker() cascade;
DROP TRIGGER IF EXISTS tr_relations_checker on users cascade;

CREATE TRIGGER tr_relations_checker after delete ON users
FOR EACH ROW when ( pg_trigger_depth() < 1 ) EXECUTE PROCEDURE relations_checker();






