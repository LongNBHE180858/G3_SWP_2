USE OLIT
GO

-- Thêm dữ liệu vào bảng Role
INSERT INTO Role (RoleID, RoleName) VALUES
(1, 'Admin'),
(2, 'Expert'),
(3, 'Student');

-- Thêm dữ liệu vào bảng Account
INSERT INTO Account (RoleID, FullName, Gender, Email, PhoneNumber, Password, URLAvatar, Status, Address, Birthday) VALUES
-- 1 Admin
(1, N'Nguyễn Bá Long', 'Male', 'longnbhe180858@fpt.edu.vn', '0123456789', '12345678@L', 'https://img.tripi.vn/cdn-cgi/image/width=700,height=700/https://gcs.tripi.vn/public-tripi/tripi-feed/img/482744KVW/anh-mo-ta.png', 'active', N'Hà Nội, Việt Nam', '1995-05-15'),

-- 2 Expert
(2, N'Trần Thị Minh', 'Female', 'minhtthe170234@fpt.edu.vn', '0987654321', '12345678@L', 'https://bareskin.vn/wp-content/uploads/2025/05/hinh-avatar-dep-nhat-the-gioi-15.jpg', 'active', N'Hồ Chí Minh, Việt Nam', '1988-08-20'),
(2, N'Lê Văn Hùng', 'Male', 'hunglvhe160567@fpt.edu.vn', '0369852147', '12345678@L', 'https://cellphones.com.vn/sforum/wp-content/uploads/2024/02/anh-avatar-ngau-2.jpg', 'active', N'Đà Nẵng, Việt Nam', '1990-12-03'),

-- 3 Student
(3, N'Phạm Thị Lan', 'Female', 'lanpthe190123@fpt.edu.vn', '0456789123', '12345678@L', 'https://www.vietnamworks.com/hrinsider/wp-content/uploads/2023/12/anh-den-ngau.jpeg', 'active', N'Hải Phòng, Việt Nam', '2001-03-10'),
(3, N'Vũ Minh Tuấn', 'Male', 'tuanvmhe190456@fpt.edu.vn', '0789123456', '12345678@L', 'https://toigingiuvedep.vn/wp-content/uploads/2021/01/avatar-dep-cute.jpg', 'active', N'Cần Thơ, Việt Nam', '2000-11-25'),
(3, N'Hoàng Thị Thu', 'Female', 'thuhtse190789@fpt.edu.vn', '0321654987', '12345678@L', 'https://chiemtaimobile.vn/images/companies/1/%E1%BA%A2nh%20Blog/avatar-facebook-dep/top-36-anh-dai-dien-dep-cho-nu/hinh-anh-hut-thuoc-ngau-anime-nu-facebook.jpg?1708402451277', 'active', N'Huế, Việt Nam', '2002-07-18');

-- Thêm dữ liệu vào bảng PostCategory
INSERT INTO PostCategory (CategoryID, CategoryName, URL) VALUES
(1, N'Tin tức giáo dục', 'education-news'),
(2, N'Hướng dẫn học tập', 'study-guide'),
(3, N'Công nghệ', 'technology'),
(4, N'Kinh nghiệm học tập', 'learning-experience'),
(5, N'Sự kiện', 'events'),
(6, N'Lập trình', 'programming'),
(7, N'Thiết kế web', 'web-design'),
(8, N'Khởi nghiệp', 'startup'),
(9, N'Tài chính cá nhân', 'personal-finance'),
(10, N'Phát triển kỹ năng', 'skill-development'),
(11, N'Nghề nghiệp', 'career'),
(12, N'Đánh giá khóa học', 'course-review'),
(13, N'Thủ thuật học tập', 'study-tips'),
(14, N'Công cụ học tập', 'learning-tools'),
(15, N'Xu hướng IT', 'it-trends'),
(16, N'Phỏng vấn xin việc', 'job-interview'),
(17, N'Freelance', 'freelance'),
(18, N'Chứng chỉ IT', 'it-certification'),
(19, N'Học bổng', 'scholarship'),
(20, N'Kỹ năng mềm', 'soft-skills');

-- Thêm dữ liệu vào bảng Post
INSERT INTO Post (PostID, UserID, CategoryID, BlogTitle, PostDetails, Status, UpdatedDate, ThumbnailURL) VALUES
(1, 1, 1, N'Xu hướng giáo dục trực tuyến 2024', N'Bài viết về những xu hướng mới trong giáo dục điện tử...', 1, '2024-05-15 10:30:00', 'https://gitiho.com/caches/p_medium_large//uploads/315313/images/image_xu-huong-elearning-1.jpg'),
(2, 2, 2, N'5 mẹo học hiệu quả', N'Những phương pháp học tập được chứng minh hiệu quả...', 1, '2024-05-10 14:20:00', 'https://edubit.vn/data/blog/photo_1631782135.jpg?v=1631782136'),
(3, 3, 3, N'AI trong giáo dục', N'Ứng dụng trí tuệ nhân tạo trong việc học và dạy...', 1, '2024-05-08 09:15:00', 'https://askany.com/_next/image?url=https%3A%2F%2Fd2czqxs5dso3qv.cloudfront.net%2Fimages%2Fb16fce83-f812-4b32-802d-7aac6fb27101.png&w=1920&q=75'),
(4, 2, 4, N'Kinh nghiệm thi chứng chỉ IT', N'Chia sẻ kinh nghiệm chuẩn bị và thi các chứng chỉ IT...', 1, '2024-05-05 16:45:00', 'https://edusa.vn/wp-content/uploads/2023/11/cac-loai-chung-chi-tin-hoc-cho-sinh-vien-1.webp'),
(5, 1, 5, N'Sự kiện EdTech Vietnam 2024', N'Thông tin về hội thảo công nghệ giáo dục lớn nhất năm...', 1, '2024-05-01 11:00:00', 'https://sp-ao.shortpixel.ai/client/to_webp,q_glossy,ret_img,w_1620,h_1080/https://vku.udn.vn/wp-content/uploads/2024/07/VKU-37-3.jpg');

-- Thêm dữ liệu vào bảng Subject
INSERT INTO Subject (SubjectID, SubjectName, Category, OwnerID, NumOfLessons, Status) VALUES
(1, N'Lập trình Java cơ bản', N'Programming', 2, 20, 1),
(2, N'Thiết kế cơ sở dữ liệu', N'Database', 3, 15, 1),
(3, N'Phát triển Web Frontend', N'Web Development', 2, 25, 1),
(4, N'Marketing số', N'Marketing', 3, 12, 1),
(5, N'Quản lý dự án IT', N'Management', 2, 18, 1);

-- Thêm dữ liệu vào bảng Course
INSERT INTO Course (CourseID, SubjectID, CourseTitle, CourseTag, URLCourse, CourseDetail, CourseLevel, FeatureFlag, Status, CourseraDuration) VALUES
(1, 1, N'Nhập môn Java Programming', N'java,programming,beginner', 'https://i.ytimg.com/vi/ptOjDnsLOCc/mqdefault.jpg', N'Khóa học cơ bản về lập trình Java', N'Beginner', N'featured', 1, 40),
(2, 2, N'Thiết kế Database với MySQL', N'database,mysql,design', 'https://image.vietnix.vn/wp-content/uploads/2023/11/thiet-lap-co-so-du-lieu-tu-xa-voi-mysql-tren-ubuntu-20-04.png', N'Học cách thiết kế và tối ưu database', N'Intermediate', N'popular', 1, 30),
(3, 3, N'React.js cho người mới bắt đầu', N'react,javascript,frontend', 'https://cdn2.fptshop.com.vn/unsafe/1920x0/filters:format(webp):quality(75)/2023_12_28_638393296838948284_reactjs.jpg', N'Xây dựng ứng dụng web với React', N'Beginner', N'new', 1, 50),
(4, 4, N'Digital Marketing Strategy', N'marketing,digital,strategy', 'https://www.creationinfoways.com/blog/uploading/687193083.jpg', N'Chiến lược marketing số hiệu quả', N'Intermediate', N'trending', 1, 35),
(5, 5, N'Agile Project Management', N'agile,project,management', 'https://miro.medium.com/v2/resize:fit:1024/0*jlUybkZYz6yxWtdk.jpg', N'Quản lý dự án theo phương pháp Agile', N'Advanced', N'featured', 1, 25);

-- Thêm dữ liệu vào bảng PricePackage
INSERT INTO PricePackage (PackageID, CourseID, Name, AccessDuration, ListPrice, SalePrice, Status, Description) VALUES
(1, 1, N'Gói cơ bản', 30, 500000.00, 400000.00, 1, N'Truy cập khóa học trong 30 ngày'),
(2, 1, N'Gói mở rộng', 90, 1200000.00, 1000000.00, 1, N'Truy cập khóa học trong 90 ngày + tài liệu'),
(3, 2, N'Gói tiêu chuẩn', 60, 800000.00, 650000.00, 1, N'Truy cập khóa học trong 60 ngày'),
(4, 3, N'Gói cơ bản', 45, 700000.00, 600000.00, 1, N'Truy cập khóa học trong 45 ngày'),
(5, 4, N'Gói premium', 120, 1500000.00, 1200000.00, 1, N'Truy cập không giới hạn + mentor support');

-- Thêm dữ liệu vào bảng Registration
INSERT INTO Registration (RegistrationID, UserID, CourseID, PackageID, ApprovedBy, Status, ValidFrom, ValidTo) VALUES
(1, 4, 1, 1, 1, 'Approved', '2024-05-01', '2024-05-31'),
(2, 5, 2, 3, 1, 'Approved', '2024-05-05', '2024-07-04'),
(3, 6, 3, 4, 1, 'Approved', '2024-05-10', '2024-06-24'),
(4, 4, 4, 5, 1, 'Pending', '2024-05-15', '2024-09-12'),
(5, 5, 1, 2, 1, 'Approved', '2024-05-12', '2024-08-10');


-- Insert CourseSection
INSERT INTO CourseSection (SectionID, CourseID, SectionTitle) VALUES
(1, 1, N'Section 1: Tổng quan dự án'),
(2, 1, N'Section 2: Cơ bản về Java'),
(3, 1, N'Section 3: Ứng dụng thực tế'),

(4, 2, N'Section 1: Thiết kế cơ bản'),
(5, 2, N'Section 2: Quan hệ và chuẩn hóa'),
(6, 2, N'Section 3: Thực hành nâng cao'),

(7, 3, N'Section 1: Làm quen với React'),
(8, 3, N'Section 2: Component và Props'),
(9, 3, N'Section 3: State và vòng đời'),

(10, 4, N'Section 1: Tổng quan Digital Marketing'),
(11, 4, N'Section 2: Các kênh phổ biến'),
(12, 4, N'Section 3: Phân tích chiến dịch'),

(13, 5, N'Section 1: Tổng quan Agile'),
(14, 5, N'Section 2: Scrum Framework'),
(15, 5, N'Section 3: Agile trong thực tiễn');

-- Insert SectionModule
INSERT INTO SectionModule (ModuleID, SectionID, ModuleTitle) VALUES
-- Course 1
(1, 1, N'Module 1: Giới thiệu & Mở đầu'),
(2, 1, N'Module 2: Mục tiêu học tập'),

(3, 2, N'Module 1: Cấu trúc chương trình Java'),
(4, 2, N'Module 2: Biến và kiểu dữ liệu'),
(5, 2, N'Module 3: Câu lệnh điều kiện'),

(6, 3, N'Module 1: Viết ứng dụng Console'),
(7, 3, N'Module 2: Đọc ghi file'),

-- Course 2
(8, 4, N'Module 1: Giới thiệu về MySQL'),
(9, 4, N'Module 2: Cài đặt và cấu hình'),

(10, 5, N'Module 1: Thiết kế bảng'),
(11, 5, N'Module 2: Mối quan hệ giữa bảng'),

(12, 6, N'Module 1: Truy vấn nâng cao'),

-- Course 3
(13, 7, N'Module 1: React là gì?'),
(14, 7, N'Module 2: Cài đặt môi trường'),

(15, 8, N'Module 1: Component cơ bản'),
(16, 8, N'Module 2: Props và Event'),

(17, 9, N'Module 1: State và useState'),
(18, 9, N'Module 2: Vòng đời component'),

-- Course 4
(19, 10, N'Module 1: Marketing truyền thống vs số'),
(20, 10, N'Module 2: Xu hướng hiện tại'),

(21, 11, N'Module 1: SEO và SEM'),
(22, 11, N'Module 2: Social Media Marketing'),

(23, 12, N'Module 1: Đánh giá hiệu quả'),

-- Course 5
(24, 13, N'Module 1: Nguyên lý Agile'),
(25, 13, N'Module 2: Agile Manifesto'),

(26, 14, N'Module 1: Scrum Roles'),
(27, 14, N'Module 2: Scrum Events'),

(28, 15, N'Module 1: Triển khai Agile'),
(29, 15, N'Module 2: Công cụ hỗ trợ');

INSERT INTO Lesson (LessonID, ModuleID, LessonTitle, LessonDetails, Status, URLLesson, [Order]) VALUES
-- Module 1: Giới thiệu & Mở đầu (Course 1)
(1, 1, N'Bài 1: Giới thiệu khóa học', N'Giới thiệu tổng quan về khóa học Java', 1, 'https://www.youtube.com/watch?v=3gtOAlcovoQ&list=PL33lvabfss1yGrOutFR03OZoqm91TSsvs', 1),
(2, 1, N'Bài 2: Mục tiêu học tập', N'Những điều bạn sẽ học được sau khóa học', 1, 'https://lesson.com/java/2', 2),

-- Module 2: Mục tiêu học tập (Course 1)
(3, 2, N'Bài 1: Hướng dẫn học hiệu quả', N'Cách tận dụng khóa học tối đa', 1, 'https://lesson.com/java/3', 1),

-- Module 3: Cấu trúc chương trình Java
(4, 3, N'Bài 1: Hàm main và cú pháp cơ bản', N'Giới thiệu hàm main()', 1, 'https://lesson.com/java/4', 1),
(5, 3, N'Bài 2: Tệp .java và .class', N'Cách chương trình Java được biên dịch', 1, 'https://lesson.com/java/5', 2),

-- Module 4: Biến và kiểu dữ liệu
(6, 4, N'Bài 1: Kiểu dữ liệu cơ bản', N'int, float, String...', 1, 'https://lesson.com/java/6', 1),
(7, 4, N'Bài 2: Khai báo và gán giá trị', N'Kỹ thuật khai báo biến', 1, 'https://lesson.com/java/7', 2),
(8, 4, N'Bài 3: Biến hằng số', N'Sử dụng final trong Java', 1, 'https://lesson.com/java/8', 3),

-- Module 5: Câu lệnh điều kiện
(9, 5, N'Bài 1: if/else', N'Cấu trúc điều kiện trong Java', 1, 'https://lesson.com/java/9', 1),
(10, 5, N'Bài 2: switch/case', N'Sử dụng switch để tối ưu code', 1, 'https://lesson.com/java/10', 2),

-- Module 6: Viết ứng dụng Console
(11, 6, N'Bài 1: In ra màn hình', N'Dùng System.out.print()', 1, 'https://lesson.com/java/11', 1),
(12, 6, N'Bài 2: Nhập từ bàn phím', N'Scanner class', 1, 'https://lesson.com/java/12', 2),

-- Module 7: Đọc ghi file
(13, 7, N'Bài 1: FileWriter và FileReader', N'Đọc ghi file văn bản đơn giản', 1, 'https://lesson.com/java/13', 1),

-- Module 8: Giới thiệu về MySQL
(14, 8, N'Bài 1: Lịch sử và ứng dụng của MySQL', N'Tại sao MySQL phổ biến', 1, 'https://lesson.com/mysql/1', 1),

-- Module 9: Cài đặt và cấu hình
(15, 9, N'Bài 1: Cài đặt trên Windows', N'Tải về và cài đặt MySQL', 1, 'https://lesson.com/mysql/2', 1),
(16, 9, N'Bài 2: Cấu hình ban đầu', N'Tạo user, cấp quyền', 1, 'https://lesson.com/mysql/3', 2),

-- Module 10: Thiết kế bảng
(17, 10, N'Bài 1: Các kiểu dữ liệu phổ biến', N'VARCHAR, INT, DATE...', 1, 'https://lesson.com/mysql/4', 1),

-- Module 11: Mối quan hệ giữa bảng
(18, 11, N'Bài 1: Primary Key & Foreign Key', N'Tạo mối quan hệ giữa bảng', 1, 'https://lesson.com/mysql/5', 1),

-- Module 12: Truy vấn nâng cao
(19, 12, N'Bài 1: JOIN các bảng', N'LEFT JOIN, INNER JOIN...', 1, 'https://lesson.com/mysql/6', 1),
(20, 12, N'Bài 2: Subquery', N'Sử dụng lồng câu truy vấn', 1, 'https://lesson.com/mysql/7', 2),

-- Module 13: React là gì?
(21, 13, N'Bài 1: Giới thiệu ReactJS', N'Lịch sử và ưu điểm của React', 1, 'https://lesson.com/react/1', 1),

-- Module 14: Cài đặt môi trường
(22, 14, N'Bài 1: Cài đặt NodeJS & npm', N'Thiết lập môi trường cho React', 1, 'https://lesson.com/react/2', 1),

-- Module 15: Component cơ bản
(23, 15, N'Bài 1: Tạo component đầu tiên', N'Dùng function component', 1, 'https://lesson.com/react/3', 1),
(24, 15, N'Bài 2: Props là gì?', N'Truyền dữ liệu giữa component', 1, 'https://lesson.com/react/4', 2),

-- Module 16: Props và Event
(25, 16, N'Bài 1: Xử lý sự kiện', N'onClick, onChange...', 1, 'https://lesson.com/react/5', 1),

-- Module 17: State và useState
(26, 17, N'Bài 1: useState Hook', N'Tạo state trong function component', 1, 'https://lesson.com/react/6', 1),

-- Module 18: Vòng đời component
(27, 18, N'Bài 1: useEffect Hook', N'Thực hiện hành động khi render', 1, 'https://lesson.com/react/7', 1),

-- Module 19: Marketing truyền thống vs số
(28, 19, N'Bài 1: So sánh mô hình cũ và mới', N'Phân biệt hai phương pháp', 1, 'https://lesson.com/mkt/1', 1),

-- Module 20: Xu hướng hiện tại
(29, 20, N'Bài 1: Marketing trên TikTok', N'Chiến lược nội dung video ngắn', 1, 'https://lesson.com/mkt/2', 1),

-- Module 21: SEO và SEM
(30, 21, N'Bài 1: Tối ưu hóa từ khóa', N'Cách SEO giúp tăng traffic', 1, 'https://lesson.com/mkt/3', 1),

-- Module 22: Social Media Marketing
(31, 22, N'Bài 1: Facebook Ads cơ bản', N'Chạy quảng cáo trên Facebook', 1, 'https://lesson.com/mkt/4', 1),

-- Module 23: Đánh giá hiệu quả
(32, 23, N'Bài 1: Chỉ số đo lường ROI', N'Cách xác định hiệu quả chiến dịch', 1, 'https://lesson.com/mkt/5', 1),

-- Module 24: Nguyên lý Agile
(33, 24, N'Bài 1: Agile Manifesto', N'4 giá trị cốt lõi của Agile', 1, 'https://lesson.com/agile/1', 1),

-- Module 25: Agile Manifesto
(34, 25, N'Bài 1: Các nguyên lý Agile', N'12 nguyên lý trong Agile Manifesto', 1, 'https://lesson.com/agile/2', 1),

-- Module 26: Scrum Roles
(35, 26, N'Bài 1: Product Owner', N'Trách nhiệm và vai trò', 1, 'https://lesson.com/agile/3', 1),
(36, 26, N'Bài 2: Scrum Master', N'Đảm bảo quy trình Scrum vận hành tốt', 1, 'https://lesson.com/agile/4', 2),

-- Module 27: Scrum Events
(37, 27, N'Bài 1: Sprint Planning', N'Lên kế hoạch cho Sprint', 1, 'https://lesson.com/agile/5', 1),

-- Module 28: Triển khai Agile
(38, 28, N'Bài 1: Agile tại doanh nghiệp', N'Ví dụ triển khai thực tế', 1, 'https://lesson.com/agile/6', 1),

-- Module 29: Công cụ hỗ trợ
(39, 29, N'Bài 1: Sử dụng Jira', N'Theo dõi tiến độ trong Agile', 1, 'https://lesson.com/agile/7', 1);

INSERT INTO Quiz (QuizID, SectionID, QuizName, PassRate, QuizType, QuizDuration, QuizLevel, Status) VALUES
(1, 1, N'Kiểm tra Java cơ bản', 70.00, N'Multiple Choice', 30, N'Beginner', 1),
(2, 2, N'Quiz thiết kế Database', 75.00, N'Mixed', 45, N'Intermediate', 1),
(3, 3, N'React Fundamentals Test', 65.00, N'Multiple Choice', 25, N'Beginner', 1),
(4, 4, N'Digital Marketing Quiz', 80.00, N'True/False', 20, N'Intermediate', 1),
(5, 5, N'Agile Methodology Test', 85.00, N'Mixed', 40, N'Advanced', 1),
(6, 6, N'Python Data Science Quiz', 75.00, N'Multiple Choice', 35, N'Intermediate', 1),
(7, 7, N'Node.js API Test', 70.00, N'Mixed', 40, N'Intermediate', 1),
(8, 8, N'Flutter Basics Quiz', 65.00, N'Multiple Choice', 25, N'Beginner', 1),
(9, 9, N'DevOps Tools Test', 80.00, N'Mixed', 45, N'Advanced', 1),
(10, 10, N'UI/UX Design Quiz', 60.00, N'Multiple Choice', 20, N'Beginner', 1),
(11, 11, N'Cybersecurity Test', 85.00, N'Mixed', 50, N'Intermediate', 1),
(12, 12, N'Machine Learning Quiz', 90.00, N'Multiple Choice', 60, N'Advanced', 1),
(13, 13, N'WordPress Dev Test', 65.00, N'Multiple Choice', 25, N'Beginner', 1),
(14, 14, N'Unity Game Dev Quiz', 75.00, N'Mixed', 40, N'Intermediate', 1),
(15, 15, N'Blockchain Fundamentals', 80.00, N'Multiple Choice', 35, N'Advanced', 1);

-- Thêm dữ liệu vào bảng Question
INSERT INTO Question (QuestionID, QuestionContent, Answer1, Answer2, Answer3, Answer4, Solution, QuestionType, Status, QuestionLevel, MediaURL) VALUES
(1, N'Java là ngôn ngữ lập trình thuộc loại nào?', 
   N'Ngôn ngữ lập trình hướng đối tượng', 
   N'Ngôn ngữ lập trình thủ tục', 
   N'Ngôn ngữ lập trình hàm', 
   N'Ngôn ngữ assembly', 
   N'Ngôn ngữ lập trình hướng đối tượng', N'Multiple Choice', 1, N'Beginner', NULL),

(2, N'Khóa chính (Primary Key) trong database có tác dụng gì?', 
   N'Định danh duy nhất cho mỗi bản ghi trong bảng', 
   N'Tăng tốc độ truy vấn dữ liệu', 
   N'Mã hóa dữ liệu trong bảng', 
   N'Sao lưu dữ liệu tự động', 
   N'Định danh duy nhất cho mỗi bản ghi trong bảng', N'Multiple Choice', 1, N'Beginner', NULL),

(3, N'JSX là gì trong React?', 
   N'JavaScript XML - cú pháp mở rộng cho JavaScript', 
   N'Java Syntax Extension', 
   N'JSON eXtended', 
   N'JavaScript eXecutable', 
   N'JavaScript XML - cú pháp mở rộng cho JavaScript', N'Multiple Choice', 1, N'Beginner', NULL),

(4, N'SEO viết tắt của từ nào?', 
   N'Search Engine Optimization', 
   N'System Engineering Operations', 
   N'Software Engineering Organization', 
   N'Security Enhancement Options', 
   N'Search Engine Optimization', N'Multiple Choice', 1, N'Beginner', NULL),

(5, N'Scrum là một framework của phương pháp nào?', 
   N'Agile methodology', 
   N'Waterfall methodology', 
   N'DevOps methodology', 
   N'Lean methodology', 
   N'Agile methodology', N'Multiple Choice', 1, N'Intermediate', NULL),

(6, N'Trong Java, từ khóa "static" có ý nghĩa gì?', 
   N'Thuộc về lớp chứ không thuộc về đối tượng cụ thể', 
   N'Biến không thể thay đổi giá trị', 
   N'Phương thức chỉ có thể gọi một lần', 
   N'Biến được khởi tạo tự động', 
   N'Thuộc về lớp chứ không thuộc về đối tượng cụ thể', N'Multiple Choice', 1, N'Intermediate', NULL),

(7, N'Chuẩn hóa database (Database Normalization) là gì?', 
   N'Quá trình tổ chức dữ liệu để giảm thiểu redundancy', 
   N'Quá trình tăng tốc độ truy vấn database', 
   N'Quá trình mã hóa dữ liệu trong database', 
   N'Quá trình sao lưu database định kỳ', 
   N'Quá trình tổ chức dữ liệu để giảm thiểu redundancy', N'Multiple Choice', 1, N'Intermediate', NULL),
(8, N'Pandas là gì trong Python?', 
   N'Thư viện xử lý và phân tích dữ liệu', 
   N'Framework web development', 
   N'Database management system', 
   N'Game development engine', 
   N'Thư viện xử lý và phân tích dữ liệu', N'Multiple Choice', 1, N'Intermediate', NULL),

(9, N'RESTful API sử dụng phương thức HTTP nào để tạo dữ liệu mới?', 
   N'POST', 
   N'GET', 
   N'PUT', 
   N'DELETE', 
   N'POST', N'Multiple Choice', 1, N'Intermediate', NULL),

(10, N'Flutter sử dụng ngôn ngữ lập trình nào?', 
   N'Dart', 
   N'JavaScript', 
   N'Java', 
   N'Swift', 
   N'Dart', N'Multiple Choice', 1, N'Beginner', NULL),

(11, N'Docker container khác gì với virtual machine?', 
   N'Container chia sẻ kernel của host OS', 
   N'Container nặng hơn VM', 
   N'Container chậm hơn VM', 
   N'Container cần OS riêng', 
   N'Container chia sẻ kernel của host OS', N'Multiple Choice', 1, N'Advanced', NULL),

(12, N'UX là viết tắt của từ nào?', 
   N'User Experience', 
   N'User Extension', 
   N'Universal Exchange', 
   N'Unified eXecution', 
   N'User Experience', N'Multiple Choice', 1, N'Beginner', NULL),

(13, N'Firewall hoạt động ở tầng nào trong mô hình OSI?', 
   N'Network Layer', 
   N'Physical Layer', 
   N'Session Layer', 
   N'Presentation Layer', 
   N'Network Layer', N'Multiple Choice', 1, N'Intermediate', NULL),

(14, N'TensorFlow được phát triển bởi công ty nào?', 
   N'Google', 
   N'Facebook', 
   N'Microsoft', 
   N'Amazon', 
   N'Google', N'Multiple Choice', 1, N'Advanced', NULL),

(15, N'WordPress được viết bằng ngôn ngữ lập trình nào?', 
   N'PHP', 
   N'Python', 
   N'Ruby', 
   N'Java', 
   N'PHP', N'Multiple Choice', 1, N'Beginner', NULL),

(16, N'Unity Engine hỗ trợ ngôn ngữ lập trình nào chính?', 
   N'C#', 
   N'C++', 
   N'Java', 
   N'Python', 
   N'C#', N'Multiple Choice', 1, N'Intermediate', NULL),

(17, N'Blockchain lưu trữ dữ liệu như thế nào?', 
   N'Chuỗi các block liên kết với nhau', 
   N'Database truyền thống', 
   N'File system phân tán', 
   N'Cloud storage', 
   N'Chuỗi các block liên kết với nhau', N'Multiple Choice', 1, N'Advanced', NULL),

(18, N'Hàm VLOOKUP trong Excel có tác dụng gì?', 
   N'Tìm kiếm dữ liệu theo chiều dọc', 
   N'Tính tổng các ô', 
   N'Tạo biểu đồ', 
   N'Định dạng ô', 
   N'Tìm kiếm dữ liệu theo chiều dọc', N'Multiple Choice', 1, N'Beginner', NULL),

(19, N'CTR trong digital marketing là gì?', 
   N'Click-Through Rate', 
   N'Cost-To-Revenue', 
   N'Customer-Target-Reach', 
   N'Content-Traffic-Rate', 
   N'Click-Through Rate', N'Multiple Choice', 1, N'Beginner', NULL),

(20, N'Shopify là gì?', 
   N'Nền tảng thương mại điện tử', 
   N'Phần mềm kế toán', 
   N'Hệ quản trị nội dung', 
   N'Công cụ thiết kế', 
   N'Nền tảng thương mại điện tử', N'Multiple Choice', 1, N'Beginner', NULL),

(21, N'Frame rate trong video được đo bằng đơn vị nào?', 
   N'FPS (Frames Per Second)', 
   N'BPS (Bits Per Second)', 
   N'Hz (Hertz)', 
   N'Mbps (Megabits per second)', 
   N'FPS (Frames Per Second)', N'Multiple Choice', 1, N'Intermediate', NULL),

(22, N'Tỷ lệ vàng (Golden Ratio) trong nhiếp ảnh là?', 
   N'1:1.618', 
   N'1:2', 
   N'3:4', 
   N'16:9', 
   N'1:1.618', N'Multiple Choice', 1, N'Beginner', NULL);

-- Thêm dữ liệu vào bảng QuizQuestion
INSERT INTO QuizQuestion (QuizQuestionID, QuizID, QuestionID, QuestionOrder, Points) VALUES
(1, 1, 1, 1, 2.0),
(2, 1, 6, 2, 3.0),
(3, 2, 2, 1, 2.5),
(4, 2, 7, 2, 3.5),
(5, 3, 3, 1, 2.0),
(6, 4, 4, 1, 2.0),
(7, 5, 5, 1, 4.0),
(8, 6, 8, 1, 2.5),
(9, 6, 9, 2, 3.0),
(10, 7, 9, 1, 2.0),
(11, 8, 10, 1, 2.0),
(12, 9, 11, 1, 3.5),
(13, 10, 12, 1, 2.0),
(14, 11, 13, 1, 3.0),
(15, 12, 14, 1, 4.0),
(16, 13, 15, 1, 2.0),
(17, 14, 16, 1, 2.5),
(18, 15, 17, 1, 3.5);

-- Thêm dữ liệu vào bảng QuizAttempt
INSERT INTO QuizAttempt (AttemptID, UserID, QuizID, StartTime, EndTime, TotalScore) VALUES
(1, 4, 1, '2024-05-15 10:00:00', '2024-05-15 10:25:00', 4.0),
(2, 5, 2, '2024-05-16 14:30:00', '2024-05-16 15:10:00', 5.5),
(3, 6, 3, '2024-05-17 09:00:00', '2024-05-17 09:20:00', 2.0),
(4, 4, 4, '2024-05-18 16:00:00', '2024-05-18 16:15:00', 2.0),
(5, 5, 1, '2024-05-19 11:30:00', '2024-05-19 11:55:00', 3.5),
(6, 4, 2, '2024-05-20 08:00:00', '2024-05-20 08:30:00', 6.0),
(7, 5, 3, '2024-05-21 13:15:00', '2024-05-21 13:45:00', 3.5),
(8, 4, 5, '2024-05-22 10:30:00', '2024-05-22 11:00:00', 4.5),
(9, 5, 4, '2024-05-23 15:00:00', '2024-05-23 15:20:00', 2.5),
(10, 6, 1, '2024-05-24 09:30:00', '2024-05-24 10:00:00', 5.0),
(11, 4, 5, '2024-05-25 14:00:00', '2024-05-25 14:25:00', 3.0),
(12, 5, 2, '2024-05-26 11:00:00', '2024-05-26 11:30:00', 4.0),
(13, 4, 3, '2024-05-27 16:30:00', '2024-05-27 17:00:00', 5.5),
(14, 5, 1, '2024-05-28 08:45:00', '2024-05-28 09:15:00', 6.5),
(15, 6, 4, '2024-05-29 12:00:00', '2024-05-29 12:20:00', 3.5),
(16, 4, 3, '2024-05-30 10:15:00', '2024-05-30 10:45:00', 4.0),
(17, 5, 5, '2024-05-31 14:30:00', '2024-05-31 15:00:00', 5.0),
(18, 4, 2, '2024-06-01 09:00:00', '2024-06-01 09:30:00', 2.0),
(19, 5, 3, '2024-06-02 11:30:00', '2024-06-02 12:00:00', 4.5),
(20, 6, 1, '2024-06-03 15:00:00', '2024-06-03 15:30:00', 6.0);

-- Thêm dữ liệu vào bảng UserAnswer
INSERT INTO UserAnswer (AnswerID, QuestionID, AttemptID, UserAnswerContent, IsCorrect) VALUES
(1, 1, 1, N'Hướng đối tượng', 1),
(2, 6, 1, N'Thuộc về class', 0),
(3, 2, 2, N'Định danh duy nhất', 1),
(4, 7, 2, N'Tổ chức dữ liệu giảm trùng lặp', 1),
(5, 3, 3, N'JavaScript XML', 1),
(6, 4, 4, N'Search Engine Optimization', 1),
(7, 5, 5, N'Agile', 1),
(8, 8, 6, N'Encapsulation', 1),
(9, 9, 6, N'Polymorphism', 0),
(10, 10, 7, N'Primary Key', 1),
(11, 11, 7, N'Foreign Key', 1),
(12, 12, 8, N'HTML5', 1),
(13, 13, 9, N'CSS Grid', 1),
(14, 14, 10, N'Scrum', 1),
(15, 15, 11, N'Kanban', 0),
(16, 16, 12, N'Normalization', 1),
(17, 17, 13, N'Denormalization', 0),
(18, 18, 14, N'JSON', 1),
(19, 19, 15, N'XML', 1),
(20, 20, 16, N'React Hooks', 1),
(21, 21, 17, N'API RESTful', 1),
(22, 22, 18, N'SQL Injection', 0);

-- Thêm dữ liệu vào bảng Setting
INSERT INTO Setting (SettingID, UserID, SettingType, SettingValue, SettingOrder, SettingDecription, SettingStatus) VALUES
(1, 1, N'System', N'Online Learning Platform', 1, N'Tên hệ thống', 1),
(2, 1, N'Email', N'admin@olit.edu.vn', 2, N'Email hệ thống', 1),
(3, 1, N'Theme', N'Blue', 3, N'Màu chủ đạo giao diện', 1),
(4, 1, N'Language', N'Vietnamese', 4, N'Ngôn ngữ mặc định', 1),
(5, 1, N'Timezone', N'Asia/Ho_Chi_Minh', 5, N'Múi giờ hệ thống', 1);

-- Thêm dữ liệu vào bảng Slider
INSERT INTO Slider (SliderID, CourseID, UserID, Title, ImageURL, Backlink, Status, Notes, DisplayOrder, ValidFrom) VALUES
(1, 1, 1, N'Khóa học Java mới', 'https://aptech.fpt.edu.vn/wp-content/uploads/2022/06/java-la-ngon-ngu-lap-trinh-rat-da-dung.jpg', '/course/java-basic', 1, N'Slider quảng cáo khóa Java', 1, '2024-05-01'),
(2, 1, 1, N'Ưu đãi 50% khóa Database', 'https://vtiacademy.edu.vn/upload/images/data-analyst-26.png', '/course/database-design', 1, N'Slider khuyến mãi', 2, '2024-05-05'),
(3, 1, 1, N'Khai giảng React Course', 'https://vtiacademy.edu.vn/upload/images/artboard-1-copy-16-100.jpg', '/course/react-beginners', 1, N'Thông báo khai giảng', 3, '2024-05-10');


INSERT INTO Review (ReviewID, UserID, CourseID, Content, Star, ImageURL) VALUES
(1, 4, 1, N'Khóa học Java rất hay và dễ hiểu.', 5, 'review-images/java1.jpg'),
(2, 5, 2, N'MySQL được giảng giải rõ ràng, dễ tiếp cận.', 4, 'review-images/mysql1.png'),
(3, 6, 3, N'React còn hơi khó với người mới, cần ví dụ thực tế hơn.', 3, 'review-images/react-feedback.jpg'),
(4, 4, 4, N'Nội dung marketing khá thực tế, áp dụng được.', 4, NULL),
(5, 5, 5, N'Mô hình Agile giúp tôi cải thiện quy trình làm việc rất nhiều.', 5, 'review-images/agile-review.png'),
(6, 6, 1, N'Khóa Java quá cơ bản, nên mở rộng thêm.', 3, NULL),
(7, 5, 3, N'Tôi thích cách truyền đạt của giảng viên React.', 4, 'review-images/react-teacher.jpg'),
(8, 6, 1, N'Khóa học khá ổn.', 5, NULL);
