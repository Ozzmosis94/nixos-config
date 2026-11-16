# NixOS configuration

Мультихостовая конфигурация NixOS с Flakes и Home Manager. Общие модули отделены от аппаратной конфигурации конкретной машины. Текущий хост — `nixos` с KDE Plasma 6.

## Структура

```text
flake.nix                      # mkHost: общая сборка нескольких хостов
flake.lock                     # закреплённые версии Nixpkgs и Home Manager
hosts/nixos/
  default.nix                  # профили и загрузчик хоста
  hardware-configuration.nix   # UUID разделов ТОЛЬКО этого хоста
nixos/modules/                 # переиспользуемые модули NixOS
home-manager/                  # базовый конфиг и модули пользователя
profiles/nixos/
  desktop.nix                  # KDE, PipeWire, печать и основные программы
  development.nix              # Docker, Podman, Zed FHS
  work.nix                     # корпоративный hosts и insecure registry
profiles/home/
  desktop.nix                  # мессенджеры, офис и шрифты
  development.nix              # Node.js, Yarn, direnv
```

GNOME/GDM, Xray и Pritunl удалены из активной декларативной конфигурации. `home-manager/modules/zed.nix` сохранён как НЕАКТИВНЫЙ модуль: он содержит привязку к SOCKS5-прокси `localhost:1080`, поэтому не подключается автоматически. Сам редактор установлен через `zed-editor-fhs`.

## Применение на существующем ПК

Перед сменой GNOME на KDE сделай резервную копию важных данных, убедись в наличии TTY и возможности выбрать предыдущее поколение через systemd-boot.

```bash
cd ~/nixos-config
git switch refactor/multi-host-kde
nix flake check --show-trace
sudo nixos-rebuild build --flake .#nixos
sudo nixos-rebuild test --flake .#nixos
# Проверь KDE, сеть, Docker и необходимые рабочие программы.
sudo nixos-rebuild switch --flake .#nixos
```

`nixos-rebuild test` применяет конфигурацию без установки её как загрузочной. `switch` устанавливает её как текущую. При проблемах после перезагрузки выбирай старое поколение в меню загрузчика.

В `hosts/nixos/default.nix` профиль `work.nix` остаётся включённым, чтобы не потерять внутренние адреса и доступ к Docker registry. На новых личных машинах не импортируй его. Registry пока помечен `insecure`: предпочтительнее HTTPS и доверенный сертификат.

`flake.lock` намеренно не менялся. Обновить зависимости позже можно через `nix flake update`, затем повторно проверить и протестировать сборку.

## Добавление новой машины

1. Создай `hosts/laptop/default.nix` и сгенерированный **на ноутбуке** `hosts/laptop/hardware-configuration.nix`. Не копируй UUID и аппаратные параметры с `nixos`.
2. В `hosts/laptop/default.nix` подключи подходящие профили из `profiles/nixos/` и необходимый загрузчик.
3. Добавь запись в `nixosConfigurations` внутри `flake.nix`:

```nix
laptop = mkHost {
  hostname = "laptop";
  stateVersion = "26.05"; # пример: укажи версию ПЕРВОЙ установки
  modules = [ ./hosts/laptop ];
  homeModules = [
    ./profiles/home/desktop.nix
    ./profiles/home/development.nix
  ];
};
```

При необходимости задай `username = "another-user";`; по умолчанию используется `ozzmosis`. Для headless-сервера не подключай графические профили, а загружай только требуемые модули. Доступ к Docker выдаётся пользователю только через профиль `development.nix`.

4. Добавь файлы в Git (`git add`), затем выполни `sudo nixos-rebuild build --flake .#laptop`.

## Общие рекомендации

- Секреты нельзя помещать в открытые Nix-модули и Nix Store. `configs/` игнорируется Git.
- `system.stateVersion` и `home.stateVersion` текущего хоста сохранены равными `25.11`.
- Раз в неделю выполняется Nix GC для поколений старше 30 дней, а systemd-boot хранит до 10 записей.
- Для использования отдельных приложений на разных компьютерах создавай новые профили, не дублируй полный `configuration.nix`.
