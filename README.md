# 📚 Student Management System

A full-stack **Student Management System** developed using **Flutter**, **PHP**, and **MySQL**. The application allows users to register students, store their details in a MySQL database, and retrieve all student records through a simple and user-friendly interface.

---

## ✨ Features

- 📝 Student Registration Form
- 💾 Store student data in MySQL database
- 📋 View all registered students
- 🔄 Flutter ↔ PHP API integration
- 🌐 REST API using PHP
- 📱 Simple and responsive Flutter UI

---

## 🛠️ Tech Stack

| Technology | Purpose |
|------------|---------|
| Flutter | Frontend |
| Dart | Programming Language |
| PHP | Backend API |
| MySQL | Database |
| XAMPP | Local Server |
| HTTP Package | API Communication |

---

## 📂 Project Structure

```text
student_management/
│
├── lib/
│   ├── main.dart
│   └── student_details.dart
│
├── php/
│   ├── db_connect.php
│   ├── insert_student.php
│   └── fetch_students.php
│
├── student_db.sql
├── pubspec.yaml
└── README.md
```

---

## 🚀 Features Implemented

- Register a new student
- Save data into MySQL database
- Fetch all student records
- Display records in Flutter
- Loading indicators
- Navigation between screens
- Error handling

---

## ⚙️ Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/Bhoomika-Babbar/student-details-app.git
```

---

### 2. Install Flutter Dependencies

```bash
flutter pub get
```

---

### 3. Setup Database

- Open **phpMyAdmin**
- Create a database named:

```
student_db
```

- Import:

```
student_db.sql
```

---

### 4. Setup PHP

Copy the `php` folder into your XAMPP `htdocs` directory.

Example (macOS):

```text
/Applications/XAMPP/xamppfiles/htdocs/student_api/
```

Start:

- Apache
- MySQL

using the XAMPP Control Panel.

---

### 5. Update API URL

Replace the API URL in Flutter with your local IP address.

Example:

```dart
http://192.168.x.x/student_api/insert_student.php
```

and

```dart
http://192.168.x.x/student_api/fetch_students.php
```

Replace `192.168.x.x` with your own computer's IP address.

---

### 6. Run the Project

```bash
flutter run
```

---

## 📸 Screens

- Student Registration Screen
- Student Records Screen

> You can add screenshots here after uploading them to GitHub.

---

## 📌 Future Improvements

- Update Student Details
- Delete Student
- Search Student
- Form Validation
- Authentication
- Responsive UI Enhancements

---

## 👩‍💻 Author

**Bhoomika**

---

## 📄 License

This project is developed for educational purposes.
