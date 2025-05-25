# 🍼 Ortucare App – Parenting Assistant with AI 💬
![Flutter](https://img.shields.io/badge/Flutter-3.4.3-blue?logo=flutter)
![Laravel](https://img.shields.io/badge/Laravel-10-red?logo=laravel)
![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS-green)
![License](https://img.shields.io/badge/License-MIT-blueviolet)
![Status](https://img.shields.io/badge/Status-Active-brightgreen)

**Ortucare** adalah aplikasi mobile berbasis Flutter yang dirancang untuk membantu para orang tua — khususnya ibu — dalam menjalani peran sebagai pengasuh anak. Aplikasi ini dilengkapi dengan asisten AI bernama **Anam** yang siap memberikan saran pengasuhan anak yang cepat, empatik, dan relevan.

![Logo Ortucare](https://github.com/IndraMuh/ortucare_app/blob/main/frontend/ortucare/assets/logo.png?raw=true)

---

## ✨ Fitur Unggulan

- 🤖 **Chat AI – Anam**: Asisten cerdas yang siap menjawab pertanyaan parenting.
- 📂 **Riwayat Percakapan**: Chat tersimpan secara lokal dengan `SharedPreferences`.
- 🧹 **Clear Chat**: Hapus riwayat chat dengan satu klik.
- 🎨 **Tampilan modern & lembut**: Menggunakan font Lexend dan nuansa pink feminin.
- 📱 **Cross Platform**: Mendukung Android dan iOS.

---

## 🛠️ Teknologi yang Digunakan

### 🎯 Frontend (Flutter)
- Flutter SDK `^3.4.3`
- `http` – komunikasi dengan backend Laravel
- `shared_preferences` – menyimpan riwayat chat
- `font_awesome_flutter` – ikon sosial
- `flutter_launcher_icons` – pengaturan ikon aplikasi otomatis
- Custom Font: [Lexend](https://fonts.google.com/specimen/Lexend)

### ⚙️ Backend (Laravel)
- Laravel 10
- Gemini API (`generativelanguage.googleapis.com`)
- Endpoint: `POST /api/ask-ai` untuk memproses pertanyaan pengguna

---

## 📦 Struktur Proyek
-ortucare_app/

- ├── frontend/

- │   └── ortucare/                   # Aplikasi mobile Flutter

- │       ├── lib/
  
- │       │   ├── pages/              # Halaman-halaman utama (ChatPage, LoginPage, dsb)

- │       │   ├── services/           # Layanan komunikasi ke backend (ChatService, UserService)

- │       │   ├── widgets/            # Komponen UI seperti BottomNav, Alert, Konstanta

- │       │   └── main.dart           # Entry point aplikasi Flutter

- │       ├── assets/                 # Logo, font Lexend, dan gambar lainnya

- │       ├── pubspec.yaml            # Konfigurasi dependencies dan aset Flutter

- │       └── android/ / ios/         # File konfigurasi platform Android dan iOS

- │

- ├── backend/

- │   └── ortucare/                   # Backend API menggunakan Laravel

- │       ├── app/Http/Controllers/   # Kontroler utama: AuthController, GeminiController, dll

- │       ├── routes/api.php          # Routing REST API
 
- │       ├── .env                    # Konfigurasi environment (GEMINI_API_KEY, DB, dll)

- │       ├── composer.json           # File dependency Laravel

- │       └── public/                 # Direktori publik akses Laravel (endpoint API)

- │

- └── README.md                       # Dokumentasi utama proyek

---

## ▶️ Cara Pemakaian

### 📲 Jalankan Aplikasi Flutter

1. Masuk ke folder `frontend/ortucare`:
   ```bash
   cd frontend/ortucare
2. Install dependencies:
    ```bash
   flutter pub get
3. Jalankan aplikasi:
   ```bash
   flutter run
4. Jalankan aplikasi:
   ```bash
   flutter run
   
### 🔧 Jalankan Backend Laravel

1. Masuk ke folder backend/ortucare:
   ```bash
   cd backend/ortucare
2. Install dependencies:
   ```bash
   composer install
3. Salin file .env dan generate key:
   ```bash
   cp .env.example .env
   php artisan key:generate
3. Jalankan server:
   ```bash
   php artisan serve
3. Tambahkan API Key Gemini di .env:
   ```bash
   GEMINI_API_KEY=your_api_key_here

---

## 💡 Tips
- Gunakan flutter_launcher_icons untuk generate ikon:
  ```bash
  flutter pub run flutter_launcher_icons:main
  
---

## 📃 Lisensi  

Hak cipta © 2025 IndraMuh

Diberikan izin untuk menggunakan, menyalin, memodifikasi, dan mendistribusikan perangkat lunak ini dengan syarat menyertakan pemberitahuan lisensi ini.
