{ config, lib, ... }:
with lib;
let
  cfg = config.programs._1password-config;
in
{
  options = {
    programs._1password-config.shell-plugins = mkOption {
      type = types.listOf (types.enum [ "github" ]);
      default = [ ];
    };
  };

  config = {

  };
}
