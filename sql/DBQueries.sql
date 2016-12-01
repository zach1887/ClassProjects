Use MakerSpace;

SELECT * FROM Posts
   LEFT JOIN TagPostBridge
   ON Posts.PostId = TagPostBridge.PostId;

INSERT INTO Posts
   VALUES 

CREATE TABLE `Posts`(
   `postId` INT AUTO_INCREMENT NOT NULL,
   `title` VARCHAR(60) NOT NULL,
   `author` VARCHAR(50) NOT NULL,
   `datePosted` DATE NOT NULL, 
   `content` Text,
   `status` INT,
   PRIMARY KEY(`postId`)
   );


INSERT into Comments(`comment`,`postId`)
  VALUES("This is a great post!",1);     
