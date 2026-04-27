# Technical Decisions

## Data Source
Issue status lifecycle hesaplamasi icin Redmine'in `journals` tablosu kullanildi.
Cunku status degisimleri bu tabloda detay seviyesinde tutulmaktadir.

## Status Tracking
Sadece `status_id` degisimleri filtrelenerek lifecycle olusturuldu.
Bu sayede gereksiz journal kayitlari elendi.

## Time Calculation
Durumlar arasi sure, `created_on` timestamp farki ile hesaplandi.
Bu yaklasim Redmine'in veri modeline uygun ve dogrudur.

## Performance
N+1 problemini onlemek icin:
- `includes(:journals, :details, :user)` kullanildi.

## Aggregations
Kullanici ve kategori bazli toplamlar Ruby tarafinda hesaplandi.
Veri hacmi arttiginda bu kisim SQL seviyesine tasinabilir.

## Visualization
Chart.js kullanildi cunku:
- hafif
- bagimlilik gerektirmiyor
- hizli entegre edilebilir

## Filtering
Filtreleme controller seviyesinde yapildi.
Bu yaklasim kucuk/orta veri setleri icin yeterlidir.

## Export
CSV export eklendi cunku:
- raporlama ihtiyaci icin kritik
- is dunyasinda standart cikti formatidir
