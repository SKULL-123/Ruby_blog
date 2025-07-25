# Blog for Inventos

Это Ruby on Rails-приложение, обёрнутое в Docker и готовое к запуску с помощью `docker-compose`.

---

## ⚙️ Требования

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)

---

## 🚀 Бысткий запуск

1. Клонируйте проект с GitHub:

    git clone https://github.com/SKULL-123/Ruby_blog.git
    cd blog_for_inventos

2. Постройте и запустите контейнеры:
    docker compose up build

3. Создайте базу данных и выполните миграции:
(выполняется только один раз)
    docker compose run web rake db:create db:migrate

4. Откройте сайт:
(Приложение будет доступно по адресу)
    http://localhost:3000
