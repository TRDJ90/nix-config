{ config, pkgs, ... }:
{
  home.username = "thubie";
  home.homeDirectory = "/Users/thubie";
  home.stateVersion = "22.05";

  home.packages = with pkgs; [
    exa
    ripgrep
    
    # development tooling
    # helix
    dotnet-sdk
    omnisharp-roslyn
    rustc
    cargo
    rustfmt
    rust-analyzer
    clippy
  ];

  # TODO: Find out how to break this up in seperate files and import
  programs.zsh = {
    enable = true;
    initExtra = ''
      eval "$(starship init zsh)"
    '';
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;

      username = {
        format = "[$user](bold blue) ";
        disabled = false;
        show_always = true;
      };

      hostname = {
        ssh_only = false;
        format = "on [$hostname](bold red) ";
        trim_at = ".local";
        disabled = true;
      };

      aws = {
        disabled = true;
      };

      character = {
        success_symbol = "[➜](bold green)";
        format = "[└──>](bold green) ";
      };
    };
  };
  
  programs.helix = {
    enable = true;
    settings = {
      theme = "everforest_dark";
      editor = {
        line-number = "relative";
        mouse = true;
        gutters = ["diagnostics" "line-numbers"];
        true-color = true;
        auto-completion = true;
        rulers = [80];
      };
      editor.cursor-shape = {
        insert = "bar";
        normal = "block";
        select = "block";
      };
      editor.lsp = {
        display-messages = true;
      };
      editor.whitespace.render = {
        space = "all";
        tab = "all";
        newline = "none";
      };
    };
  };
  
  programs.home-manager = {
    enable = true;
  };

  home.sessionVariables = {
    RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
  };
}