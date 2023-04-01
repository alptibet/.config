return {
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        command = 'clippy',
        assist = { importMergeBehavior = "last", importPrefix = "by_self" },
        cargo = { loadOutDirsFromCheck = true },
        procMacro = { enable = true }
      }
    }
  }
}
