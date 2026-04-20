{
  services.zapret-discord-youtube = {
    enable = false;
    config = "general(ALT)"; # Или любой конфиг из папки configs (general, general(ALT), general (SIMPLE FAKE) и т.д.)

    # Game Filter: "null" (отключен), "all" (TCP+UDP), "tcp" (только TCP), "udp" (только UDP)
    gameFilter = "null"; # или "all", "tcp", "udp"

    # Добавляем кастомные домены в list-general-user.txt
    listGeneral = [
      "googleusercontent.com"
      "accounts.google.com"
      "googleadservices.com"
      "googlevideo.com"
      "gvt1.com"
      "jnn-pa.googleapis.com"
      "play.google.com"
      "wide-youtube.l.google.com"
      "youtu.be"
      "youtube-nocookie.com"
      "youtube-ui.l.google.com"
      "youtube.com"
      "youtube.googleapis.com"
      "youtubeembeddedplayer.googleapis.com"
      "youtubei.googleapis.com"
      "yt-video-upload.l.google.com"
      "yt.be"
      "ytimg.com"
      "ggpht.com"
    ];

    # Добавляем домены в list-exclude-user.txt (исключения)
    listExclude = [ ];

    # Добавляем IP адреса в ipset-all.txt
    ipsetAll = [ ];

    # Добавляем IP адреса в ipset-exclude-user.txt (исключения)
    ipsetExclude = [ ];
  };
}
