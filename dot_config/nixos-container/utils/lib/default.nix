final: prev: {
  bindMountSuffix =
    {
      hostPath,
      mountPath,
      suffix,
      isReadOnly ? true,
    }:
    {
      "${mountPath}/${suffix}" = {
        hostPath = "${hostPath}/${suffix}";
        inherit isReadOnly;
      };
    };
  bindMountClone =
    {
      path,
      isReadOnly ? true,
    }:
    {
      "${path}" = {
        hostPath = path;
        inherit isReadOnly;
      };
    };
}
