return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          never_show = { ".git" },
          hide_gitignored = false,
        },
      },
    },
  },
}
