DROP DATABASE IF EXISTS MakerSpace;
CREATE DATABASE MakerSpace;
USE MakerSpace;

CREATE TABLE `Posts`(
   `postId` INT AUTO_INCREMENT NOT NULL,
   `title` VARCHAR(60) NOT NULL,
   `author` VARCHAR(50) NOT NULL,
   `datePosted` DATE NOT NULL, 
   `content` VARCHAR(800),
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

CREATE TABLE `StaticPages` (
   `pageId` INT AUTO_INCREMENT NOT NULL, 
   `pageTitle` VARCHAR(60),
   `pageContent` TEXT,
   `status` INT,
   PRIMARY KEY(`pageId`)
   );
   
CREATE TABLE `Comments` (
   `commentId` INT AUTO_INCREMENT NOT NULL, 
   `comment` TEXT,
   `postId` INT,
   PRIMARY KEY(`commentId`)
   );
 
ALTER TABLE `Comments`
ADD CONSTRAINT fk_Posts2
FOREIGN KEY(`postId`)
REFERENCES `Posts`(`postId`); 

CREATE TABLE `StatusCodes` (
  `statusId` INT AUTO_INCREMENT NOT NULL, 
  `status` VARCHAR(50),
  PRIMARY KEY(`statusId`)
  );
   

