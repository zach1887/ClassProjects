USE MakerSpace;

insert into StaticPages(pageId, pageTitle, pageContent, `status`) values(3, 'Cool Page', '<h1>Cool Page</h1>', 1);
insert into Posts(postId, title, author, datePosted, content, `status`) values(1, 'Cool Post', 'Morgan Smith', '2016-11-28', 'This is the text of my blog post. Cool, huh?', 1);

select * from Posts;