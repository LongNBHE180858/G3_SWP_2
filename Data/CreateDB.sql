USE master;
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'OLIT')
BEGIN
    ALTER DATABASE OLIT SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE OLIT;
END
GO

CREATE DATABASE OLIT
GO

USE OLIT
GO

USE master;
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'OLIT')
BEGIN
    ALTER DATABASE OLIT SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE OLIT;
END
GO

CREATE DATABASE OLIT
GO

USE OLIT
GO

CREATE TABLE Role (
    RoleID INT PRIMARY KEY,
    RoleName NVARCHAR(10) CHECK (RoleName IN ('Admin', 'Expert', 'Student')) DEFAULT 'Other',
);

CREATE TABLE Account (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    RoleID INT FOREIGN KEY REFERENCES Role(RoleID),
    FullName NVARCHAR(100) NOT NULL,
    Gender NVARCHAR(10) CHECK (Gender IN ('Male', 'Female', 'Other')) DEFAULT 'Other',
    Email NVARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(20),
    Password NVARCHAR(255) NOT NULL,
    URLAvatar NVARCHAR(255),
    Status NVARCHAR(20) NOT NULL CHECK (Status IN ('active', 'warning', 'banned')) DEFAULT 'active',
    Address NVARCHAR(200),
    Birthday DATE
);

CREATE TABLE Setting (
    SettingID INT PRIMARY KEY,
    UserID INT FOREIGN KEY REFERENCES Account(UserID),
    SettingType NVARCHAR(50),
    SettingValue NVARCHAR(MAX),
    SettingOrder INT,
    SettingDecription NVARCHAR(255),
    SettingStatus BIT NOT NULL DEFAULT 0
);

CREATE TABLE PostCategory (
    CategoryID INT PRIMARY KEY,
    CategoryName NVARCHAR(100) NOT NULL,
    URL NVARCHAR(255)
);

CREATE TABLE Post (
    PostID INT PRIMARY KEY,
    UserID INT FOREIGN KEY REFERENCES Account(UserID),
    CategoryID INT FOREIGN KEY REFERENCES PostCategory(CategoryID),
    BlogTitle NVARCHAR(255) NOT NULL,
    PostDetails NVARCHAR(MAX),
    Status BIT NOT NULL DEFAULT 0,
    UpdatedDate DATETIME,
    ThumbnailURL NVARCHAR(255)
);

CREATE TABLE Subject (
    SubjectID INT PRIMARY KEY,
    SubjectName NVARCHAR(100) NOT NULL,
    Category NVARCHAR(50),
    OwnerID INT,
    NumOfLessons INT,
    Status BIT NOT NULL DEFAULT 0
);
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    SubjectID INT FOREIGN KEY REFERENCES Subject(SubjectID),
    CourseTitle NVARCHAR(255) NOT NULL,
    CourseTag NVARCHAR(100),
    URLCourse NVARCHAR(255),
    CourseDetail NVARCHAR(MAX),
    CourseLevel NVARCHAR(50),
    FeatureFlag NVARCHAR(50),
    Status BIT NOT NULL DEFAULT 0,
    CourseraDuration INT
);

CREATE TABLE CourseSection (
    SectionID INT PRIMARY KEY,
    CourseID INT FOREIGN KEY REFERENCES Course(CourseID),
    SectionTitle NVARCHAR(255) NOT NULL,
);

CREATE TABLE SectionModule (
    ModuleID INT PRIMARY KEY,
    SectionID INT FOREIGN KEY REFERENCES CourseSection(SectionID),
    ModuleTitle NVARCHAR(255) NOT NULL,
);

CREATE TABLE PricePackage (
    PackageID INT PRIMARY KEY,
    CourseID INT FOREIGN KEY REFERENCES Course(CourseID),
    Name NVARCHAR(100) NOT NULL,
    AccessDuration INT,
    ListPrice DECIMAL(18,2),
    SalePrice DECIMAL(18,2),
    Status BIT NOT NULL DEFAULT 0,
    Description NVARCHAR(MAX)
);

CREATE TABLE Registration (
    RegistrationID INT PRIMARY KEY,
    UserID INT FOREIGN KEY REFERENCES Account(UserID),
    CourseID INT FOREIGN KEY REFERENCES Course(CourseID),
    PackageID INT FOREIGN KEY REFERENCES PricePackage(PackageID),
    ApprovedBy INT FOREIGN KEY REFERENCES Account(UserID),
    Status NVARCHAR(20) NOT NULL CHECK (Status IN ('Pending', 'Approved', 'NotApprove')) DEFAULT 'Pending',
    ValidTo DATE,
    ValidFrom DATE
);

CREATE TABLE Lesson (
    LessonID INT PRIMARY KEY,
    ModuleID INT FOREIGN KEY REFERENCES SectionModule(ModuleID),
    LessonTitle NVARCHAR(255) NOT NULL,
    LessonDetails NVARCHAR(MAX),
    Status BIT NOT NULL DEFAULT 0,
    URLLesson NVARCHAR(255) NOT NULL,
    [Order] INT
);

CREATE TABLE Quiz (
    QuizID INT PRIMARY KEY,
    SectionID INT FOREIGN KEY REFERENCES CourseSection(SectionID),
    QuizName NVARCHAR(100) NOT NULL,
    PassRate DECIMAL(5,2),
    QuizType NVARCHAR(50),
    QuizDuration INT,
    QuizLevel NVARCHAR(50),
    Status BIT NOT NULL DEFAULT 0
);

CREATE TABLE QuizAttempt (
    AttemptID INT PRIMARY KEY,
    UserID INT FOREIGN KEY REFERENCES Account(UserID),
    QuizID INT FOREIGN KEY REFERENCES Quiz(QuizID),
    StartTime DATETIME,
    EndTime DATETIME,
    TotalScore DECIMAL(5,2)
);

CREATE TABLE Question (
    QuestionID INT PRIMARY KEY,
    QuestionContent NVARCHAR(MAX) NOT NULL,
    Answer1 NVARCHAR(MAX),
    Answer2 NVARCHAR(MAX),
    Answer3 NVARCHAR(MAX),
    Answer4 NVARCHAR(MAX),
    Solution NVARCHAR(MAX),
    QuestionType NVARCHAR(50),
    Status BIT NOT NULL DEFAULT 0,
    QuestionLevel NVARCHAR(50),
    MediaURL NVARCHAR(255)
);

CREATE TABLE QuizQuestion (
    QuizQuestionID INT PRIMARY KEY,
    QuizID INT FOREIGN KEY REFERENCES Quiz(QuizID),
    QuestionID INT FOREIGN KEY REFERENCES Question(QuestionID),
    QuestionOrder INT,
    Points DECIMAL(5,2) DEFAULT 1.0
);

CREATE TABLE UserAnswer (
    AnswerID INT PRIMARY KEY,
    QuestionID INT FOREIGN KEY REFERENCES Question(QuestionID),
    AttemptID INT FOREIGN KEY REFERENCES QuizAttempt(AttemptID),
    UserAnswerContent NVARCHAR(MAX),
    IsCorrect BIT NOT NULL DEFAULT 0
);

ALTER TABLE Subject ADD CONSTRAINT FK_Subject_Owner FOREIGN KEY (OwnerID) REFERENCES Account(UserID);

CREATE TABLE Slider (
    SliderID INT PRIMARY KEY,
    UserID INT FOREIGN KEY REFERENCES Account(UserID),
    CourseID INT FOREIGN KEY REFERENCES Course(CourseID),
    Title NVARCHAR(255) NOT NULL,
    ImageURL NVARCHAR(255),
    Backlink NVARCHAR(255),
    Status BIT NOT NULL DEFAULT 0,
    Notes NVARCHAR(MAX),
    DisplayOrder INT,
    ValidFrom DATE
);

CREATE TABLE Review (
    ReviewID INT PRIMARY KEY,
    UserID INT FOREIGN KEY REFERENCES Account(UserID),
    CourseID INT FOREIGN KEY REFERENCES Course(CourseID),
    Content NVARCHAR(MAX),
    Star INT CHECK (Star BETWEEN 1 AND 5),
    CreatedAt DATETIME DEFAULT GETDATE(),
    Status BIT NOT NULL DEFAULT 1, -- 1: Hiển thị, 0: Ẩn
	ImageURL NVARCHAR(255) NULL
);