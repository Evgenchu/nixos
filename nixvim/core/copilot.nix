{
  programs.nixvim = {
    plugins.copilot-chat = {
      enable = true;
    };
    keymaps = [
      {
        key = "<leader>ca";
        action = "<CMD>CopilotChatToggle<CR>";
        options.desc = "Toggle chat";
      }
      {
        key = "<leader>cr";
        action = "<CMD>CopilotChatReview<CR>";
        options.desc = "Review the selected code";
      }
      {
        key = "<leader>ce";
        action = "<CMD>CopilotChatExplain<CR>";
        options.desc = "Give an explanation for the selected code";
      }
      {
        key = "<leader>cd";
        action = "<CMD>CopilotChatDocs<CR>";
        options.desc = "Add documentation for the selection";
      }
      {
        key = "<leader>cp";
        action = "<CMD>CopilotChatTests<CR>";
        options.desc = "Add tests for my code";
      }
    ];
  };
}
