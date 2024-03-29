{config, ...}: {
  networking.hostName = "astoria"; # Define your hostname.
  networking.enableIPv6 = false;
  # add an extra host for debugging networking
  networking.extraHosts = ''
    127.0.0.1 extra-host
    127.0.0.1 hostname-external
    127.0.0.1 localstack-hostname
  '';

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  services.resolved = {
    enable = true;
    domains = ["lan"];
    fallbackDns = ["192.168.0.2"];
    extraConfig = ''
      DNS=192.168.0.2
    '';
  };

  networking.networkmanager = {
    enable = true;
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ 22 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # TODO
  networking.firewall.enable = false;
}
