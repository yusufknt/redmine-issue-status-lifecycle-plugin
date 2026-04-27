# Issue Status Lifecycle Plugin (Redmine)

Bu eklenti, Redmine projelerindeki işlerin (issues) durum değişim süreçlerini analiz etmek için geliştirilmiştir.

## Özellikler

- Her iş için durum geçişlerinin listelenmesi
- Her durum arasında geçen sürenin hesaplanması
- Kullanıcı bazlı toplam süre analizi
- Kategori bazlı toplam süre analizi
- Status bazlı toplam süre analizi
- Arayüzden sıralama (sorting)
- Filtreleme (issue no, kullanıcı, kategori)
- CSV export
- Grafiksel gösterim (Chart.js)
- İş bazlı aç/kapat detay ve issue içi grafikler

---

## Kurulum

1. Redmine projesinin `plugins` klasörüne gidin:

```bash
cd redmine/plugins
```

2. Plugin'i kopyalayın:

```bash
git clone <repo-link>
```

3. Gerekli işlemleri çalıştırın:

```bash
bundle install
bin/rails db:migrate RAILS_ENV=production
```

4. Redmine server'ı başlatın:

```bash
bin/rails server
```

## Kullanım

1. Redmine arayüzünde bir projeye girin.
2. Ayarlar -> Modüller -> `Issue Status Lifecycle` modülünü aktif edin.
3. Proje menüsünden `Status Lifecycle` sekmesine girin.

## Teknik Detaylar

- Status değişimleri `journals` tablosundan alınır.
- Lifecycle, `status_id` değişimleri üzerinden hesaplanır.
- Süreler `created_on` timestamp farkları ile hesaplanır.
- Performans için `includes` ile eager loading kullanılmıştır.

## Kullanılan Teknolojiler

- Ruby on Rails
- Redmine Plugin API
- Chart.js

---

## GitHub'a Yükleme

Proje root’ta:

```bash
git init
git add .
git commit -m "Initial commit - Issue Status Lifecycle Plugin"
git branch -M main
git remote add origin <repo-link>
git push -u origin main
```

Repo: https://github.com/yusufknt/redmine-issue-status-lifecycle-plugin
