{ config, pkgs, ... }:
{
  home.username = "thubie";
  home.homeDirectory = "/Users/thubie";
  home.stateVersion = "22.05";

  home.packages = with pkgs; [
    exa
    ripgrep
    
    # development tooling
    tree-sitter

    #C-sharp
    dotnet-sdk
    
    #Rust
    rustc
    cargo
    rustfmt
    clippy
    
    #LSP servers
    sumneko-lua-language-server
    rust-analyzer
    rnix-lsp
    omnisharp-roslyn
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
 
  programs.alacritty = {
    enable = true;
    settings = {
      window.padding.x = 5;
      window.padding.y = 5;
      window.opacity = 0.75;
      window.decorations = "full";
      window.dynamic_title = true;
      
      live_config_reload = true;
      use_thin_strokes = true;
      
      cursor.style.shape = "Block";
      cursor.style.blinking = "Always";
      blink_interval = 500;
      
      font = {
        size = 15;
        normal.family = "Iosevka Nerd Font";
        normal.style = "Light";
        bold.family = "Iosevka Nerd Font";
        bold.style = "Bold";
        italic.family = "Iosevka Nerd Font";
        italic.style = "Italic";
      };
      
      colors = {
        cursor.cursor = "#81a1c1";
        primary.background = "#2b3339";
        primary.foreground = "#d3c6aa";
        normal = {
          black =    "#4b565c";
          red =      "#e67e80";
          green =    "#a7c080";
          yellow =   "#dbbc7f";
          blue =     "#7fbbb3";
          magenta =  "#d699b6";
          cyan =     "#83c092";
          white =    "#d3c6aa";
        };
        bright = {
          black = "#4b565c";
          red = "#e67e80";
          green = "#a7c080";
          yellow = "#dbbc7f";
          blue = "#7fbbb3";
          magenta = "#d699b6";
          cyan = "#83c092";
          white = "#d3c6aa";
        };
      };
    };
  };
   
  programs.home-manager = {
    enable = true;
  };

  home.sessionVariables = {
    RUST_BACKTRACE = 1;
    RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
  };
}