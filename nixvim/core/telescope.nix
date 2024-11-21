{
  programs.nixvim.plugins.telescope = {
    enable = true;
    extensions = {
      file-browser.enable = true;
      fzf-native.enable = true;
    };
    settings = {
      defaults = {
        layout_config = {
          horizontal = {
            prompt_position = "top";
          };
        };
        sorting_strategy = "ascending";
      };
    };
    keymaps = {
      "<leader><leader>" = {
        action = "find_files";
	options = {
	  desc = "Find project files";
	};
      };
      "<leader>txt" = {
        action = "live_grep";
	options = {
	  desc = "Find files (Root dir)";
	};
      };
      "<leader>gc" = {
        action = "git_status";
	options = {
	  desc = "Git status";
	};
      };
    };
  };
}
