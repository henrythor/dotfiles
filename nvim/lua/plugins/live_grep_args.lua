return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        keys = {
          {
            "<leader>fW",
            ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
            "Live grep (Args)",
          },
        },
      },
    },
    config = function()
      require("telescope").load_extension("live_grep_args")
    end,
    keys = {
      { "<leader>fg", "<cmd> Telescope git_files <CR>", "Find in git" },
    },
  },
}
