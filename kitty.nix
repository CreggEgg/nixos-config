

{ config, pkgs, ... }:
{
  home.file = {
    "/home/churst/.config/kitty/kitty.conf" = {
        executable = true;
        text = ''
background #${config.lib.stylix.colors.base00}
        '';
    };
  };
}
