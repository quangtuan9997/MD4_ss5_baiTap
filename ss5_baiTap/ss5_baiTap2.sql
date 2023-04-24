create database test2;
use test2;
create table `Subject`(
SubjectId int primary key,
SubjectName nvarchar(50)
);
create table Student(
StudentId int primary key,
studentName nvarchar(50),
Age int,
Email varchar(100)
);
create table Marks(
mark int,
SubjectId int,
StudentId int,
foreign key (SubjectId) references `Subject`(SubjectId),
foreign key (StudentId) references `Student`(StudentId)
);
create table Classes(
ClassId int primary key,
ClassName nvarchar(50)
);
create table ClassStudent(
StudentId int,
foreign key (StudentId) references `Student`(StudentId),
ClassId int,
foreign key (ClassId) references Classes(classId)
);
insert into Student values
(1,"Nguyen Quang An",18,"an@yahoo.com"),
(2,"Nguyen Cong Vinh",20,"vinh@gmail.com"),
(3,"Nguyen Van Quyen",19,"quyen@yahoo.com"),
(4,"Pham Thanh Binh",25,"binh@com"),
(5,"Nguyen Van Tai Em",30,"taiem@sport.com");
insert into Classes value
(1,"C0706L"),
(2,"C0708G");
insert into ClassStudent values 
(1,1),
(2,1),
(3,2),
(4,2),
(5,2);
insert into `Subject` values
(1,"SQL"),
(2,"Java"),
(3,"C"),
(4,"Visual Basic");
insert into Marks values
(8,1,1),
(4,2,1),
(9,1,1),
(7,1,3),
(3,1,4),
(5,2,5),
(8,3,3),
(1,3,5),
(3,2,4);
-- Hiển thị danh sách tất cả các học viên
select * from Student;
-- Hiển thị danh sách tất cả các môn học
select * from `Subject`;

-- Tính điểm trung bình
select avg(mark) from marks;

-- Hiển thị môn học nào có học sinh thi được điểm cao nhất
select sb.SubjectName, m.mark from `Subject` sb join marks m on Sb.SubjectId=m.SubjectId where m.mark= (select max(mark)from marks);

-- Danh sách thứ tự của điểm theo chiều giảm dần
select * from marks m  order by m.mark DESC;

-- Thay đổi kiểu dữ liệu của cột SubjectName trong bảng Subject thành nvarChar(max)
alter table `subject` modify subjectname nvarchar(255);
-- Cập nhập thêm dòng chữ <<Day la mon hoc>> vào trước các bản ghi tren cot SubjectName trong bảng Subject
update `subject` set subjectName= (concat("day la mon hoc ", subjectName));
-- Viết Check Constraint để kiểm tra do độ tuổi nhập vào trong bảng Student yêu cầu Age >15 và Age <50
alter table Student add constraint Age check ( Age>15 and Age<50);

-- Loại bỏ tất cả quan hệ giữa các bảng 
alter table marks drop foreign key StudentId;
alter table marks drop foreign key SubjectId;
alter table ClassStudent drop foreign key StudentId;
alter table ClassStudent drop foreign key ClassId;
-- Xóa học viên có StudentID là 1
delete from Student where studentId=1;
-- Trong bảng Student thêm một column Status có kiểu dữ liệu là Bit và có giá trị default là 1
alter table Student add `Status` bit default (1);
-- Cập nhập giá trị Status trong bảng Student thành 0;
update  Student set `Status`=0;
