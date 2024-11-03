{ config, pkgs, ... }:
{
  home.file = {
    "/home/churst/.config/mako/config" = {
        executable = true;
        text = ''
background-color=#${config.lib.stylix.colors.base00}
border-color=#${config.lib.stylix.colors.base08}
text-color=#${config.lib.stylix.colors.base08}
border-radius=25
        '';
    };
  };
}
