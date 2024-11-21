{
  programs.nixvim = {
    globals.mapleader = " ";
    keymaps = [
      {
        mode = ["n"];
        key = "<leader>e";
	action = "<cmd>Neotree toggle dir=./<cr>";
        options = {desc = "Open/Close Neotree (pwd)";};
      }
      {
        mode = ["n"];
	key = "<leader>E";
	action = "<cmd>Neotree toggle dir=~<cr>";
	options = {desc = "Open/Close Neotree (root dir)";}; 
      }
    ];
  };
}
