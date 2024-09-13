{ config, pkgs, ... }:

{


  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "churst";
  home.homeDirectory = "/home/churst";


  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  imports = [./waybar/waybar.nix ./rofi/rofi.nix ./hypr/hyprland.nix];

  #dotfiles
  home.file = {
    # ".config/hypr/hyprland.conf" = {
    #   source = ''
    #     
    #   '';
    #   #config.lib.file.mkOutOfStoreSymlink "/home/churst/.config/home-manager/hypr/hyprland.conf";
    # };
    # ".config/hypr/hyprpaper.conf" = {
    #   source = config.lib.file.mkOutOfStoreSymlink "/home/churst/.config/home-manager/hypr/hyprpaper.conf";
    # };
    # ".config/waybar/power.sh" = {
    #   source = config.lib.file.mkOutOfStoreSymlink "/home/churst/.config/home-manager/power.sh";
    # };
    ".config/hypr/start.sh" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/churst/.config/home-manager/hypr/start.sh";
    };
    ".config/hypr/audio.sh" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/churst/.config/home-manager/hypr/audio.sh";
    };
    "wallpapers/wallpaper.jpg" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/churst/.config/home-manager/hypr/wallpaper.jpg";
    };
    # ".config/rofi/config.rasi" = {
    #   source = config.lib.file.mkOutOfStoreSymlink "/home/churst/.config/home-manager/rofi/config.rasi";
    # };
    # ".config/waybar/" = {
    #   source = config.lib.file.mkOutOfStoreSymlink "/home/churst/.config/home-manager/waybar/";
    # };
  };


  fonts.fontconfig.enable = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
     (pkgs.nerdfonts.override { fonts = [ "Iosevka" "FiraCode" ]; })
     pkgs.balena-cli
     pkgs.wineWowPackages.waylandFull
     pkgs.lutris
     pkgs.kakoune
     pkgs.spotify
     pkgs.google-chrome
     pkgs.appimage-run
     pkgs.p7zip
     pkgs.discord
     pkgs.zellij
     pkgs.odin
     pkgs.ols
     pkgs.rustup
     pkgs.nodejs_20
     pkgs.zlib
     pkgs.nodePackages.svelte-language-server
     pkgs.python3
     pkgs.rare
     pkgs.heroic
     pkgs.opam
     pkgs.gnumake42
     pkgs.neovide
     pkgs.ldtk
     pkgs.mold
     # pkgs.clang
     # pkgs.rocmPackages_5.llvm.clang-unwrapped
     pkgs.obs-studio
     pkgs.kdePackages.dolphin
     pkgs.alacritty
     pkgs.gradle_7
     pkgs.zulu21
     pkgs.ngrok
     pkgs.scanmem
     pkgs.geckodriver
     pkgs.lua
     pkgs.rust-bindgen
     pkgs.rustdesk
     pkgs.blockbench
     pkgs.unityhub
     pkgs.dotnet-sdk_8
     pkgs.csharp-ls
     pkgs.vscode
     pkgs.jetbrains.idea-community-bin
     pkgs.davinci-resolve
     pkgs.vesktop
     pkgs.zig
     pkgs.zls
     pkgs.gimp
     pkgs.idris
     pkgs.hyprcursor
     pkgs.idris2Packages.idris2Lsp

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    (pkgs.writeShellScriptBin "rebuild" ''
      sudo nixos-rebuild switch --flake ~/system
      git diff
      read -p "Commit message: " message
      git add -A
      git commit -am "$message"
    '')
    (pkgs.writeShellScriptBin "edit-system" ''
      sudo nvim ~/system/
      sudo nixos-rebuild switch --flake ~/system
    '')

  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };
  programs.bash.initExtra = "test -r /home/churst/.opam/opam-init/init.sh && . /home/churst/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true";
  
  

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/churst/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
    ONYX_PATH="/home/churst/.onyx";
  };
  home.sessionPath = [
    "/home/churst/.onyx/bin"
  ];



  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
