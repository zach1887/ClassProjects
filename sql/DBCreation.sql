DROP DATABASE IF EXISTS MakerSpace;
CREATE DATABASE MakerSpace;
USE MakerSpace;

CREATE TABLE `Posts`(
   `postId` INT AUTO_INCREMENT NOT NULL,
   `title` VARCHAR(60) NOT NULL,
   `author` VARCHAR(50) NOT NULL,
   `datePosted` DATE NOT NULL, 
   `content` Text,
   `status` INT,
   PRIMARY KEY(`postId`)
   );

CREATE TABLE `Tags` (
   `tagId` INT AUTO_INCREMENT NOT NULL,
   `tag` VARCHAR(60),
   PRIMARY KEY(`tagID`)
   );
   
CREATE TABLE `TagPostBridge` (
   `key` INT AUTO_INCREMENT NOT NULL, 
   `postId` INT NOT NULL, 
   `tagId` INT NOT NULL,
   PRIMARY KEY(`key`)
   );
   
ALTER TABLE `TagPostBridge`
ADD CONSTRAINT fk_Posts
FOREIGN KEY(`postId`)
REFERENCES `Posts`(`postId`);   

ALTER TABLE `TagPostBridge`
ADD CONSTRAINT fk_Tags
FOREIGN KEY(`tagId`)
REFERENCES `Tags`(`tagId`);      

-- CREATE TABLE `StaticPages` (
--    `pageId` INT AUTO_INCREMENT NOT NULL, 
--    `pageTitle` VARCHAR(60),
--    `pageContentId` TEXT,
--    `status` INT,
--    PRIMARY KEY(`pageId`)
--    );

CREATE TABLE `StaticPages` (
   `pageId` INT AUTO_INCREMENT NOT NULL, 
   `pageTitle` VARCHAR(60),
   `status` INT,
   `layout` INT,
   PRIMARY KEY(`pageId`)
   );
   
CREATE TABLE `StaticPageContents` (
	`pageId` INT,
    `content` TEXT 
);
   
ALTER TABLE `StaticPageContents`
ADD CONSTRAINT fk_PageIdContents
FOREIGN KEY(`pageId`)
REFERENCES `StaticPages`(`pageId`);   
   
CREATE TABLE `Comments` (
   `commentId` INT AUTO_INCREMENT NOT NULL, 
   `comment` TEXT,
   `postId` INT,
   `displayName` TEXT,
   `status` INT,
   PRIMARY KEY(`commentId`)
   );
 
-- ALTER TABLE `Comments`
-- ADD CONSTRAINT fk_Posts
-- FOREIGN KEY(`postId`)
-- REFERENCES `Posts`(`postId`); 

CREATE TABLE `StatusCodes` (
  `statusId` INT AUTO_INCREMENT NOT NULL, 
  `status` VARCHAR(50),
  PRIMARY KEY(`statusId`)
  );

INSERT INTO StatusCodes(`statusId`, `status`) VALUES
	(1, "Admin Post"), (2,"User Post Pending"), (3,"User Post Approved"),
    (4, "User Post Declined"), (5, "Admin Comment"), (6, "Reader Comment Pending"),
    (7, "Reader Comment Approved"), (8, "Reader Comment Declined"), (9, "Draft"),
    (10, "Pending Deletion"), (11, "Deleted");
 

 /*
        1 Admin Post
        2 User Post Pending
        3 User Post Approved
        4 User Post Declined
        5 Admin Comment
        6 Reader comment Pending
        7 Reader Comment Approved
        8 Reader Comment Declined
        9 Draft
        10 Pending Deletion
        11 Deleted
         */ 
  --
-- Table structure for table `users`
--
CREATE TABLE IF NOT EXISTS `users` (
 `user_id` int(11) NOT NULL AUTO_INCREMENT,
 `username` varchar(20) NOT NULL,
 `displayname` varchar(20) NOT NULL,
 `password` varchar(20) NOT NULL,
 `enabled` tinyint(1) NOT NULL,
 PRIMARY KEY (`user_id`),
 KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;
   
CREATE TABLE IF NOT EXISTS `authorities` (
 `username` varchar(20) NOT NULL,
 `authority` varchar(20) NOT NULL,
 KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `authorities`
 ADD CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`);
