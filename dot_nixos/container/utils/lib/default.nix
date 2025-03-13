final: prev: {
  bindMountSuffix =
    {
      hostPath,
      mountPath,
      suffix,
      isReadOnly ? true,
    }:
    {
      hostPath = "${hostPath}/${suffix}";
      mountPoint = "${mountPath}/${suffix}";
      inherit isReadOnly;
    };
  bindMountClone =
    {
      path,
      isReadOnly ? true,
    }:
    {
      hostPath = path;
      mountPoint = path;
      inherit isReadOnly;
    };
}
