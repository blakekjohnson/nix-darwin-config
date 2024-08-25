{ pkgs, self, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    git
    vim
    karabiner-elements
  ];
  
  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;
  
  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";
  
  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;
  
  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;
  
  system.stateVersion = 4;
  
  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
  
  # Setup user
  users.users.blakej = {
    name = "blakej";
    home = "/Users/blakej";
  };
}
