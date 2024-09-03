INSERT INTO Users (UserID, Username, FirstName, LastName, DateOfBirth, Password)
VALUES
    (1, 'alicew', 'Alice', 'Walker', '1987-02-28', 'securePass123!'),
    (2, 'brandonc', 'Brandon', 'Carter', '1991-07-15', 'Brandon@91pass'),
    (3, 'carolynk', 'Carolyn', 'Kim', '1983-03-05', 'KimSecret*789'),
    (4, 'danielm', 'Daniel', 'Martinez', '1995-11-22', 'Martinez1995&'),
    (5, 'emmas', 'Emma', 'Stewart', '1992-09-10', 'Emma!Strong456');
    (6, 'samanthab', 'Samantha', 'Brown', '2001-03-15', 'SamStrongPass2020');

INSERT INTO Friends (FriendID, FriendWhoAdded, FriendBeingAdded, IsAccepted)
VALUES
    (1, 1, 5, TRUE),    -- Alice added Emma
    (2, 2, 3, TRUE),    -- Brandon added Carolyn
    (3, 3, 4, FALSE),   -- Carolyn added Daniel
    (4, 4, 2, TRUE),    -- Daniel added Brandon
    (5, 5, 1, FALSE);   -- Emma added Alice
    (6, 2, 1, TRUE),    -- Brandon is friends with Alice
    (7, 2, 5, TRUE);    -- Brandon is friends with Emma
    (8, 1, 3, FALSE),   -- Alice sent a friend request to Carolyn
    (9, 1, 4, TRUE);    -- Alice sent a friend request to Daniel

INSERT INTO Groups (GroupID, GroupName, CreatedBy)
VALUES
    (1, 'Nature Photographers', 1),    -- Created by Alice
    (2, 'Tech Innovators', 2),         -- Created by Brandon
    (3, 'Healthy Living', 3),          -- Created by Carolyn
    (4, 'Music Producers', 4),         -- Created by Daniel
    (5, 'Art Enthusiasts', 5);         -- Created by Emma
    (6, 'Hiking Lovers', 1),	       -- Created by Alice
    (7, 'Movie Buffs', 2);             -- Created by Brandon

INSERT INTO Posts (PostID, PostDescription, PostedBy, IsPublic, IsOnlyForFriends, GroupID)
VALUES
    (1, 'Captured a stunning sunset today!', 1, TRUE, FALSE, 1),     -- Alice's post in Nature Photographers
    (2, 'Excited about the new AI conference next month.', 2, FALSE, TRUE, 2), -- Brandon's post in Tech Innovators
    (3, 'Tried a new smoothie recipe, it’s amazing!', 3, TRUE, FALSE, 3),      -- Carolyn's post in Healthy Living
    (4, 'Recording my first album, feeling pumped!', 4, FALSE, TRUE, 4),       -- Daniel's post in Music Producers
    (5, 'Visited an art gallery today, incredible talent on display.', 5, TRUE, FALSE, 5); -- Emma's post in Art Enthusiasts
    (6, 'Just completed a new track for my album!', 4, TRUE, FALSE, 4),
    (7, 'Jamming session went great today!', 4, TRUE, FALSE, NULL);
    (8, 'Discussion on the latest tech trends!', 2, FALSE, TRUE, 2);

INSERT INTO GroupMembershipRequests (GroupMemberShipRequestsID, GroupID, GroupMemberUserID, IsGroupMemberShipAccepted)
VALUES
    (1, 1, 3, TRUE),    -- Carolyn requested to join Nature Photographers
    (2, 2, 4, FALSE),   -- Daniel requested to join Tech Innovators
    (3, 3, 1, TRUE),    -- Alice requested to join Healthy Living
    (4, 4, 5, FALSE),   -- Emma requested to join Music Producers
    (5, 5, 2, TRUE);    -- Brandon requested to join Art Enthusiasts
    (6, 1, 2, FALSE),   -- Brandon requested to join Nature Photographers
    (7, 3, 2, TRUE);    -- Brandon requested to join Healthy Living
    (8, 2, 6, FALSE);   -- Samantha requested to join Tech Innovators and is not yet accepted
