{
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.services.flakeUpdater;
in
{
  options.services.flakeUpdater = {
    enable = mkEnableOption "Weekly flake update service";

    flakePath = mkOption {
      type = types.str;
      description = "Path to the flake directory";
      example = "/home/user/myflake";
    };

    user = mkOption {
      type = types.str;
      description = "User under which the service will run";
      default = "evgeni";
    };

    startTime = mkOption {
      type = types.str;
      description = "When to run the service (in systemd calendar format)";
      default = "Sun *-*-* 04:00:00";
    };
  };

  config = mkIf cfg.enable {
    systemd.timers.flake-updater = {
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnCalendar = cfg.startTime;
        Persistent = true;
        Unit = "flake-updater.service";
      };
    };

    systemd.services.flake-updater = {
      description = "Weekly flake update service";
      serviceConfig = {
        User = cfg.user;
        WorkingDirectory = cfg.flakePath;
        Environment = "PATH=/run/current-system/sw/bin:$PATH";
        ExecStart = "/bin/sh -c 'eval \"$(ssh-agent -s)\" && ssh-add /home/${cfg.user}/.ssh/id_rsa && nix flake update && git add . && git commit -m \"Update flake\" && git push'";
      };
    };
  };
}
