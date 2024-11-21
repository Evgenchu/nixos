{
  programs.nixvim = {
    plugins = {
      neo-tree = {
        enable = true;
	sources = ["filesystem" "buffers" "git_status" "document_symbols"];
	addBlankLineAtTop = false;
        filesystem = {
          bindToCwd = false;
          followCurrentFile = {
            enabled = true;
          };
        };
      };
    };
  };
}
