# Issue Status Lifecycle Plugin (Redmine)

Bu eklenti, Redmine projelerindeki işlerin (issues) durum değişim süreçlerini analiz etmek için geliştirilmiştir.

## Özellikler

- Her iş için durum geçişlerinin listelenmesi
- Her durum arasında geçen sürenin hesaplanması
- Kullanıcı bazlı toplam süre analizi
- Kategori bazlı toplam süre analizi
- Arayüzden sıralama (sorting)
- Grafiksel gösterim (Chart.js)

---

## Kurulum

1. Redmine projesinin `plugins` klasörüne gidin:

```bash
cd redmine/plugins
Plugin’i kopyalayın:
git clone <repo-link>
Gerekli migration işlemlerini çalıştırın:
bundle install
bin/rails db:migrate RAILS_ENV=production
Redmine server’ı başlatın:
bin/rails server
Kullanım
Redmine arayüzünde bir projeye girin
Ayarlar → Modüller → Issue Status Lifecycle aktif edin
Proje menüsünden Status Lifecycle sekmesine girin
Teknik Detaylar
Status değişimleri journals tablosundan alınır
status_id değişimleri üzerinden lifecycle hesaplanır
Süreler created_on timestamp farkları ile hesaplanır
Performans için includes ile eager loading kullanılmıştır
Kullanılan Teknolojiler
Ruby on Rails
Redmine Plugin API
Chart.js (grafikler için)
Notlar
Büyük veri setlerinde performans için optimize edilebilir
Ek olarak filtreleme ve pagination eklenebilir

---

## 3. GitHub’a yükleme

Proje root’ta:

```bash
git init
git add .
git commit -m "Initial commit - Issue Status Lifecycle Plugin"
git branch -M main
git remote add origin <repo-link>
git push -u origin main
```


https://github.com/yusufknt/redmine_project.git
