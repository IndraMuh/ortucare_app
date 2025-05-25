# 🍼 Ortucare App – Parenting Assistant with AI 💬

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
ortucare_app/
├── frontend/
│   └── ortucare/                # Aplikasi mobile Flutter
│       ├── lib/
│       │   ├── pages/           # Halaman aplikasi (ChatPage, LoginPage, dll)
│       │   ├── services/        # Koneksi ke backend (UserService, ChatService)
│       │   ├── widgets/         # Komponen UI seperti Navbar, AlertMessage, dll
│       │   └── main.dart        # Titik awal aplikasi Flutter
│       ├── assets/              # Logo, font Lexend, dan gambar pendukung
│       ├── pubspec.yaml         # Konfigurasi dependencies dan aset
│       └── android/ios/         # Konfigurasi spesifik platform Android & iOS
│
├── backend/
│   └── ortucare/                # Backend Laravel (REST API)
│       ├── app/Http/Controllers # Controller Laravel (Auth, Barang, Gemini)
│       ├── routes/api.php       # Definisi endpoint API
│       ├── .env                 # Konfigurasi environment (API key Gemini, DB, dll)
│       ├── composer.json        # Dependencies Laravel
│       └── public/              # Direktori publik untuk akses HTTP
│
└── README.md                    # Dokumentasi proyek (file ini)
