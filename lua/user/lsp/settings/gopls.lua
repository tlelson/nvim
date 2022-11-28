-- https://github.com/golang/tools/blob/master/gopls/doc/settings.md
-- This doesn't seem to work
return {
  settings = {
    gopls = {
      --ui = {
        --analyses = {
          --asmdecl = false,
          --assign = false,
          --atomic = false,
          --atomicalign = false,
          --bools = false,
          --buildtag = false,
          --cgocall = false,
          --composites = false,
          --copylocks = false,
          --deepequalerrors = false,
          --embed = false,
          --errorsas = false,
          --fieldalignment = false,
          --httpresponse = false,
          --ifaceassert = false,
          --infertypeargs = false,
          --loopclosure = false,
          --lostcancel = false,
          --nilfunc = false,
          --nilness = false,
          --printf = false,
          --shadow = false,
          --shift = false,
          --simplifycompositelit = false,
          --simplifyrange = false,
          --simplifyslice = false,
          --sortslice = false,
          --stdmethods = false,
          --stringintconv = false,
          --structtag = false,
          --testinggoroutine = false,
          --tests = false,
          --timeformat = false,
          --unmarshal = false,
          --unreachable = false,
          --unsafeptr = false,
          --unusedparams = false,
          --unusedresult = false,
          --unusedwrite = false,
          --useany = false,
          --fillreturns = false,
          --nonewvars = false,
          --noresultvalues = false,
          --undeclaredname = false,
          --unusedvariable = false,
          --fillstruct = false,
          --stubmethods = false,
        --},
      --},
      staticcheck = false,
    },
  },
}
