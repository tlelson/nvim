-- https://github.com/golang/tools/blob/master/gopls/doc/settings.md
return {
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}
