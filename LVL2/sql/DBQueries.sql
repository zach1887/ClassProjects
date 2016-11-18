SELECT content FROM Posts 
    WHERE `postId` = ?;
    
SELECT * FROM Posts
   LEFT JOIN TagPostBridge
   ON Posts.PostId = TagPostBridge.PostId;
    
    