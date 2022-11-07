
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
        -- Cloudformation Tags
        "!Base64 scalar",
        "!Cidr scalar",
        "!And sequence",
        "!Equals sequence",
        "!If sequence",
        "!Not sequence",
        "!Or sequence",
        "!Condition scalar",
        "!FindInMap sequence",
        "!GetAtt scalar",
        "!GetAtt sequence",
        "!GetAZs scalar",
        "!ImportValue scalar",
        "!Join sequence",
        "!Select sequence",
        "!Split sequence",
        "!Sub scalar",
        "!Transform mapping",
        "!Ref scalar",
      },
    }
  }
}
