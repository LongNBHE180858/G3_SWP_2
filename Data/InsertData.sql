USE OLIT
GO

-- Thêm dữ liệu vào bảng Role
INSERT INTO Role (RoleID, RoleName) VALUES
(1, 'Admin'),
(2, 'Expert'),
(3, 'Student');

-- Thêm dữ liệu vào bảng Account
INSERT INTO Account (RoleID, FullName, Gender, Email, PhoneNumber, Password, URLAvatar, Status, Address, Birthday) VALUES
(1, N'Nguyễn Bá Long', 'Male', 'longnbhe180858@fpt.edu.vn', '0123456789', '123', 'https://img.tripi.vn/cdn-cgi/image/width=700,height=700/https://gcs.tripi.vn/public-tripi/tripi-feed/img/482744KVW/anh-mo-ta.png', 'active', N'Hà Nội, Việt Nam', '1995-05-15'),
(2, N'Trần Thị Minh', 'Female', 'minhtthe170234@fpt.edu.vn', '0987654321', '123', 'https://robohash.org/nguyenkhai.png', 'active', N'Hồ Chí Minh, Việt Nam', '1988-08-20'),
(2, N'Lê Văn Hùng', 'Male', 'hunglvhe160567@fpt.edu.vn', '0369852147', '123', 'https://cellphones.com.vn/sforum/wp-content/uploads/2024/02/anh-avatar-ngau-2.jpg', 'active', N'Đà Nẵng, Việt Nam', '1990-12-03'),
(3, N'Phạm Thị Lan', 'Female', 'lanpthe190123@fpt.edu.vn', '0456789123', '123', 'https://www.vietnamworks.com/hrinsider/wp-content/uploads/2023/12/anh-den-ngau.jpeg', 'active', N'Hải Phòng, Việt Nam', '2001-03-10'),
(3, N'Vũ Minh Tuấn', 'Male', 'tuanvmhe190456@fpt.edu.vn', '0789123456', '123', 'https://toigingiuvedep.vn/wp-content/uploads/2021/01/avatar-dep-cute.jpg', 'active', N'Cần Thơ, Việt Nam', '2000-11-25'),
(3, N'Hoàng Thị Thu', 'Female', 'thuhtse190789@fpt.edu.vn', '0321654987', '123', 'https://chiemtaimobile.vn/images/companies/1/%E1%BA%A2nh%20Blog/avatar-facebook-dep/top-36-anh-dai-dien-dep-cho-nu/hinh-anh-hut-thuoc-ngau-anime-nu-facebook.jpg?1708402451277', 'active', N'Huế, Việt Nam', '2002-07-18');

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
INSERT INTO Subject (SubjectID, SubjectName, Category, NumOfLessons, OwnerId, Status) VALUES
(1, N'Lập trình Java cơ bản', N'Programming', 20, 2, 1),
(2, N'Thiết kế cơ sở dữ liệu', N'Database', 15, 3, 1),
(3, N'Phát triển Web Frontend', N'Web Development', 25, 2, 1),
(4, N'Marketing số', N'Marketing', 12, 3, 1),
(5, N'Quản lý dự án IT', N'Management', 18, 2, 1);

-- Thêm dữ liệu vào bảng Dimension
INSERT INTO Dimension (DimensionID, SubjectID, DimensionName, Description) VALUES
(1, 1, N'Java Fundamentals', N'Cơ bản về cú pháp và cấu trúc Java'),
(2, 1, N'Object-Oriented Programming', N'Lập trình hướng đối tượng trong Java'),
(3, 2, N'Database Design', N'Thiết kế và chuẩn hóa cơ sở dữ liệu'),
(4, 2, N'SQL Queries', N'Viết và tối ưu hóa truy vấn SQL'),
(5, 3, N'React Components', N'Xây dựng và quản lý component trong React');

-- Thêm dữ liệu vào bảng ExpertSubject
INSERT INTO ExpertSubject (ExpertID, SubjectID) VALUES
(2, 1), -- Trần Thị Minh là Expert của Java
(3, 2), -- Lê Văn Hùng là Expert của Database
(2, 3); -- Trần Thị Minh là Expert của Web Frontend

-- Thêm dữ liệu vào bảng SubjectMedia
INSERT INTO SubjectMedia (MediaID, SubjectID, MediaURL, MediaType, MediaDescription) VALUES
(1, 1, 'https://example.com/java-intro.mp4', 'video', N'Video giới thiệu Java'),
(2, 2, 'https://example.com/database-diagram.png', 'image', N'Sơ đồ ERD mẫu'),
(3, 3, 'https://example.com/react-demo.mp4', 'video', N'Video demo React');

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
(4, 4, 4, 5, 1, 'NotApproved', '2024-05-15', '2024-09-12'),
(5, 5, 1, 2, 1, 'Approved', '2024-05-12', '2024-08-10');

-- Thêm dữ liệu vào bảng CourseSection
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

-- Thêm dữ liệu vào bảng SectionModule
INSERT INTO SectionModule (ModuleID, SectionID, ModuleTitle) VALUES
(1, 1, N'Module 1: Giới thiệu & Mở đầu'),
(2, 1, N'Module 2: Mục tiêu học tập'),
(3, 2, N'Module 1: Cấu trúc chương trình Java'),
(4, 2, N'Module 2: Biến và kiểu dữ liệu'),
(5, 2, N'Module 3: Câu lệnh điều kiện'),
(6, 3, N'Module 1: Viết ứng dụng Console'),
(7, 3, N'Module 2: Đọc ghi file'),
(8, 4, N'Module 1: Giới thiệu về MySQL'),
(9, 4, N'Module 2: Cài đặt và cấu hình'),
(10, 5, N'Module 1: Thiết kế bảng'),
(11, 5, N'Module 2: Mối quan hệ giữa bảng'),
(12, 6, N'Module 1: Truy vấn nâng cao'),
(13, 7, N'Module 1: React là gì?'),
(14, 7, N'Module 2: Cài đặt môi trường'),
(15, 8, N'Module 1: Component cơ bản'),
(16, 8, N'Module 2: Props và Event'),
(17, 9, N'Module 1: State và useState'),
(18, 9, N'Module 2: Vòng đời component'),
(19, 10, N'Module 1: Marketing truyền thống vs số'),
(20, 10, N'Module 2: Xu hướng hiện tại'),
(21, 11, N'Module 1: SEO và SEM'),
(22, 11, N'Module 2: Social Media Marketing'),
(23, 12, N'Module 1: Đánh giá hiệu quả'),
(24, 13, N'Module 1: Nguyên lý Agile'),
(25, 13, N'Module 2: Agile Manifesto'),
(26, 14, N'Module 1: Scrum Roles'),
(27, 14, N'Module 2: Scrum Events'),
(28, 15, N'Module 1: Triển khai Agile'),
(29, 15, N'Module 2: Công cụ hỗ trợ');

-- Thêm dữ liệu vào bảng Lesson
INSERT INTO Lesson (LessonID, ModuleID, LessonTitle, LessonDetails, Status, URLLesson, [Order]) VALUES
(1, 1, N'Bài 1: Giới thiệu khóa học', N'Giới thiệu tổng quan về khóa học Java', 1, 'https://www.youtube.com/watch?v=3gtOAlcovoQ&list=PL33lvabfss1yGrOutFR03OZoqm91TSsvs', 1),
(2, 1, N'Bài 2: Mục tiêu học tập', N'Những điều bạn sẽ học được sau khóa học', 1, 'https://www.youtube.com/watch?v=pTB0EiLXUC8', 2),
(3, 2, N'Bài 1: Hướng dẫn học hiệu quả', N'Cách tận dụng khóa học tối đa', 1, 'https://www.youtube.com/watch?v=8uGv2DZR1z4', 1),
(4, 2, N'Bài 2: Kế hoạch học tập', N'Hướng dẫn lập kế hoạch học tập hiệu quả', 1, 'https://www.youtube.com/watch?v=3gtOAlcovoQ', 2),
(5, 2, N'Bài 3: Tài nguyên hỗ trợ', N'Tổng hợp tài liệu và công cụ học Java', 1, 'http://localhost:8080/G3_SWP/userPages/java/2-3.html', 3),
(6, 3, N'Bài 1: Hàm main và cú pháp cơ bản', N'Giới thiệu hàm main()', 1, 'https://www.youtube.com/watch?v=grEKMHGYyns', 1),
(7, 3, N'Bài 2: Tệp .java và .class', N'Cách chương trình Java được biên dịch', 1, 'https://www.youtube.com/watch?v=OoudRzH7oVA', 2),
(8, 4, N'Bài 1: Kiểu dữ liệu cơ bản', N'int, float, String...', 1, 'https://www.youtube.com/watch?v=Qgl81fPcLc8', 1),
(9, 4, N'Bài 2: Khai báo và gán giá trị', N'Kỹ thuật khai báo biến', 1, 'https://www.youtube.com/watch?v=zLy8mdC2Xws', 2),
(10, 4, N'Bài 3: Biến hằng số', N'Sử dụng final trong Java', 1, 'https://www.youtube.com/watch?v=M8D1nW78mHM', 3),
(11, 5, N'Bài 1: if/else', N'Cấu trúc điều kiện trong Java', 1, 'https://www.youtube.com/watch?v=gdZLi9oWNZg', 1),
(12, 5, N'Bài 2: switch/case', N'Sử dụng switch để tối ưu code', 1, 'https://www.youtube.com/watch?v=KVRo9Wpe4-4', 2),
(13, 6, N'Bài 1: In ra màn hình', N'Dùng System.out.print()', 1, 'https://www.youtube.com/watch?v=5H0-KaYfOKg', 1),
(14, 6, N'Bài 2: Nhập từ bàn phím', N'Scanner class', 1, 'https://www.youtube.com/watch?v=2OLV3T3OQCk', 2),
(15, 7, N'Bài 1: FileWriter và FileReader', N'Đọc ghi file văn bản đơn giản', 1, 'https://www.youtube.com/watch?v=Y5imlvOjBzI', 1),
(16, 7, N'Bài 2: BufferedReader và BufferedWriter', N'Cách dùng BufferedReader/BufferedWriter để đọc ghi file nhanh', 1, 'https://www.youtube.com/watch?v=1tI5Kb_C1Mw', 2),
(17, 7, N'Bài 3: Xử lý File CSV', N'Hướng dẫn đọc/viết định dạng CSV trong Java', 1, 'http://localhost:8080/G3_SWP/userPages/java/13-3.html', 3),
(18, 8, N'Bài 1: Lịch sử và ứng dụng của MySQL', N'Tại sao MySQL phổ biến', 1, 'https://www.youtube.com/watch?v=7S_tz1z_5bA', 1),
(19, 8, N'Bài 2: Ưu điểm và Nhược điểm của MySQL', N'Phân tích ưu và nhược điểm khi sử dụng MySQL', 1, 'https://www.youtube.com/watch?v=Ke90Tje7VS0', 2),
(20, 8, N'Bài 3: Tối ưu truy vấn', N'Kỹ thuật tối ưu câu lệnh SELECT và Indexing', 1, 'http://localhost:8080/G3_SWP/userPages/mysql/1-3.html', 3),
(21, 9, N'Bài 1: Cài đặt trên Windows', N'Tải về và cài đặt MySQL', 1, 'https://www.youtube.com/watch?v=7kEp8o4Y30E', 1),
(22, 9, N'Bài 2: Cấu hình ban đầu', N'Tạo user, cấp quyền', 1, 'https://www.youtube.com/watch?v=3yYrpBS_fcc', 2),
(23, 10, N'Bài 1: Các kiểu dữ liệu phổ biến', N'VARCHAR, INT, DATE...', 1, 'https://www.youtube.com/watch?v=9ylj9NR0Lcg', 1),
(24, 10, N'Bài 2: Ràng buộc bảng (Constraints)', N'Tìm hiểu các loại ràng buộc: PRIMARY, UNIQUE, CHECK,…', 1, 'https://www.youtube.com/watch?v=ENrzD9HAZK4', 2),
(25, 10, N'Bài 3: Thiết kế ERD cơ bản', N'Hướng dẫn vẽ sơ đồ quan hệ thực thể với ERD tool', 1, 'http://localhost:8080/G3_SWP/userPages/mysql/4-3.html', 3),
(26, 11, N'Bài 1: Primary Key & Foreign Key', N'Tạo mối quan hệ giữa bảng', 1, 'https://www.youtube.com/watch?v=1tI5Kb_C1Mw', 1),
(27, 11, N'Bài 2: Cascade và JOIN', N'Áp dụng cascade khi xoá/sửa khoá và cách dùng JOIN nâng cao', 1, 'https://www.youtube.com/watch?v=I6ypD7qv3Z8', 2),
(28, 11, N'Bài 3: Transactions và Locking', N'Quản lý transaction và locking trong MySQL', 1, 'http://localhost:8080/G3_SWP/userPages/mysql/5-3.html', 3),
(29, 12, N'Bài 1: JOIN các bảng', N'LEFT JOIN, INNER JOIN...', 1, 'https://www.youtube.com/watch?v=9yeOJ0ZMUYw', 1),
(30, 12, N'Bài 2: Subquery', N'Sử dụng lồng câu truy vấn', 1, 'https://www.youtube.com/watch?v=2KmfA86Dpmk', 2),
(31, 12, N'Bài 3: Stored Procedures', N'Viết và gọi Stored Procedure trong MySQL', 1, 'http://localhost:8080/G3_SWP/userPages/mysql/7-3.html', 3),
(32, 13, N'Bài 1: Giới thiệu ReactJS', N'Lịch sử và ưu điểm của React', 1, 'https://www.youtube.com/watch?v=Ke90Tje7VS0', 1),
(33, 13, N'Bài 2: Virtual DOM và JSX', N'Giải thích cơ chế Virtual DOM và cách viết JSX trong React', 1, 'https://www.youtube.com/watch?v=Ke90Tje7VS0', 2),
(34, 13, N'Bài 3: Thiết lập React Router', N'Cấu hình điều hướng SPA với React Router', 1, 'http://localhost:8080/G3_SWP/userPages/react/1-3.html', 3),
(35, 14, N'Bài 1: Cài đặt NodeJS & npm', N'Thiết lập môi trường cho React', 1, 'https://www.youtube.com/watch?v=ENrzD9HAZK4', 1),
(36, 14, N'Bài 2: Thiết lập IDE và Extension', N'Hướng dẫn cấu hình VSCode/WebStorm, cài extension cần thiết', 1, 'https://www.youtube.com/watch?v=ENrzD9HAZK4', 2),
(37, 14, N'Bài 3: Tích hợp ESLint & Prettier', N'Cấu hình linting và định dạng code tự động', 1, 'http://localhost:8080/G3_SWP/userPages/react/2-3.html', 3),
(38, 15, N'Bài 1: Tạo component đầu tiên', N'Dùng function component', 1, 'https://www.youtube.com/watch?v=I6ypD7qv3Z8', 1),
(39, 15, N'Bài 2: Props là gì?', N'Truyền dữ liệu giữa component', 1, 'https://www.youtube.com/watch?v=0mYOSjWc0-M', 2),
(40, 16, N'Bài 1: Xử lý sự kiện', N'onClick, onChange...', 1, 'https://www.youtube.com/watch?v=dd7XkO8YM98', 1),
(41, 16, N'Bài 2: Truyền Props nâng cao', N'Kỹ thuật truyền Props sâu và validate với PropTypes', 1, 'https://www.youtube.com/watch?v=I6ypD7qv3Z8', 2),
(42, 16, N'Bài 3: Context API cơ bản', N'Sử dụng Context để chia sẻ state toàn ứng dụng', 1, 'http://localhost:8080/G3_SWP/userPages/react/5-3.html', 3),
(43, 17, N'Bài 1: useState Hook', N'Tạo state trong function component', 1, 'https://www.youtube.com/watch?v=O6P86uwfdR0', 1),
(44, 17, N'Bài 2: Quản lý state với nhiều biến', N'Kỹ thuật tách state thành nhiều biến con hiệu quả', 1, 'https://www.youtube.com/watch?v=9ylj9NR0Lcg', 2),
(45, 17, N'Bài 3: useReducer Hook', N'Sử dụng useReducer để quản lý state phức tạp', 1, 'http://localhost:8080/G3_SWP/userPages/react/6-3.html', 3),
(46, 18, N'Bài 1: useEffect Hook', N'Thực hiện hành động khi render', 1, 'https://www.youtube.com/watch?v=0ZJgIjIuY7U', 1),
(47, 19, N'Bài 1: So sánh mô hình cũ và mới', N'Phân biệt hai phương pháp', 1, 'https://www.youtube.com/watch?v=YQGzXHUSOY8', 1),
(48, 20, N'Bài 1: Marketing trên TikTok', N'Chiến lược nội dung video ngắn', 1, 'https://www.youtube.com/watch?v=rEgN4vycvTY', 1),
(49, 21, N'Bài 1: Tối ưu hóa từ khóa', N'Cách SEO giúp tăng traffic', 1, 'https://www.youtube.com/watch?v=hF515-0Tduk', 1),
(50, 22, N'Bài 1: Facebook Ads cơ bản', N'Chạy quảng cáo trên Facebook', 1, 'https://www.youtube.com/watch?v=Kc5Y1l-rsaw', 1),
(51, 23, N'Bài 1: Chỉ số đo lường ROI', N'Cách xác định hiệu quả chiến dịch', 1, 'https://www.youtube.com/watch?v=lEEW5Ma_cJs', 1),
(52, 24, N'Bài 1: Agile Manifesto', N'4 giá trị cốt lõi của Agile', 1, 'https://www.youtube.com/watch?v=Z9QbYZh1YXY', 1),
(53, 25, N'Bài 1: Các nguyên lý Agile', N'12 nguyên lý trong Agile Manifesto', 1, 'https://www.youtube.com/watch?v=doqYY2xCXWU', 1),
(54, 26, N'Bài 1: Product Owner', N'Trách nhiệm và vai trò', 1, 'https://www.youtube.com/watch?v=6x1A8K8UHoe', 1),
(55, 26, N'Bài 2: Scrum Master', N'Đảm bảo quy trình Scrum vận hành tốt', 1, 'https://www.youtube.com/watch?v=UeQHdQ7U5RM', 2),
(56, 27, N'Bài 1: Sprint Planning', N'Lên kế hoạch cho Sprint', 1, 'https://www.youtube.com/watch?v=zaxPG4uDfr4', 1),
(57, 28, N'Bài 1: Agile tại doanh nghiệp', N'Ví dụ triển khai thực tế', 1, 'https://www.youtube.com/watch?v=3HZWxsxaYNc', 1),
(58, 29, N'Bài 1: Sử dụng Jira', N'Theo dõi tiến độ trong Agile', 1, 'https://www.youtube.com/watch?v=EOTXYa8qgJ0', 1);

-- Thêm dữ liệu vào bảng Quiz
INSERT INTO Quiz (QuizID, SectionID, QuizName, PassRate, QuizType, QuizDuration, QuizLevel, Status) VALUES
(1, 1, N'Kiểm tra Java cơ bản', 70.00, N'Multiple Choice', 30, N'Beginner', 1),
(2, 4, N'Quiz thiết kế Database', 75.00, N'Mixed', 45, N'Intermediate', 1),
(3, 7, N'React Fundamentals Test', 65.00, N'Multiple Choice', 25, N'Beginner', 1),
(4, 10, N'Digital Marketing Quiz', 80.00, N'True/False', 20, N'Intermediate', 1),
(5, 13, N'Agile Methodology Test', 85.00, N'Mixed', 40, N'Advanced', 1);

-- Thêm dữ liệu vào bảng Question
INSERT INTO Question (QuestionID, QuestionContent, QuestionType, Status, QuestionLevel, CreatedBy, CreatedAt, SubjectID, LessonID) VALUES
(1, N'Java là ngôn ngữ lập trình thuộc loại nào?', 1, 1, 1, 2, GETDATE(), 1, 6),
(2, N'Khóa chính (Primary Key) trong database có tác dụng gì?', 1, 1, 1, 3, GETDATE(), 2, 26),
(3, N'JSX là gì trong React?', 1, 1, 1, 2, GETDATE(), 3, 33),
(4, N'SEO viết tắt của từ nào?', 1, 1, 1, 3, GETDATE(), 4, 49),
(5, N'Scrum là một framework của phương pháp nào?', 1, 1, 2, 2, GETDATE(), 5, 54),
(6, N'Trong Java, từ khóa "static" có ý nghĩa gì?', 1, 1, 2, 2, GETDATE(), 1, 6),
(7, N'Chuẩn hóa database (Database Normalization) là gì?', 1, 1, 2, 3, GETDATE(), 2, 27);

-- Thêm dữ liệu vào bảng QuestionDimension
INSERT INTO QuestionDimension (QuestionID, DimensionID) VALUES
(1, 1), -- Java Fundamentals
(2, 3), -- Database Design
(3, 5), -- React Components
(6, 1), -- Java Fundamentals
(7, 3); -- Database Design

-- Thêm dữ liệu vào bảng QuestionAnswer
INSERT INTO QuestionAnswer (AnswerDetail, Explanation, IsCorrect, QuestionID) VALUES
(N'Ngôn ngữ lập trình hướng đối tượng', N'Java là ngôn ngữ lập trình hướng đối tượng, hỗ trợ các khái niệm như kế thừa, đóng gói, đa hình.', 1, 1),
(N'Ngôn ngữ lập trình thủ tục', N'Không đúng, Java không phải là ngôn ngữ lập trình thủ tục như C.', 0, 1),
(N'Ngôn ngữ lập trình hàm', N'Không đúng, Java không phải là ngôn ngữ lập trình hàm thuần túy.', 0, 1),
(N'Ngôn ngữ assembly', N'Không đúng, Java là ngôn ngữ cấp cao, không phải ngôn ngữ assembly.', 0, 1),
(N'Định danh duy nhất cho mỗi bản ghi trong bảng', N'Khóa chính đảm bảo mỗi bản ghi trong bảng có một định danh duy nhất.', 1, 2),
(N'Tăng tốc độ truy vấn dữ liệu', N'Không đúng, khóa chính không trực tiếp tăng tốc độ truy vấn, nhưng có thể hỗ trợ thông qua chỉ mục.', 0, 2),
(N'Mã hóa dữ liệu trong bảng', N'Không đúng, khóa chính không liên quan đến mã hóa dữ liệu.', 0, 2),
(N'Sao lưu dữ liệu tự động', N'Không đúng, khóa chính không liên quan đến sao lưu dữ liệu.', 0, 2),
(N'JavaScript XML - cú pháp mở rộng cho JavaScript', N'JSX là cú pháp mở rộng cho JavaScript, cho phép viết HTML trong React.', 1, 3),
(N'Java Syntax Extension', N'Không đúng, JSX không liên quan đến Java.', 0, 3),
(N'JSON eXtended', N'Không đúng, JSX không phải là JSON.', 0, 3),
(N'JavaScript eXecutable', N'Không đúng, JSX không phải là JavaScript thực thi.', 0, 3),
(N'Search Engine Optimization', N'SEO là kỹ thuật tối ưu hóa công cụ tìm kiếm để tăng thứ hạng website.', 1, 4),
(N'System Engineering Operations', N'Không đúng, SEO không liên quan đến kỹ thuật hệ thống.', 0, 4),
(N'Software Engineering Organization', N'Không đúng, SEO không liên quan đến tổ chức kỹ thuật phần mềm.', 0, 4),
(N'Security Enhancement Options', N'Không đúng, SEO không liên quan đến bảo mật.', 0, 4),
(N'Agile methodology', N'Scrum là một framework thuộc phương pháp Agile, tập trung vào phát triển lặp đi lặp lại.', 1, 5),
(N'Waterfall methodology', N'Không đúng, Scrum không thuộc mô hình Waterfall.', 0, 5),
(N'DevOps methodology', N'Không đúng, Scrum không phải là một phần của DevOps.', 0, 5),
(N'Lean methodology', N'Không đúng, mặc dù Lean và Agile có một số điểm tương đồng, Scrum thuộc Agile.', 0, 5),
(N'Thuộc về lớp chứ không thuộc về đối tượng cụ thể', N'Từ khóa static trong Java chỉ định rằng một thành viên thuộc về lớp, không cần tạo đối tượng.', 1, 6),
(N'Biến không thể thay đổi giá trị', N'Không đúng, đó là từ khóa final, không phải static.', 0, 6),
(N'Phương thức chỉ có thể gọi một lần', N'Không đúng, static không giới hạn số lần gọi phương thức.', 0, 6),
(N'Biến được khởi tạo tự động', N'Không đúng, static không tự động khởi tạo biến.', 0, 6),
(N'Quá trình tổ chức dữ liệu để giảm thiểu redundancy', N'Chuẩn hóa database giúp loại bỏ dư thừa dữ liệu và đảm bảo tính nhất quán.', 1, 7),
(N'Quá trình tăng tốc độ truy vấn database', N'Không đúng, chuẩn hóa không trực tiếp tăng tốc độ truy vấn.', 0, 7),
(N'Quá trình mã hóa dữ liệu trong database', N'Không đúng, chuẩn hóa không liên quan đến mã hóa.', 0, 7),
(N'Quá trình sao lưu database định kỳ', N'Không đúng, chuẩn hóa không liên quan đến sao lưu.', 0, 7);

-- Thêm dữ liệu vào bảng QuestionMedia
INSERT INTO QuestionMedia (MediaURL,MediaDescription, QuestionID) VALUES
('https://example.com/java-image.png', N'Hình minh họa cú pháp Java', 1),
('https://example.com/database-diagram.png', N'Sơ đồ khóa chính', 2),
('https://example.com/jsx-example.png', N'Minh họa JSX', 3);

-- Thêm dữ liệu vào bảng QuizQuestion
INSERT INTO QuizQuestion (QuizQuestionID, QuizID, QuestionID, QuestionOrder, Points) VALUES
(1, 1, 1, 1, 2.0),
(2, 1, 6, 2, 3.0),
(3, 2, 2, 1, 2.5),
(4, 2, 7, 2, 3.5),
(5, 3, 3, 1, 2.0),
(6, 4, 4, 1, 2.0),
(7, 5, 5, 1, 4.0);

-- Thêm dữ liệu vào bảng QuizAttempt
INSERT INTO QuizAttempt (AttemptID, UserID, QuizID, StartTime, EndTime, TotalScore) VALUES
(1, 4, 1, '2024-05-15 10:00:00', '2024-05-15 10:25:00', 4.0),
(2, 5, 2, '2024-05-16 14:30:00', '2024-05-16 15:10:00', 5.5),
(3, 6, 3, '2024-05-17 09:00:00', '2024-05-17 09:20:00', 2.0),
(4, 4, 4, '2024-05-18 16:00:00', '2024-05-18 16:15:00', 2.0),
(5, 5, 1, '2024-05-19 11:30:00', '2024-05-19 11:55:00', 3.5);

-- Thêm dữ liệu vào bảng UserAnswer
INSERT INTO UserAnswer (UserAnswerID, QuestionID, AttemptID, UserAnswerContent, IsCorrect) VALUES
(1, 1, 1, N'Ngôn ngữ lập trình hướng đối tượng', 1),
(2, 6, 1, N'Thuộc về lớp chứ không thuộc về đối tượng cụ thể', 1),
(3, 2, 2, N'Định danh duy nhất cho mỗi bản ghi trong bảng', 1),
(4, 7, 2, N'Quá trình tổ chức dữ liệu để giảm thiểu redundancy', 1),
(5, 3, 3, N'JavaScript XML - cú pháp mở rộng cho JavaScript', 1),
(6, 4, 4, N'Search Engine Optimization', 1),
(7, 5, 5, N'Agile methodology', 1);

-- Thêm dữ liệu vào bảng Setting
INSERT INTO Setting (SettingID, UserID, SettingType, SettingValue, SettingOrder, SettingDecription, SettingStatus) VALUES
(1, 1, N'System', N'Online Learning Platform', 1, N'Tên hệ thống', 1),
(2, 1, N'Email', N'admin@olit.edu.vn', 2, N'Email hệ thống', 1),
(3, 1, N'Theme', N'Blue', 3, N'Màu chủ đạo giao diện', 1),
(4, 1, N'Language', N'Vietnamese', 4, N'Ngôn ngữ mặc định', 1),
(5, 1, N'Timezone', N'Asia/Ho_Chi_Minh', 5, N'Múi giờ hệ thống', 1);

-- Thêm dữ liệu vào bảng Slider
INSERT INTO Slider (SliderID, UserID, CourseID, Title, ImageURL, Backlink, Status, Notes, DisplayOrder, ValidFrom) VALUES
(1, 1, 1, N'Khóa học Java mới', 'https://aptech.fpt.edu.vn/wp-content/uploads/2022/06/java-la-ngon-ngu-lap-trinh-rat-da-dung.jpg', '/course/java-basic', 1, N'Slider quảng cáo khóa Java', 1, '2024-05-01'),
(2, 1, 2, N'Ưu đãi 50% khóa Database', 'https://vtiacademy.edu.vn/upload/images/data-analyst-26.png', '/course/database-design', 1, N'Slider khuyến mãi', 2, '2024-05-05'),
(3, 1, 3, N'Khai giảng React Course', 'https://vtiacademy.edu.vn/upload/images/artboard-1-copy-16-100.jpg', '/course/react-beginners', 1, N'Thông báo khai giảng', 3, '2024-05-10');

-- Thêm dữ liệu vào bảng Review
INSERT INTO Review (ReviewID, UserID, CourseID, Content, Star, CreatedAt, Status, ImageURL) VALUES
(1, 4, 1, N'Khóa học Java rất hay và dễ hiểu.', 5, GETDATE(), 1, NULL),
(2, 5, 2, N'MySQL được giảng giải rõ ràng, dễ tiếp cận.', 4, GETDATE(), 1, NULL),
(3, 6, 3, N'React còn hơi khó với người mới, cần ví dụ thực tế hơn.', 3, GETDATE(), 1, NULL),
(4, 4, 4, N'Nội dung marketing khá thực tế, áp dụng được.', 4, GETDATE(), 1, NULL),
(5, 5, 5, N'Mô hình Agile giúp tôi cải thiện quy trình làm việc rất nhiều.', 5, GETDATE(), 1, NULL),
(6, 6, 1, N'Khóa Java quá cơ bản, nên mở rộng thêm.', 3, GETDATE(), 1, NULL),
(7, 5, 3, N'Tôi thích cách truyền đạt của giảng viên React.', 4, GETDATE(), 1, NULL),
(8, 6, 1, N'Khóa học khá ổn.', 5, GETDATE(), 1, NULL);