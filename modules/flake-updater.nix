{
  config,
  lib,
  pkgs,
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
      default = "root";
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
      script = ''
        cd ${cfg.flakePath}
        ${pkgs.nix}/bin/nix flake update
      '';
      serviceConfig = {
        Type = "oneshot";
        User = cfg.user;
      };
    };
  };
}
