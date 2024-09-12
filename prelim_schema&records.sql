DROP TABLE customers;
DROP TABLE orders;
DROP TABLE shippings;

-- Create Roles Table
CREATE TABLE Roles (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    role_name VARCHAR(50) NOT NULL
);

-- Insert sample roles
INSERT INTO Roles (role_name) VALUES ('Student'), ('Faculty');

-- Create Users Table
CREATE TABLE Users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role_id INTEGER NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (role_id) REFERENCES Roles(id)
);

-- Insert sample users (10 records)
INSERT INTO Users (first_name, last_name, email, password_hash, role_id) 
VALUES 
('John', 'Doe', 'john.doe@student.edu', 'hashed_password_123', 1),
('Jane', 'Smith', 'jane.smith@faculty.edu', 'hashed_password_456', 2),
('Alice', 'Johnson', 'alice.johnson@student.edu', 'hashed_password_789', 1),
('Bob', 'Williams', 'bob.williams@student.edu', 'hashed_password_012', 1),
('Charlie', 'Brown', 'charlie.brown@student.edu', 'hashed_password_345', 1),
('David', 'Miller', 'david.miller@faculty.edu', 'hashed_password_678', 2),
('Emily', 'Davis', 'emily.davis@student.edu', 'hashed_password_901', 1),
('Frank', 'Wilson', 'frank.wilson@faculty.edu', 'hashed_password_234', 2),
('Grace', 'Moore', 'grace.moore@student.edu', 'hashed_password_567', 1),
('Henry', 'Taylor', 'henry.taylor@faculty.edu', 'hashed_password_890', 2);

-- Create Posts Table
CREATE TABLE Posts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

-- Insert sample posts (10 records)
INSERT INTO Posts (user_id, title, content) 
VALUES 
(1, 'Welcome to the forum', 'This is the first post in the forum! Feel free to interact.'),
(2, 'Faculty Announcements', 'Please be informed that the midterms will start next week.'),
(3, 'Introduction to Programming', 'Let’s discuss the basics of programming.'),
(4, 'JavaScript Help', 'I need help with a JavaScript project.'),
(5, 'Database Design', 'Looking for tips on database normalization.'),
(6, 'Assignment Deadline Extended', 'The deadline for the assignment has been extended.'),
(7, 'Group Project Discussion', 'Please join the discussion for the upcoming group project.'),
(8, 'New Faculty Office Hours', 'Here are my updated office hours.'),
(9, 'Exam Preparation Tips', 'Let’s share tips for exam preparation.'),
(10, 'General Discussion', 'Open topic for any discussions you want to start.');

-- Create Comments Table
CREATE TABLE Comments (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    post_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    content TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES Posts(id),
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

-- Insert sample comments (10 records)
INSERT INTO Comments (post_id, user_id, content) 
VALUES 
(1, 1, 'Excited to see this forum in action!'),
(1, 2, 'Looking forward to meaningful discussions.'),
(3, 3, 'I love learning programming.'),
(4, 4, 'Can someone explain closures in JavaScript?'),
(5, 5, 'Normalization is crucial for performance.'),
(6, 6, 'Thanks for the deadline extension!'),
(7, 7, 'I am interested in joining the project discussion.'),
(8, 8, 'Here are my preferred times to meet.'),
(9, 9, 'I think we should focus on past exam papers.'),
(10, 10, 'This is a great platform for open discussion.');

-- Create Categories Table
CREATE TABLE Categories (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    category_name VARCHAR(100) NOT NULL
);

-- Insert sample categories (3 records)
INSERT INTO Categories (category_name) 
VALUES 
('General Discussion'), 
('Faculty Announcements'), 
('Assignments');

-- Create Post_Categories Table (for Many-to-Many relationship between Posts and Categories)
CREATE TABLE Post_Categories (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    post_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    FOREIGN KEY (post_id) REFERENCES Posts(id),
    FOREIGN KEY (category_id) REFERENCES Categories(id)
);

-- Insert sample post-category relationships (10 records)
INSERT INTO Post_Categories (post_id, category_id) 
VALUES 
(1, 1), 
(2, 2), 
(3, 1), 
(4, 1), 
(5, 1), 
(6, 2), 
(7, 1), 
(8, 2), 
(9, 1), 
(10, 1);

-- Create Likes Table
CREATE TABLE Likes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    post_id INTEGER NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (post_id) REFERENCES Posts(id)
);

-- Insert sample likes (10 records)
INSERT INTO Likes (user_id, post_id) 
VALUES 
(1, 1), 
(2, 1), 
(3, 3), 
(4, 4), 
(5, 5), 
(6, 6), 
(7, 7), 
(8, 8), 
(9, 9), 
(10, 10);

-- Create Notifications Table
CREATE TABLE Notifications (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    message TEXT NOT NULL,
    is_read BOOLEAN DEFAULT 0,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

-- Insert sample notifications (10 records)
INSERT INTO Notifications (user_id, message, is_read) 
VALUES 
(1, 'You have a new comment on your post!', 0), 
(2, 'Your post has a new comment.', 1), 
(3, 'You have a new like on your post.', 0), 
(4, 'Your post was liked by another user.', 1), 
(5, 'A new comment was added to your post.', 0), 
(6, 'You have a new notification.', 1), 
(7, 'Someone commented on your post.', 0), 
(8, 'You received a new like.', 1), 
(9, 'New discussion started.', 0), 
(10, 'You have unread notifications.', 1);
