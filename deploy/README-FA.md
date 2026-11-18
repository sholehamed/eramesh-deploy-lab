# راهنمای استقرار آزمایشی EraMesh

1. ریپوی جدید `sholehamed/eramesh-deploy-lab` بسازید و محتویات ZIP را روی شاخه main پوش کنید.
2. در تب Actions منتظر سبز شدن `Build, Smoke Test, and Publish GHCR` بمانید.
3. پکیج GHCR را برای تست به حالت Public درآورید، یا احراز هویت read-only را روی سرور تنظیم کنید.
4. فایل `compose.yml` را در `/srv/eramesh/apps/deploy-lab/compose.yml` قرار دهید.
5. از مسیر فوق `sudo docker compose pull` و `sudo docker compose up -d` اجرا کنید.
6. قطعه `caddy-route.txt` را داخل بلاک اصلی `:80` در Caddyfile و قبل از handle نهایی قرار دهید.
7. کانفیگ Caddy را validate/reload کنید و با Host header زیر بررسی کنید:
   `curl -i -H 'Host: lab.eramesh.ir' http://127.0.0.1:8080/health`

پورت تازه‌ای برای اپلیکیشن منتشر نمی‌شود؛ تمام ترافیک آزمایشی فقط از Caddy عبور می‌کند. قبل از انتشار روی اینترنت HTTPS را فعال کنید.
