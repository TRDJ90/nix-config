{ config, pkgs, ... }:
{
  home.username = "thubie";
  home.homeDirectory = "/Users/thubie";
  home.stateVersion = "22.05";

  home.packages = with pkgs; [
    exa
    ripgrep
  ];

  programs.home-manager.enable = true;
}