{ }:
{
  services.anacron.enable = true;

  # Optional: Configure anacrontab entries
  services.anacron.jobs = {
    monthly = {
      period = 30;
      exec = "/path/to/your/script";
      delay = 65;
    };
  };
}
