# Настройка CI/CD Pipeline

## Необходимые секреты

Для работы CI/CD pipeline необходимо настроить следующие секреты в репозитории GitHub:

1. Перейдите в Settings -> Secrets and variables -> Actions
2. Добавьте следующие секреты:

### DOCKER_USERNAME
Ваш логин в Docker Hub

### DOCKER_PASSWORD
Ваш пароль или токен доступа в Docker Hub

## Как получить токен доступа Docker Hub

1. Войдите в Docker Hub
2. Перейдите в Account Settings -> Security
3. Создайте новый Access Token
4. Скопируйте токен и используйте его как DOCKER_PASSWORD

## Проверка работы

После настройки секретов:

1. Сделайте push в ветку main/master
2. Проверьте вкладку Actions на GitHub
3. Убедитесь, что workflow "CI/CD Pipeline" запустился
4. Проверьте, что тесты прошли успешно
5. Проверьте, что образ загружен в Docker Hub

## Локальное тестирование

Для локального тестирования CI/CD pipeline используйте команду:

```bash
make ci
```

Эта команда запустит тесты с помощью Docker Compose, аналогично тому, как это делает GitHub Actions.
