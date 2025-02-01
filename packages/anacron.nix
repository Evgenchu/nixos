{ }:
{
  services.anacron.enable = true;
  services.anacron.jobs = {
    monthly = {
      period = 30;
      exec = "cd .config/nixvim && nix flake update";
      delay = 15;
    };
  };
}
