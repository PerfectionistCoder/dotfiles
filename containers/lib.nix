with builtins;
{
  pathToImportAttr =
    list: args:
    map (
      x:
      let
        attr = if typeOf x == "path" then (import x) else x;
      in
      if typeOf attr == "lambda" then (attr args) else attr
    ) list;
}
