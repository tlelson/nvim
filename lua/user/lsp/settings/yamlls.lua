
return {
  settings = {
    yaml = {
      -- Couldn't get formatting to work here. Overriden with null-ls
      format = {
        printWidth = 100,
        singleQuote = true,
      },
      completion = true,
      customTags = {
        "!fn",
        "!And",
        "!If",
        "!Not",
        "!Equals",
        "!Or",
        "!FindInMap sequence",
        "!Base64",
        "!Cidr",
        "!Ref",
        "!Ref Scalar",
        "!Sub",
        "!GetAtt",
        "!GetAZs",
        "!ImportValue",
        "!Select",
        "!Split",
        "!Join sequence"
      },
    }
  }
}
