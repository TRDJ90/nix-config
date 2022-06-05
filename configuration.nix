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
    brews = ["azure-cli"];
    casks = ["raycast" "karabiner-elements"];
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
