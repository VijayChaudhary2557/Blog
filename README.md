# 📰 Laravel Blog Application

A full-featured **Blog Application** built with **Laravel** (PHP Framework).  
It includes user authentication, blog creation with a rich text editor (CKEditor), image uploads, category-based navigation, and well-structured database relationships using Laravel Eloquent.

---

## 🚀 Tech Stack

- **Framework:** Laravel (PHP)
- **Frontend:** Blade Templates, Bootstrap
- **Editor:** CKEditor for blog writing
- **Database:** MySQL
- **Authentication:** Laravel Authentication System Use Auth
- **Image Handling:** Laravel File Storage + Multiple Image Uploads
- **Pagination:** Pagination

---

## ✨ Features

- ✅ User Registration & Login  
- 📝 Create, Read, Update, Delete (CRUD) for blog posts  
- 📸 Upload **multiple images** for each blog  
- 🧠 CKEditor integration for rich text blog content  
- 🧭 Customizable **Navbar with dynamic categories**  
- 🔐 Authentication-protected dashboard  
- 🔗 Well-managed **Eloquent Relationships** between tables  
- 📱 Fully responsive layout using Bootstrap  

---

## 📁 Project Structure

```bash
Blog/
├── app/ → Laravel controllers, models, etc.
├── database/ → Migrations & seeders
├── public/ → Public assets (uploaded images)
├── resources/
│ └── views/ → Blade templates
├── routes/
│ └── web.php → Web routes
├── .env → Environment configuration
└── composer.json
```


---

## ⚙️ Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/VijayChaudhary2557/Blog.git
cd Blog
```

### 2. Install Dependencies
```bash
composer install
npm install && npm run dev
```

### 3. Configure Environment
Rename .env.example to .env and update database credentials:
```bash
DB_DATABASE=your_db_name
DB_USERNAME=your_username
DB_PASSWORD=your_password
```

### 5. Run Migrations
```bash
php artisan migrate
```
### 6. Start the Development Server
```bash
php artisan serve
```

## 🧠 Database Design
- Users ↔ Blogs: One-to-Many
- Blogs ↔ Categories: Many-to-One
- Blogs ↔ Images: One-to-Many (multiple image support)
- Categories ↔ Blogs: One-to-Many

## 📸 Screenshots

![Screenshot 2024-08-02 070928](https://github.com/user-attachments/assets/3d2b5f86-187c-4166-b598-1704d7931157)

![Screenshot 2024-08-02 070945](https://github.com/user-attachments/assets/b49bee10-2640-4bb8-9fbe-0a36db64074a)

![Screenshot 2024-08-02 071116](https://github.com/user-attachments/assets/165a96c0-3c00-46ed-b115-5d3f7225e73a)

![Screenshot 2024-08-02 071129](https://github.com/user-attachments/assets/44c8047e-7bfe-4e5d-896f-ef80a0f19045)

![Screenshot 2024-08-02 071409](https://github.com/user-attachments/assets/2b3eb048-cded-4cfb-861a-05d031713a7b)

![Screenshot 2024-08-02 071426](https://github.com/user-attachments/assets/246a74b1-377c-41dc-9cc6-931759d4923d)

![Screenshot 2024-08-02 071145](https://github.com/user-attachments/assets/bae89168-88f9-4ed8-a08a-9f6db1f3067f)

![Screenshot 2024-08-02 071205](https://github.com/user-attachments/assets/5334221d-f470-4666-87a9-d0c940e477e5)

![Screenshot 2024-08-02 071222](https://github.com/user-attachments/assets/4e6dcec0-b32a-4a16-b01f-b4da54836090)

![Screenshot 2024-08-02 071236](https://github.com/user-attachments/assets/df6d388b-1fdb-4f89-a4d3-eeffe8e222b9)

![Screenshot 2024-08-02 071258](https://github.com/user-attachments/assets/2131ce6c-ddfa-4513-9426-867f3d30c110)

![Screenshot 2024-08-02 071310](https://github.com/user-attachments/assets/d4a9354f-1cc2-4c74-98dc-2049d465bb08)

![Screenshot 2024-08-02 071332](https://github.com/user-attachments/assets/2309a3d4-d039-4040-ab4a-6451f91b5521)
