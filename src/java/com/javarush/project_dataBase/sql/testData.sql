insert into teams (team_id, name)
values (1, 'Kings');
insert into teams (team_id, name)
values (2, 'BabyMetal');
insert into teams (team_id, name)
values (3, 'MortalKombat');

insert into users (user_id, name, last_name, email, date_of_birth, password)
values (1, 'Danir', 'Khutsaev', 'dan.khu@gmail.com', '07.24.1995', '15503fa168bf4a5082d0cbaec5f362fb2b2afeb1');
insert into users (user_id, name, last_name, email, date_of_birth, password)
values (2, 'Vitor', 'Moreira', 'vittt@gmail.com', '08.21.2000', 'ddd80347cc894536655615ccf7805ebc23683866');
insert into users (user_id, name, last_name, email, date_of_birth, password)
values (3, 'Maksim', 'Nagiev', 'maksmask@gmail.com', '01.01.1994', '3d8e0e8dd1371f4e58724819ba6a2f2b11d6d3e1');
insert into users (user_id, name, last_name, email, date_of_birth, password)
values (4, 'Nikolay', 'Khutsaev', 'nikola@rambler.ru', '03.19.1961', '262b42b771725e3ebec40395f2b058e593df7462');
insert into users (user_id, name, last_name, email, date_of_birth, password)
values (5, 'Gabriel', 'Sousa', 'gabi@gmail.com', '05.15.1995', '18a98c35f49808b45edadc75fb1b25ebfd4037d6');
insert into users (user_id, name, last_name, email, date_of_birth, password)
values (6, 'Victor', 'Tsoy', 'victor@rambler.ru', '06.21.1962', '88fa846e5f8aa198848be76e1abdcb7d7a42d292');
insert into users (user_id, name, last_name, email, date_of_birth, password)
values (7, 'Maria', 'Ivanova', 'mariaivanova@gmail.com', '07.16.1972', 'e21fc56c1a272b630e0d1439079d0598cf8b8329');
insert into users (user_id, name, last_name, email, date_of_birth, password)
values (8, 'Zula', 'Bukanov', 'zulazula@mail.ru', '12.05.1974', '55137054d22cbe9134e83deb967aabcc5b68b8cd');
insert into users (user_id, name, last_name, email, date_of_birth, password)
values (9, 'Elena', 'Tsedenova', 'tsedenovael@gmail.com', '07.13.1955', '291c6b2df1bac379d47f5557f9e564a1f6618bf7');
insert into users (user_id, name, last_name, email, date_of_birth, password)
values (10, 'Victoria', 'Glushkova', 'vikunya@gmail.com', '11.04.1996', 'd714d8456935fa20e60bd9e661423cb2583c79d9');

insert into teams_users (team_id, user_id)
values (1, 3);
insert into teams_users (team_id, user_id)
values (1, 4);
insert into teams_users (team_id, user_id)
values (1, 6);
insert into teams_users (team_id, user_id)
values (2, 5);
insert into teams_users (team_id, user_id)
values (2, 7);
insert into teams_users (team_id, user_id)
values (3, 1);
insert into teams_users (team_id, user_id)
values (3, 2);
insert into teams_users(team_id, user_id)
values (3, 4);
insert into teams_users (team_id, user_id)
values (3, 9);

insert into block_notes (block_note_id, name,color_of_the_cover)
values (1, 'summertime', 'red');
insert into block_notes (block_note_id, name)
values (2, 'winter memory');
insert into block_notes (block_note_id, name)
values (3, 'life');
insert into block_notes (block_note_id, name)
values (4, 'dance movements');
insert into block_notes (block_note_id, name)
values (5, 'jobs');
insert into block_notes(block_note_id, name)
values (6, 'sunsets');
insert into block_notes (block_note_id, name)
values (7, 'music ideas');
insert into block_notes (block_note_id, name)
values (8, 'games');
insert into block_notes (block_note_id, name)
values (9, 'plan of conquer');
insert into block_notes (block_note_id, name)
values (10, 'movies');

insert into users_block_notes (user_id, block_note_id)
values (1, 1);
insert into users_block_notes (user_id, block_note_id)
values (2, 1);
insert into users_block_notes (user_id, block_note_id)
values (3, 3);
insert into users_block_notes (user_id, block_note_id)
values (4, 4);
insert into users_block_notes (user_id, block_note_id)
values (5, 2);
insert into users_block_notes (user_id, block_note_id)
values (6, 6);
insert into users_block_notes (user_id, block_note_id)
values (7, 7);
insert into users_block_notes (user_id, block_note_id)
values (8, 5);
insert into users_block_notes (user_id, block_note_id)
values (9, 9);
insert into users_block_notes (user_id, block_note_id)
values (10, 10);

insert into notes (note_id, name, block_note_id)
values (1, '1 day', 1);
insert into notes (note_id, name, block_note_id)
values (2, 'cold', 2);
insert into notes (note_id, name, block_note_id)
values (3, 'school', 3);
insert into notes (note_id, name, block_note_id)
values (4, 'university', 3);
insert into notes (note_id, name, block_note_id)
values (5, 'love', 3);
insert into notes (note_id, name, block_note_id)
values (6, 'holidays', 3);
insert into notes (note_id, name, block_note_id)
values (7, 'first fight', 3);
insert into notes (note_id, name, block_note_id)
values (8, 'travel', 3);
insert into notes (note_id, name, block_note_id)
values (9, 'flare', 4);
insert into notes (note_id, name, block_note_id)
values (10, 'sushiman', 5);
insert into notes (note_id, name, block_note_id)
values (11, 'night time', 6);
insert into notes (note_id, name, block_note_id)
values (12, 'diamonds', 7);
insert into notes (note_id, name, block_note_id)
values (13, 'dota', 8);
insert into notes (note_id, name, block_note_id)
values (14, 'go', 9 );
insert into notes (note_id, name, block_note_id)
values (15, 'stars', 10);

insert into entries(entries_id, type, content, serial_number, note_id)
values (1, 'text', 'Woke up in the morning and thanked a God', 1, 1);
insert into entries (entries_id, type, content, programming_language, link, serial_number, note_id)
values (2,'code', 'making table', 'SQL', null, 1, 2);
insert into entries (entries_id, type, content, programming_language, link, serial_number, note_id)
values (3, 'header', 'making project', null, null, 1, 4);
insert into entries (entries_id, type, content, programming_language, link, serial_number, note_id)
values (4, 'quote', 'death is worth living', null, null, 1, 11);
insert into entries (entries_id, type, link, serial_number, note_id)
values (5, 'file', 'https://dicionario.priberam.org/file', 1, 3);
insert into entries (entries_id, type, content, programming_language, link, serial_number, note_id)
values (6, 'image', null, null, 'https://www.google.com/search?q=%D1%86%D0%BE%D0%B9+%D1%84%D0%BE%D1%82%D0%BE&oq=%D1%86%D0%BE%D0%B9+%D1%84%D0%BE%D1%82%D0%BE&aqs=chrome..69i57j0i512l8.1725j0j7&sourceid=chrome&ie=UTF-8', 1, 7);
insert into entries (entries_id, type, content, programming_language, link, serial_number, note_id)
values (7, 'youtube_video', 'inspiration', null, 'https://www.youtube.com/watch?v=dgJ6VRcwTcw', 1, 6);
insert into entries (entries_id, type, content, programming_language, link, serial_number, note_id)
values (9, 'note', 'pain', null, null, 1, 9);
insert into entries (entries_id, type, content, programming_language, link, serial_number, note_id)
values (8, 'text', 'we met for being happy', null, null, 1, 5 );
insert into entries (entries_id, type, content, programming_language, link, serial_number, note_id)
values (10, 'text', 'cut salmon', null, null, 1, 10);
insert into entries (entries_id, type, content, serial_number, note_id)
values (11, 'text', 'have an idea', 1, 12);
insert into entries (entries_id, type, content, serial_number, note_id)
values (12, 'text', 'won 100 games', 1, 13);
insert into entries (entries_id, type, content, serial_number, note_id)
values (13, 'text', 'go forward study hard', 1, 14);
insert into entries (entries_id, type, content, serial_number, note_id)
values (14, 'text', 'cry because of the movie', 1, 15 );