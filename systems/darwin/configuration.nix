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
  
  homebrew = {
    enable = true;
    cleanup = "uninstall";
    brews = [
      "azure-cli" 
      "yabai"
    ];
    casks = [
      "anki"
      "azure-data-studio"
      "brave-browser"
      "hammerspoon"
      "karabiner-elements" 
      "microsoft-edge"
      "microsoft-teams"
      "microsoft-office"
      "raycast" 
      "telegram-desktop"
      "vlc"
      "visual-studio-code"
      "zoom"
    ];
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
