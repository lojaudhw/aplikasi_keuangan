# 📱 TUTORIAL SUPER MUDAH - BUILD APK (LANGKAH DEMI LANGKAH)

**Tutorial ini dibuat seperti video. Ikuti PERSIS seperti yang ditulis!**

---

# **BAGIAN 1: PERSIAPAN (5 MENIT)**

## **Step A: Cari Folder Project**

**TUJUAN:** Membuka folder `aplikasi_keuangan`

1. **Buka File Explorer** (ikon folder di taskbar Windows)
   - Atau tekan **Win + E**

2. **Cari folder bernama `aplikasi_keuangan`**
   - Biasanya di: `C:\Users\NamaKamu\Documents` 
   - Atau: `C:\Users\NamaKamu\Desktop`
   - Atau tempat lain yang Anda save

3. **Jika sudah ketemu folder `aplikasi_keuangan`:**
   - ✅ Double-click folder itu untuk buka
   - Anda akan melihat banyak file dan folder di dalamnya

**Jika tidak ketemu?**
   - Gunakan Search Windows (Win + S) dan ketik "aplikasi_keuangan"
   - Atau cari di Desktop / Documents / Downloads

✅ **SELESAI STEP A**

---

## **Step B: Buka Command Prompt di Folder**

**TUJUAN:** Membuka terminal/command prompt di folder project

### **CARA 1 (Paling Mudah):**

1. **Di File Explorer yang sudah terbuka folder `aplikasi_keuangan`:**
   - Klik kanan di area kosong (jangan klik file/folder apapun)
   
2. **Pilih opsi:**
   - Windows 10: Pilih **"Open command window here"** atau **"Open PowerShell window here"**
   - Windows 11: Pilih **"Open in Terminal"**

3. **Command Prompt/Terminal akan terbuka**
   - Anda akan melihat text kuning/putih dengan path folder

✅ **Command Prompt sudah terbuka di folder yang benar!**

---

### **CARA 2 (Alternatif jika Cara 1 tidak ada):**

1. **Buka Command Prompt biasa:**
   - Tekan **Win + R**
   - Ketik: `cmd`
   - Tekan **Enter**

2. **Di Command Prompt, ketik:**
   ```
   cd aplikasi_keuangan
   ```
   - Ganti `aplikasi_keuangan` dengan path folder Anda
   - Contoh: `cd C:\Users\Budi\Documents\aplikasi_keuangan`
   
3. **Tekan Enter**

---

# **BAGIAN 2: BUILD APK (10-15 MENIT)**

## **Step C: Ketik Perintah Build**

**TUJUAN:** Mulai proses membuat APK

1. **Di Command Prompt yang sudah terbuka:**
   - Lihat ada text yang berakhir dengan `>`
   - Itu tempat Anda mengetik perintah

2. **Copy-paste perintah ini:**
   ```
   flutter build apk --release
   ```

3. **Cara copy-paste:**
   - Blok/highlight text di atas (atau copy dari sini)
   - Klik kanan di Command Prompt
   - Pilih **Paste**

4. **Tekan Enter**

✅ **Proses build dimulai!**

---

## **Step D: TUNGGU - TUNGGU - TUNGGU** ⏳

**PENTING: Jangan tutup Command Prompt!**

Anda akan melihat:
- Banyak baris text berjalan
- Status berbeda-beda
- Progress bar (mungkin)
- Ini **NORMAL**!

**Waktu tunggu:**
- **Pertama kali:** 10-20 menit
- **Kali berikutnya:** 2-5 menit

**Tanda-tanda NORMAL:**
```
> Task :app:compileReleaseJavaWithJavac
> Task :app:dexBuilderRelease
> Task :app:mergeReleaseNativeLibs
> Task :app:packReleaseBundle
> Task :app:assembleRelease
```

---

## **Step E: Tunggu Pesan SUKSES ✅**

**Kalau berhasil, akan muncul pesan seperti ini:**

```
✓ Built build/app/outputs/flutter-apk/app-release.apk (45.2 MB).
```

**Atau:**
```
Built build/app/outputs/flutter-apk/app-release.apk
```

Kalau muncul pesan seperti di atas = **SUKSES! 🎉**

---

### **JIKA MUNCUL ERROR (Text Merah) ❌**

**JANGAN PANIK!** Ini normal terjadi. Ada beberapa solusi:

**Error 1: "flutter: command not found"**
- Berarti Flutter belum terinstall atau PATH salah
- Download Flutter dari flutter.dev dan install ulang

**Error 2: "Android SDK not found"**
- Berarti Android SDK belum terinstall
- Install Android Studio (Anda sudah buka tadi kan?)
- Jalankan Android Studio dan tunggu setup selesai

**Error 3: "Gradle build failed"**
- Paling sering terjadi
- Solusi:
  ```
  flutter clean
  flutter build apk --release
  ```

**Error lainnya?**
- Copy-paste error message ke Google
- Atau tanya ke ChatGPT dengan error message lengkap

---

# **BAGIAN 3: CARI FILE APK (2 MENIT)**

## **Step F: Buka Folder APK**

**TUJUAN:** Menemukan file APK yang sudah jadi

1. **Buka File Explorer** (Win + E)

2. **Navigasi ke folder `aplikasi_keuangan`**

3. **Buka folder dengan urutan ini:**
   - `build` → `app` → `outputs` → `flutter-apk`

4. **Di dalam folder `flutter-apk`, Anda akan melihat:**
   - 📄 `app-release.apk` ← **INI FILE YANG ANDA BUTUH!**
   - File lainnya (abaikan)

5. **Ukuran file APK:** ~45 MB (mungkin berbeda)

✅ **FILE APK KETEMU!**

---

# **BAGIAN 4: INSTALL APK KE ANDROID PHONE (10 MENIT)**

## **Step G: Siapkan Android Phone**

**TUJUAN:** Mengaktifkan USB Debugging di phone

1. **Hubungkan Android phone ke PC dengan kabel USB**
   - Gunakan kabel original atau yang bagus
   - Pastikan mati/hidup di kedua sisi

2. **Di Android Phone, buka Settings (⚙️)**

3. **Cari dan tap "About Phone"**
   - Biasanya di bawah Settings

4. **Cari **"Build Number"** (scroll bawah)**
   - Di beberapa phone: "Device Info" → "Build Number"

5. **Tap "Build Number" sebanyak 7 kali** (terus tap!)
   - Akan muncul notifikasi: "Developer mode enabled"

6. **Kembali ke Settings**
   - Sekarang ada tab baru: **"Developer Options"** atau **"Developer Settings"**

7. **Buka "Developer Options"**

8. **Cari "USB Debugging" dan aktifkan (geser ke ON)**
   - Biasanya urutan ke-3 atau ke-4 dari atas
   - Mungkin akan ada dialog, tap **"OK"**

✅ **USB Debugging sudah aktif!**

---

## **Step H: Install APK ke Phone**

**TUJUAN:** Memasang aplikasi ke phone

### **METODE 1: Langsung dari PC (Mudah)**

1. **Di File Explorer PC, cari file `app-release.apk`**
   - Lokasi: `aplikasi_keuangan\build\app\outputs\flutter-apk\`

2. **Double-click file `app-release.apk`**
   - Akan ada delay 2-3 detik

3. **Di phone akan muncul notifikasi:**
   - "Installing..." atau logo instalasi
   - Tunggu sampai selesai (5-10 detik)

4. **Setelah selesai:**
   - Phone akan vibrasi atau bunyi
   - Aplikasi sudah ter-install! 🎉

5. **Cari aplikasi:**
   - Buka App Drawer (ikon grid di home screen)
   - Cari aplikasi bernama **"Aplikasi Keuangan"** atau **"💰 Aplikasi Keuangan"**
   - Tap untuk buka

✅ **SELESAI! APLIKASI SUDAH BISA DIGUNAKAN!** 🎉

---

### **METODE 2: Transfer Manual (Jika Metode 1 Tidak Bisa)**

1. **Di File Explorer PC:**
   - Klik kanan file `app-release.apk`
   - Pilih **"Copy"**

2. **Di File Explorer, buka phone Anda:**
   - Phone akan muncul sebagai folder di Explorer
   - Buka folder **"Downloads"** atau **"DCIM"**

3. **Paste file:**
   - Klik kanan di folder kosong
   - Pilih **"Paste"**
   - Tunggu proses copy (bisa 1-2 menit)

4. **Di Phone, buka File Manager:**
   - Biasanya ada ikon folder di home screen
   - Buka folder **"Downloads"**

5. **Cari file `app-release.apk`**

6. **Tap file APK:**
   - Muncul dialog "Install app?"
   - Tap **"Install"**
   - Tunggu sampai selesai

7. **Setelah selesai:**
   - Tap **"Open"** untuk jalankan aplikasi
   - Atau cari di App Drawer

✅ **SELESAI!**

---

# **BAGIAN 5: GUNAKAN APLIKASI**

## **Aplikasi Sudah Siap! 🎉**

### **Fitur Utama:**

**1. Lihat Saldo:**
- Bagian atas (biru) menampilkan total saldo, pemasukan, dan pengeluaran

**2. Tambah Transaksi:**
- Tap tombol ➕ (plus) besar di bawah kanan
- Isi form:
  - Judul: Misal "Makan siang", "Gaji", dll
  - Jumlah: Angka (misal 50000)
  - Tipe: Pilih "Pemasukan" atau "Pengeluaran"
  - Kategori: Otomatis berbeda
  - Tanggal: Tap untuk pilih
- Tap **"Tambah"**

**3. Hapus Transaksi:**
- Swipe ke kiri atau tap ikon 🗑️ (sampah)

**4. Lihat Riwayat:**
- Scroll list untuk lihat semua transaksi

---

# **📞 JIKA ADA MASALAH**

## **Aplikasi tidak bisa diinstall:**
- Aktifkan "Unknown Sources" di Settings → Security
- Atau gunakan Metode 2 (transfer manual)

## **Aplikasi crash/error:**
- Uninstall aplikasi
- Jalankan `flutter clean` di Command Prompt
- Build ulang: `flutter build apk --release`
- Install ulang

## **File APK tidak ada:**
- Lihat di Step E, pastikan ada pesan sukses
- Jika ada error, ikuti solusi error yang diberikan

## **Stuck/bingung di step mana:**
- Baca ulang langkah itu dengan teliti
- Atau minta bantuan teman yang punya pengalaman

---

# **✅ CHECKLIST SEBELUM MULAI**

- [ ] Flutter sudah install (bisa buka Command Prompt dan ketik `flutter doctor`)
- [ ] Android Studio sudah install
- [ ] Folder `aplikasi_keuangan` sudah ada di PC
- [ ] Android phone siap (terisi daya, USB Debugging aktif)
- [ ] Kabel USB tersedia

---

# **🎯 RINGKASAN CEPAT**

```
1. Buka folder aplikasi_keuangan
2. Klik kanan → Open in Terminal / Command Prompt
3. Ketik: flutter build apk --release
4. Tunggu 10-20 menit
5. Cari file di: build\app\outputs\flutter-apk\app-release.apk
6. Double-click file APK (atau transfer manual ke phone)
7. Install dan buka aplikasi
8. Selesai! 🎉
```

---

**Tutorial ini dibuat untuk pemula yang benar-benar tidak paham.**  
**Jika ada yang kurang jelas, baca ulang bagian itu atau tanya!**

*Good luck! You got this! 💪*
