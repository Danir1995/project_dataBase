CREATE OR REPLACE FUNCTION last_update_in_notes() RETURNS TRIGGER
AS $$
    BEGIN
    UPDATE notes SET last_update = NOW() WHERE note_id = OLD.note_id;
    RETURN OLD;
    END
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS tr_last_update_in_notes on entries cascade ;
CREATE TRIGGER tr_last_update_in_notes AFTER DELETE OR UPDATE OR INSERT ON entries
FOR EACH ROW WHEN (pg_trigger_depth() < 1 ) EXECUTE PROCEDURE last_update_in_notes();


CREATE TABLE changes_by_user(
    user_id bigint references users(user_id) on delete cascade,
    what_changed varchar,
    actions varchar,
    last_update timestamp default current_timestamp
);


CREATE OR REPLACE FUNCTION put_block_note() RETURNS TRIGGER
    AS $$
    BEGIN
    insert into changes_by_user(user_id, what_changed, actions) values ((select user_id from users order by user_id desc limit 1) ,new.name, 'inserted') ;
    return new;
    end;
$$ LANGUAGE plpgsql;

DROP TRIGGER tr_put_block_note ON block_notes cascade;

CREATE TRIGGER tr_put_block_note AFTER INSERT ON block_notes
FOR EACH ROW WHEN (pg_trigger_depth() < 1) EXECUTE PROCEDURE put_block_note();


CREATE OR REPLACE FUNCTION del_block_note() RETURNS TRIGGER
AS $$
BEGIN
    insert into changes_by_user(user_id, what_changed, actions) values ((select user_id from users order by user_id desc limit 1) ,new.name, 'deleted') ;
    return new;
end;
$$ LANGUAGE plpgsql;

DROP TRIGGER tr_del_block_note ON block_notes cascade;

CREATE TRIGGER tr_del_block_note AFTER DELETE ON block_notes
FOR EACH ROW WHEN (pg_trigger_depth() < 1) EXECUTE PROCEDURE del_block_note();


CREATE OR REPLACE FUNCTION update_block_note() RETURNS TRIGGER
AS $$
BEGIN
    insert into changes_by_user(user_id, what_changed, actions) values ((select user_id from users order by user_id desc limit 1) ,new.name, 'updated') ;
    return new;
end;
$$ LANGUAGE plpgsql;

DROP TRIGGER tr_update_block_note ON block_notes cascade;

CREATE TRIGGER tr_update_block_note AFTER UPDATE ON block_notes
FOR EACH ROW WHEN (pg_trigger_depth() < 1) EXECUTE PROCEDURE update_block_note();

