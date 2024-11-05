{ config, pkgs, ... }:
{
  home.file = {
    "/home/churst/.config/fuzzel/fuzzel.ini" = {
        executable = true;
        text = ''
font="${config.stylix.fonts.serif.name}"
[colors]
background=${config.lib.stylix.colors.base00}ff
text=${config.lib.stylix.colors.base05}ff
prompt=${config.lib.stylix.colors.base05}ff
input=${config.lib.stylix.colors.base04}ff
match=${config.lib.stylix.colors.base04}ff
selection=${config.lib.stylix.colors.base01}ff
selection-text=${config.lib.stylix.colors.base04}ff
border=${config.lib.stylix.colors.base0D}ff
        '';
    };
  };
}
