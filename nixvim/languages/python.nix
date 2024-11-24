{
  programs.nixvim = {
    plugins = {
      lsp.servers.pylsp = {
        enable = true;
        settings.plugins = {
          black.enabled = true;
          flake8.enabled = true;
          isort.enabled = true;
          jedi.enabled = true;
          mccabe.enabled = true;
          pycodestyle.enabled = true;
          pydocstyle.enabled = true;
          pyflakes.enabled = true;
          pylint.enabled = true;
          rope.enabled = true;
          yapf.enabled = true;
        };
      };
    };
  };
}
