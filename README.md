# nix-config
nix configuration

# notes
- important make sure to enable zsh in the darwin configuration.nix on macos. Because on macos 'zsh' is the default terminal shell. 

- important try staging files to git if "rebuild switch --flake" doesn't work

- To bootstrap from nix with a nix-darwin and home-manager flake we need to bootstrap after installing nix. 'nix build .#darwinConfigurations.{host}.system' this will bootstrap it all and create/link a result folder where we can call darwin-rebuild from './result/sw/darwin-rebuild switch --flake .' 


- to update system use the command 'darwin-rebuild switch --flake .'
