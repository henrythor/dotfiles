return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "flake8",
        "prettierd",
      },
    },
  },
}
