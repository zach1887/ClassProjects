USE MakerSpace;


insert into StaticPages(pageId, pageTitle,`status`, layout) values(1, 'Cool Page', 1, 2);
insert into StaticPageContents(pageId, content) values(1, '<h1>Cool Page</h1><p>Pretty neat, huh?</p>');
insert into StaticPageContents(pageId, content) values(1, '<h1>Cool Page</h1><p>Pretty neat, ah?</p>');
insert into StaticPageContents(pageId, content) values(1, '<h1>Cool Page</h1><p>Pretty neat, bah?</p>');
insert into Posts(postId, title, author, content, `status`) values(1, 'Cool Post', 'Morgan Smith', 'This is the text of my blog post. Cool, huh?', 1);
insert into Posts(postId, title, author, content, `status`) values(2, 'Cooler Post', 'Morgan Smith', 'This is the text of my blog post. Cooler, huh?', 1);
insert into Posts(postId, title, author, content, `status`) values(3, 'Boring Post', 'John Smith', 'Yawn', 1);
insert into Posts(postId, title, author, dateScheduled, content, `status`) values(4, 'Boring Post', 'John Smith', TIMESTAMP('2016-5-25 13:13:13'), 'Yawn', 1);


INSERT INTO `users` (`user_id`, `username`, `displayname`, `password`, `enabled`) VALUES
(1, 'admin@lvl2', 'Brumpo Tungus ','password', 1),
(2, 'employee@lvl2', 'Vash the Stampede','password', 1),
(3, 'reader@lvl2', 'Morgan','password', 1);

INSERT INTO `authorities` (`username`, `authority`) VALUES
('admin@lvl2', 'ROLE_ADMIN'),
('employee@lvl2', 'ROLE_EMPLOYEE'),
('reader@lvl2', 'ROLE_READER');

select * from Posts;
select * from StaticPages;
select * from StaticPages join StaticPageContents on StaticPages.pageId=StaticPageContents.pageId where StaticPages.pageId = 4;
SELECT * FROM livePosts WHERE postId > 3 LIMIT 3;

SELECT * FROM livePosts
ORDER BY CASE 
    WHEN dateScheduled IS NOT NULL THEN dateScheduled 
    ELSE datePosted 
END DESC limit 3;

