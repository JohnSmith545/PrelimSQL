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

-- Insert sample users (passwords are assumed to be hashed)
INSERT INTO Users (first_name, last_name, email, password_hash, role_id) 
VALUES 
('John', 'Doe', 'john.doe@student.edu', 'hashed_password_123', 1),
('Jane', 'Smith', 'jane.smith@faculty.edu', 'hashed_password_456', 2);

-- Create Posts Table
CREATE TABLE Posts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

-- Insert sample posts
INSERT INTO Posts (user_id, title, content) 
VALUES 
(1, 'Welcome to the forum', 'This is the first post in the forum! Feel free to interact.'),
(2, 'Faculty Announcements', 'Please be informed that the midterms will start next week.');

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

-- Insert sample comments
INSERT INTO Comments (post_id, user_id, content) 
VALUES 
(1, 1, 'Excited to see this forum in action!'),
(1, 2, 'Looking forward to meaningful discussions.');

-- Create Categories Table
CREATE TABLE Categories (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    category_name VARCHAR(100) NOT NULL
);

-- Insert sample categories
INSERT INTO Categories (category_name) VALUES ('General Discussion'), ('Faculty Announcements'), ('Assignments');

-- Create Post_Categories Table (for Many-to-Many relationship between Posts and Categories)
CREATE TABLE Post_Categories (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    post_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    FOREIGN KEY (post_id) REFERENCES Posts(id),
    FOREIGN KEY (category_id) REFERENCES Categories(id)
);

-- Insert sample post-category relationships
INSERT INTO Post_Categories (post_id, category_id) 
VALUES 
(1, 1), 
(2, 2);

-- Create Likes Table
CREATE TABLE Likes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    post_id INTEGER NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (post_id) REFERENCES Posts(id)
);

-- Insert sample likes
INSERT INTO Likes (user_id, post_id) 
VALUES 
(1, 1), 
(2, 1);

-- Create Notifications Table
CREATE TABLE Notifications (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    message TEXT NOT NULL,
    is_read BOOLEAN DEFAULT 0,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

-- Insert sample notifications
INSERT INTO Notifications (user_id, message, is_read) 
VALUES 
(1, 'You have a new comment on your post!', 0), 
(2, 'You have a new like on your post!', 1);
