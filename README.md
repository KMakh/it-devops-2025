# Проект сборки SQLite библиотеки

## Структура проекта

### Корневая директория
- `build.sh` - Скрипт для сборки SQLite библиотеки
- `CMakeLists.txt` - Конфигурация CMake для сборки SQLite
- `Dockerfile` - Конфигурация Docker для создания сборочного окружения
- `README.md` - Этот файл с описанием проекта
- `README.txt` -

### Директории сборки и вывода
- `build/` - Директория для временных файлов сборки
  - `build.log` - Лог процесса сборки
  - `libsqlite3.so` - Скомпилированная библиотека SQLite (Linux)
  - Различные файлы CMake для управления сборкой
- `output/` - Директория для конечных результатов сборки
  - `build.log` - Копия лога сборки
  - `libsqlite3.so` - Копия скомпилированной библиотеки

### Исходный код SQLite
- `sqlite-amalgamation-3260000/` - Распакованный исходный код SQLite
  - `shell.c` - Исходный файл оболочки SQLite
  - `sqlite3.c` - Основной исходный файл SQLite
  - `sqlite3.h` - Заголовочный файл SQLite
  - `sqlite3ext.h` - Заголовочный файл для расширений SQLite

### Ansible конфигурация
- `ansible/` - Директория с конфигурацией Ansible
  - `inventory.yml` - Инвентарный файл с указанием хостов
  - `site.yml` - Основной playbook Ansible
  - `roles/` - Директория с ролями Ansible
    - `docker_install/` - Роль для установки Docker
      - `tasks/main.yml` - Задачи для установки Docker
    - `sqlite3_build/` - Роль для сборки SQLite
      - `files/CMakeLists.txt` - Файл CMake для роли сборки
      - `tasks/main.yml` - Задачи для сборки SQLite
    - `sqlite3_build_docker/` - Роль для сборки SQLite в Docker
      - `files/` - Файлы, необходимые для сборки в Docker
        - `build.sh` - Скрипт сборки для Docker
        - `CMakeLists.txt` - Файл CMake для сборки в Docker
        - `Dockerfile` - Файл Docker для сборки
        - `sqlite-amalgamation-3260000/` - Копия исходного кода SQLite

### Виртуализация
- `debian-vm/` - Директория с конфигурацией виртуальной машины
  - `Vagrantfile` - Конфигурация Vagrant для создания VM с Debian

### SSH ключи
- `ssh_keys/` - Директория с SSH ключами для доступа к VM
  - `id_ed25519` - Приватный ключ
  - `id_ed25519.pub` - Публичный ключ

## Процесс сборки

Проект поддерживает два способа сборки:

1. **Локальная сборка**:
   ```bash
   mkdir -p build && cd build
   cmake ..
   make
   ```

2. **Сборка с использованием Docker**:
   ```bash
   docker build -t sqlite3-builder .
   docker run --rm -v "$(pwd)/output:/sqlite3/output" sqlite3-builder
   ```

## C++ проект с использованием Conan

В директории `conan/` находится пример простого C++ приложения с использованием пакетного менеджера Conan:

- `src/main.cpp` - исходный код программы, использующий библиотеку fmt
- `conanfile.py` - файл для управления зависимостями через Conan
- `CMakeLists.txt` - файл конфигурации CMake
- `build.sh` - скрипт для автоматизации процесса сборки

Для сборки проекта:
```bash
cd conan
bash build.sh
```

После сборки исполняемый файл будет доступен в директории `conan/build/hello_conan`.

## CI/CD

Настроен процесс непрерывной интеграции через GitLab CI, который автоматизирует сборку SQLite библиотеки и сохраняет результаты (библиотеку и лог) как артефакты, доступные в течение 1 недели после сборки.
