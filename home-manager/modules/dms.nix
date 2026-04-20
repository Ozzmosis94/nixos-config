{ inputs, pkgs, ... }: {
  programs.dank-material-shell = {
    enable = true;
    # Core features
    enableSystemMonitoring = true;     # System monitoring widgets (dgop)
    enableVPN = true;                  # VPN management widget
    enableDynamicTheming = true;       # Wallpaper-based theming (matugen)
    enableAudioWavelength = true;      # Audio visualizer (cava)
    enableCalendarEvents = true;       # Calendar integration (khal)
    enableClipboardPaste = true;       # Pasting items from the clipboard (wtype)
    niri = {
      #enableKeybinds = true;   # Sets static preset keybinds
      enableSpawn = true;      # Auto-start DMS with niri, if enabled
    };
    settings = {
      acLockTimeout = 0;
      acMonitorTimeout = 0;
      acProfileName = "";
      acSuspendBehavior = 0;
      acSuspendTimeout = 0;

      activeDisplayProfile = { };

      animationSpeed = 1;

      appDrawerSectionViewModes = {};

      appIdSubstitutions = [
        {
          pattern = "Spotify";
          replacement = "spotify";
          type = "exact";
        }
        {
          pattern = "beepertexts";
          replacement = "beeper";
          type = "exact";
        }
        {
          pattern = "home assistant desktop";
          replacement = "homeassistant-desktop";
          type = "exact";
        }
        {
          pattern = "com.transmissionbt.transmission";
          replacement = "transmission-gtk";
          type = "contains";
        }
        {
          pattern = "^steam_app_(\\d+)$";
          replacement = "steam_icon_$1";
          type = "regex";
        }
      ];

      appLauncherGridColumns = 4;
      appLauncherViewMode = "list";
      appPickerViewMode = "grid";

      appsDockActiveColorMode = "primary";
      appsDockColorizeActive = false;
      appsDockEnlargeOnHover = false;
      appsDockEnlargePercentage = 125;
      appsDockHideIndicators = false;
      appsDockIconSizePercentage = 100;

      audioInputDevicePins = {};
      audioOutputDevicePins = {};

      audioScrollMode = "volume";
      audioVisualizerEnabled = true;
      audioWheelScrollAmount = 5;

      barConfigs = [
        {
          id = "default";
          name = "Main Bar";
          enabled = true;
          position = 0;

          autoHide = false;
          autoHideDelay = 250;

          clickThrough = false;

          innerPadding = 4;
          spacing = 4;

          transparency = 1;
          widgetTransparency = 1;

          borderEnabled = false;
          borderColor = "surfaceText";
          borderOpacity = 1;
          borderThickness = 1;

          shadowColorMode = "text";
          shadowCustomColor = "#000000";
          shadowIntensity = 0;
          shadowOpacity = 60;

          leftWidgets = [
            "launcherButton"
            "workspaceSwitcher"
            "focusedWindow"
          ];

          centerWidgets = [
            "music"
            "clock"
            "weather"
          ];

          rightWidgets = [
            { id = "systemTray"; enabled = true; }
            { id = "keyboard_layout_name"; enabled = true; keyboardLayoutNameCompactMode = true; }
            { id = "clipboard"; enabled = true; }
            { id = "cpuUsage"; enabled = true; }
            { id = "memUsage"; enabled = true; }
            { id = "notificationButton"; enabled = true; }
            { id = "battery"; enabled = true; }
            { id = "controlCenterButton"; enabled = true; }
          ];

          screenPreferences = [ "all" ];

          scrollEnabled = true;
          scrollXBehavior = "column";
          scrollYBehavior = "workspace";

          widgetPadding = 8;

          visible = true;
        }
      ];

      barMaxVisibleApps = 0;
      barMaxVisibleRunningApps = 0;
      barShowOverflowBadge = true;

      batteryChargeLimit = 100;

      bluetoothDevicePins = {};
      brightnessDevicePins = {};

      browserPickerViewMode = "grid";

      clockCompactMode = false;
      clockDateFormat = "";

      configVersion = 5;

      controlCenterShowAudioIcon = true;
      controlCenterShowBluetoothIcon = true;
      controlCenterShowNetworkIcon = true;
      controlCenterShowScreenSharingIcon = true;
      controlCenterShowVpnIcon = true;

      controlCenterWidgets = [
        { id = "volumeSlider"; enabled = true; width = 50; }
        { id = "brightnessSlider"; enabled = true; width = 50; }
        { id = "wifi"; enabled = true; width = 50; }
        { id = "bluetooth"; enabled = true; width = 50; }
        { id = "audioOutput"; enabled = true; width = 50; }
        { id = "audioInput"; enabled = true; width = 50; }
        { id = "nightMode"; enabled = true; width = 50; }
        { id = "darkMode"; enabled = true; width = 50; }
      ];

      cornerRadius = 12;

      cursorSettings = {
        size = 24;
        theme = "System Default";

        niri = {
          hideAfterInactiveMs = 0;
          hideWhenTyping = false;
        };

        hyprland = {
          hideOnKeyPress = false;
          hideOnTouch = false;
          inactiveTimeout = 0;
        };

        dwl = {
          cursorHideTimeout = 0;
        };
      };

      dockIconSize = 40;
      dockPosition = 1;
      dockTransparency = 1;

      enableRippleEffects = true;

      fadeToDpmsEnabled = true;
      fadeToLockEnabled = true;

      fontFamily = "Inter Variable";
      fontScale = 1;
      fontWeight = 400;

      iconTheme = "Papirus";
      #iconTheme = "System Default";

      lockScreenShowTime = true;
      lockScreenShowDate = true;

      monoFontFamily = "Fira Code";

      nightModeEnabled = false;

      notificationTimeoutLow = 5000;
      notificationTimeoutNormal = 5000;

      powerMenuActions = [
        "reboot"
        "logout"
        "poweroff"
        "lock"
        "suspend"
        "restart"
      ];

      powerMenuDefaultAction = "logout";

      showBattery = true;
      showClock = true;
      showCpuUsage = true;
      showMemUsage = true;
      showMusic = true;
      showNotificationButton = true;
      showSystemTray = true;
      showWeather = true;
      showWorkspaceSwitcher = true;

      soundsEnabled = true;

      use24HourClock = true;

      wallpaperFillMode = "Fill";

      weatherEnabled = true;

      workspaceDragReorder = true;
    };
  };
}
