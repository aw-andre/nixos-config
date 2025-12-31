{
  users.users.andreaw.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILSoI6azKnZWL3WyjAuhV8AO04/A6NZD9VQXrUAl6iSs"
  ];
  networking.firewall.allowedTCPPorts = [ 22 ];
  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
  };
}
