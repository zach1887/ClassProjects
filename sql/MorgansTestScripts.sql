USE MakerSpace;

insert into StaticPages(pageId, pageTitle, pageContent, `status`) values(1, 'Cool Page', '<h1>Cool Page</h1>', 1);
insert into Posts(postId, title, author, datePosted, content, `status`) values(1, 'Cool Post', 'Morgan Smith', '2016-11-28', 'This is the text of my blog post. Cool, huh?', 1);
insert into Posts(postId, title, author, datePosted, content, `status`) values(2, 'Cooler Post', 'Morgan Smith', '2016-11-28', 'This is the text of my blog post. Cooler, huh?', 1);
insert into Posts(postId, title, author, datePosted, content, `status`) values(3, 'Boring Post', 'John Smith', '2016-11-28', 'Yawn', 1);

INSERT INTO `users` (`user_id`, `username`, `displayname`, `password`, `enabled`) VALUES
(1, 'admin@lvl2', 'Brumpo Tungus ','password', 1),
(2, 'employee@lvl2', 'Vash the Stampede','password', 1),
(3, 'reader@lvl2', 'Morgan','password', 1);

INSERT INTO `authorities` (`username`, `authority`) VALUES
('admin@lvl2', 'ROLE_ADMIN'),
('employee@lvl2', 'ROLE_EMPLOYEE'),
('reader@lvl2', 'ROLE_READER');

select * from Posts;