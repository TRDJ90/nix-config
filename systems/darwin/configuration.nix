{ pkgs, ... }:
{
  users.users.thubie = {
    name = "thubie";
    home = "/Users/thubie";
  };

  # Zsh is the default terminal in macos so make sure its enabled
  # Create /etc/bashrc that loads the nix-darwin environment.
  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    alacritty
  ];

  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
  };
  
  /* To do wait for the new Yabai 4.0  and skhd on nix packages
  services.yabai = {
    enable = true;
    package = pkgs.yabai;
    enableScriptingAddition = true;
    config = {
      window_shadow = "on";
      window_border = "on";
      window_opacity = "off";
      window_placement = "second_child";
      window_gap = 12;
      
      layout = "bsp";
      
      top_padding = 8;
      bottom_padding = 8;
      left_padding = 8;
      right_padding = 8;
    };
    
    extraConfig = ''
      yabai -m rule --add app="^System Preferences$" manage=off
      yabai -m rule --add app="^Telegram$" manage=off
      yabai -m rule --add app="^Finder$" manage=off
      yabai -m rule --add app="^Mail$" manage=off
      yabai -m rule --add app="^Microsoft Teams$" manage=off
      yabai -m rule --add app="^zoom.us$" manage=off
    '';
  };
  
  services.skhd = {
    enable = false;
    package = pkgs.skhd;
    skhdConfig = ''
      ###### Yabai keybindings #####
      
      # focus window
      alt - h : yabai -m window --focus west
      alt - l : yabai -m window --focus east
      alt - k : yabai -m window --focus north
      alt - j : yabai -m window --focus south
      
      # swap managed window 
      shift + alt - h : yabai -m window --swap west
      shift + alt - l : yabai -m window --swap east
      shift + alt - k : yabai -m window --swap north
      shift + alt - j : yabai -m window --swap south
      
      # move managed window
      shift + cmd - h : yabai -m window --warp west
      shift + cmd - l : yabai -m window --warp east
      shift + cmd - k : yabai -m window --warp north
      shift + cmd - j : yabai -m window --warp south
      
      # increase window size
      shift + alt - a : yabai -m window --resize left:-20:0
      shift + alt - d : yabai -m window --resize right:20:0
      shift + alt - s : yabai -m window --resize top:0:-20
      shift + alt - w : yabai -m window --resize bottom:0:20
      
      # fast focus desktop
      cmd + alt - x : yabai -m space --focus recent
      cmd + alt - 1 : yabai -m space --focus 1
      cmd + alt - 2 : yabai -m space --focus 2
      cmd + alt - 3 : yabai -m space --focus 3
      cmd + alt - 4 : yabai -m space --focus 4
      cmd + alt - 5 : yabai -m space --focus 5
      cmd + alt - 6 : yabai -m space --focus 6
      cmd + alt - 7 : yabai -m space --focus 7
      cmd + alt - 8 : yabai -m space --focus 8
      cmd + alt - 9 : yabai -m space --focus 9
      
      # send window to desktop and follow focus 
      shift + cmd - z : yabai -m window --space next; yabai -m space --focus next
      shift + cmd - 1 : yabai -m window --space 1; yabai -m space --focus 1
      shift + cmd - 2 : yabai -m window --space 2; yabai -m space --focus 2
      shift + cmd - 3 : yabai -m window --space 3; yabai -m space --focus 3
      shift + cmd - 4 : yabai -m window --space 4; yabai -m space --focus 4
      shift + cmd - 5 : yabai -m window --space 5; yabai -m space --focus 5
      shift + cmd - 6 : yabai -m window --space 6; yabai -m space --focus 6
      shift + cmd - 7 : yabai -m window --space 7; yabai -m space --focus 7
      shift + cmd - 8 : yabai -m window --space 8; yabai -m space --focus 8
      shift + cmd - 9 : yabai -m window --space 9; yabai -m space --focus 9
      
      
      # toggle window zoom
      alt - d : yabai -m window --toggle zoom-parent
      alt - f : yabai -m window --toggle zoom-fullscreen
      
      # toggle window split type
      alt - e : yabai -m window --toggle split
      '';
  };
  */

  homebrew = {
    enable = true;
    brews = ["azure-cli" "yabai" "skhd"];
    casks = ["raycast" "karabiner-elements" "hammerspoon"];
    taps = [];
  };
  
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  fonts.fontDir.enable = true;
  fonts.fonts = with pkgs; [
	recursive
	(nerdfonts.override { 
		fonts = [
			"Iosevka"
			"JetBrainsMono"
		]; 
	})
  ];
}
