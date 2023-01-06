return {
  settings = {
    yaml = {
      -- Couldn't get formatting to work here. Overriden with null-ls
      format = {
        printWidth = 100,
        --singleQuote = true,
      },
      completion = true,
      -- Does not seem to produce the same suggestions as manually added ones below
      --schemaStore = {
      --enable = true,
      --},
      -- Find schemas in jsonls.lua or at: https://www.schemastore.org/json/
      schemas = {
        ["https://raw.githubusercontent.com/quantumblacklabs/kedro/develop/static/jsonschema/kedro-catalog-0.17.json"] = "conf/**/*catalog*",
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        -- When you can't do a glob match on a file. add it manually.
        -- E.G For cloudformation:
        -- # yaml-language-server: $schema=https://raw.githubusercontent.com/awslabs/goformation/master/schema/cloudformation.schema.json
      },
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
