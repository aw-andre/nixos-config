{
  plugins.rainbow-delimiters = {
    enable = true;
    highlight = [
      "RainbowDelimiterRed"
      "RainbowDelimiterYellow"
      "RainbowDelimiterBlue"
    ];
  };
  autoCmd = [
    {
      event = [ "TextChanged" "TextChangedI" "TextChangedP" "TextChangedT" ];
      callback.__raw = "function () require('rainbow-delimiters').enable() end";
      desc = "Color delimiters";
    }
  ];
}
