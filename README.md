# 🍼 Ortucare App – Parenting Assistant with AI 💬

**Ortucare** adalah aplikasi mobile berbasis Flutter yang dirancang untuk membantu para orang tua — khususnya ibu — dalam menjalani peran sebagai pengasuh anak. Aplikasi ini dilengkapi dengan asisten AI bernama **Anam** yang siap memberikan saran pengasuhan anak yang cepat, empatik, dan relevan.

![Logo Ortucare](assets/logo.png)

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
