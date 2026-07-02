#!/bin/bash
echo "🚀 Запуск установки It-sMyLive_2.0..."

# Установка ansible, если нет
sudo apt update && sudo apt install -y ansible git

# Клонирование репозитория во временную папку
TMP_DIR=$(mktemp -d)
git clone https://github.com/LAG-Lagendary/It-sMyLive_2.0.git $TMP_DIR

# Запуск плейбука
ansible-playbook -i "localhost," --connection=local $TMP_DIR/playbook.yml --ask-become-pass

# Очистка
rm -rf $TMP_DIR
echo "✅ Готово!"