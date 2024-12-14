
# Api documentation for Quizze Online Application service
## Api content
- [User](#user)
- [class](#Class)
- [Question](#question)
- [QuestionBank](#question_bank)


## 1. Class
## Class API Endpoints

| Method | URL                                    | Description                                    |
|--------|----------------------------------------|------------------------------------------------|
| POST   | `/api/classes`                         | Create a new class                             |
| DELETE | `/api/classes/{classId}`               | Delete a class                                 |
| PUT    | `/api/classes/{classId}`               | Update class information                       |
| GET    | `/api/classes`                         | Get a list of all classes                      |
| GET    | `/api/classes/{classId}/students`      | Get a list of students in a class              |
| GET    | `/api/classes/{classId}/teacher`       | Get teacher information for a class            |
| GET    | `/api/teachers/{teacherId}/classes`    | Get a list of classes taught by a teacher      |

1.1 Thêm lớp học
- Method: POST
- URL: /api/classes
- Request Body:
```json
{
  "class_name": "Lop 2",
  "subject_id": 1,
  "teacher_id": 3
}
```
- Response:
```json
{
  "success": true,
  "message": "Class created successfully with ID: 5"
}
```
2.2 Xóa lớp học
- Method: DELETE
- URL: /api/classes/{classId}
- Response:
```json 
{
  "message": "Class deleted successfully"
}
```
   
2.3 Sửa thông tin lớp học 
- Method: PUT
- URL: /api/classes/{classId}
- Request Body:
```json
{
   "className": "Lớp 12A1 (Updated)",
   "subjectId": 4,
   "teacherId": 2
}
```
- Response:
```json
{
   "message": "Class updated successfully"
}
```
2.4 Lấy danh sách lớp
- Method: GET
- URL: /api/classes
- Response:
```json
{
  "code": 0,
  "message": "Success",
  "data": [
    {
      "teacher_name": "John Doe",
      "class_id": 3,
      "subject_name": "Mon 1",
      "class_name": "Lop 2"
    },
    {
      "teacher_name": "John Doe",
      "class_id": 4,
      "subject_name": "Mon 1",
      "class_name": "Lop 2"
    },
    {
      "teacher_name": "John Doe",
      "class_id": 5,
      "subject_name": "Mon 1",
      "class_name": "Lop 2"
    }
  ]
}
```
2.5 Tìm học sinh trong lớp
- Method: GET
- URL: /api/classes/{classId}/students
- Response:
```json
[
    {
        "studentId": 101,
        "fullName": "Student One",
        "email": "student1@example.com"
    },
    {
        "studentId": 102,
        "fullName": "Student Two",
        "email": "student2@example.com"
    }
]
```
2.6 Xem thông tin giáo viên trong lớp
- Method: GET
- URL: /api/classes/{classId}/teacher
- Response:
```json
{
  "teacherId": 1,
  "fullName": "Mr. John",
  "email": "john@example.com",
  "subjectName": "Math"
}
```
2.7 Lấy danh sách các lớp mà giáo viên đang giảng dạy
- Method: GET
- URL: /api/teachers/{teacherId}/classes
- Response:
```json
[
  {
    "classId": 1,
    "className": "Lớp 12A1",
    "subjectName": "Math"
  },
  {
    "classId": 3,
    "className": "Lớp 11C3",
    "subjectName": "Chemistry"
  }
]
```
  


## Quesion Bank
| Method | URL                                    | Description                                    |
|--------|----------------------------------------|------------------------------------------------|
| POST   | `/api/question-banks`                 | Tạo một ngân hàng câu hỏi mới                 |
| DELETE | `/api/question-banks/{id}`            | Xóa một ngân hàng câu hỏi                     |
| PUT    | `/api/question-banks/{id}`            | Cập nhật thông tin ngân hàng câu hỏi          |
| GET    | `/api/question-banks/user/{userId}`   | Lấy danh sách ngân hàng câu hỏi theo User ID  |
| GET    | `/api/question-banks/{id}`            | Lấy thông tin chi tiết của ngân hàng câu hỏi  |

1. Tạo ngân hàng câu hỏi
- Method: POST
- URL: /api/question-banks
- Description: Tạo một ngân hàng câu hỏi mới.
- Request Body:
```json
{
"bankName": "Ngân hàng câu hỏi Toán",
"createdBy": 1,
"isPublic": true
}
```
- Response:
```json
{
  "code": 0,
  "message": "Success",
  "data": "Create success"
}
```
2. Xóa ngân hàng câu hỏi
- Method: DELETE
- URL: /api/question-banks/{id}
- Description: Xóa một ngân hàng câu hỏi theo ID.
- Response:
```json
{
"message": "Question Bank deleted successfully"
}
```
3. Cập nhật thông tin ngân hàng câu hỏi
- Method: PUT
- URL: /api/question-banks/{id}
- Description: Cập nhật thông tin một ngân hàng câu hỏi theo ID.
- Request Body:
```json
{
"bankName": "Ngân hàng câu hỏi Vật lý",
"isPublic": false
}
```
- Response:
```json
{
"message": "Question Bank updated successfully"
}
```
4. Lấy danh sách ngân hàng câu hỏi theo User ID
- Method: GET
- URL: /api/question-banks/user/{userId}
- Description: Lấy danh sách ngân hàng câu hỏi do một người dùng tạo.
- Response:
```json
{
  "code": 0,
  "message": "Success",
  "data": [
    {
      "questionBankId": 1,
      "bankName": "Ngân hàng câu hỏi Toán",
      "createdBy": {
        "userId": 1,
        "email": "user@example.com",
        "password": "$2a$10$0N2d.IDmBvPfZWti7lMB4OMO1nIiDIGL17ZSKZwdOFr6yhyga0io2",
        "role": "student",
        "fullName": "John Doe",
        "createdAt": "2024-12-06T20:08:11",
        "updatedAt": null
      },
      "createdAt": "2024-12-14T17:11:18.93611",
      "questions": [],
      "public": true
    },
    {
      "questionBankId": 2,
      "bankName": "Ngân hàng câu hỏi Văn",
      "createdBy": {
        "userId": 1,
        "email": "user@example.com",
        "password": "$2a$10$0N2d.IDmBvPfZWti7lMB4OMO1nIiDIGL17ZSKZwdOFr6yhyga0io2",
        "role": "student",
        "fullName": "John Doe",
        "createdAt": "2024-12-06T20:08:11",
        "updatedAt": null
      },
      "createdAt": "2024-12-14T17:13:40.807487",
      "questions": [],
      "public": true
    }
  ]
}
```
5. Lấy chi tiết ngân hàng câu hỏi
- Method: GET
- URL: /api/question-banks/{id}
- Description: Lấy thông tin chi tiết của một ngân hàng câu hỏi theo ID.
- Response:
```json
{
"questionBankId": 1,
"bankName": "Ngân hàng câu hỏi Toán",
"isPublic": true,
"createdAt": "2024-01-01T12:00:00",
"questions": [
{
"questionId": 101,
"questionContent": "1 + 1 = ?",
"correctAnswer": "2"
},
{
"questionId": 102,
"questionContent": "5 x 5 = ?",
"correctAnswer": "25"
}
]
}
```

## 3. Exam
| Method | URL          | Description                             |
|--------|--------------|-----------------------------------------|
| POST   | `/api/exams` | Tạo đề thi mới từ ngân hàng câu hỏi     |


