return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        hcl = { "hclfmt" },
      },
      formatters = {
        hclfmt = {
          command = "hclfmt",
          args = {},
          stdin = true,
        },
      },
    },
  },
}
