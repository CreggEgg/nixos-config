{ config, pkgs, ... }:
{
  home.packages = [
    pkgs.rofi-wayland
  ];

# test
  home.file = {
    "/home/churst/.config/rofi/config.rasi" = {
      text = ''
configuration {
    font:				"${config.lib.stylix.fonts.serif.name}";
    show-icons:				true;
    icon-theme:				"Arc-X-D";
    display-drun:			"Apps";
    drun-display-format:		"{name}";
    scroll-method:			0;
    disable-history:			false;
    sidebar-mode:			false;
}

window {
    background-color: #${config.lib.stylix.colors.base00};
    border:           0;
    padding:          30;
}
listview {
}
mainbox {
    border:  0;
    padding: 0;
}
message {
    border:       2px 0px 0px ;
    border-color: @separatorcolor;
    padding:      1px ;
}
textbox {
    text-color: @foreground;
}
listview {
    fixed-height: 0;
    border:       8px 0px 0px ;
    border-color: @separatorcolor;
    spacing:      8px ;
    scrollbar:    false;
    padding:      2px 0px 0px ;
}
element {
    border:  0;
    padding: 1px ;
}
element-text {
    background-color: inherit;
    text-color:       inherit;
}
element.normal.normal {
    background-color: @normal-background;
    text-color:       @normal-foreground;
}
element.normal.urgent {
    background-color: @urgent-background;
    text-color:       @urgent-foreground;
}
element.normal.active {
    background-color: @active-background;
    text-color:       @active-foreground;
}
element.selected.normal {
    background-color: @selected-normal-background;
    text-color:       @selected-normal-foreground;
}
element.selected.urgent {
    background-color: @selected-urgent-background;
    text-color:       @selected-urgent-foreground;
}
element.selected.active {
    background-color: @selected-active-background;
    text-color:       @selected-active-foreground;
}
element.alternate.normal {
    background-color: @alternate-normal-background;
    text-color:       @alternate-normal-foreground;
}
element.alternate.urgent {
    background-color: @alternate-urgent-background;
    text-color:       @alternate-urgent-foreground;
}
element.alternate.active {
    background-color: @alternate-active-background;
    text-color:       @alternate-active-foreground;
}
scrollbar {
    width:        4px ;
    border:       0;
    handle-color: @normal-foreground;
    handle-width: 8px ;
    padding:      0;
}
mode-switcher {
    border:       2px 0px 0px ;
    border-color: @separatorcolor;
}
button {
    spacing:    0;
    text-color: @normal-foreground;
}
button.selected {
    background-color: @selected-normal-background;
    text-color:       @selected-normal-foreground;
}
inputbar {
    spacing:    0;
    text-color: @normal-foreground;
    padding:    1px ;
}
case-indicator {
    spacing:    0;
    text-color: @normal-foreground;
}
entry {
    spacing:    0;
    text-color: @normal-foreground;
}
prompt {
    spacing:    0;
    text-color: @normal-foreground;
}
inputbar {
    children:   [ prompt,textbox-prompt-colon,entry,case-indicator ];
}
textbox-prompt-colon {
    expand:     false;
    str:        ":";
    margin:     0px 0.3em 0em 0em ;
    text-color: @normal-foreground;
}
      '';
      executable = false;
    };
  };
}
