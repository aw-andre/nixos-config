{
  programs.ripgrep = {
    enable = true;
    arguments = [
      "--max-columns=150"
      "--max-columns-preview"
      "--smart-case"
      "--column"
      "--hidden"

      "--type-add"
      "web:*.{html,css,js,php,phtml}*"

      "--type-add"
      "text:*.{txt,text,md}*"

      "--glob"
      "!.git/*"

      "--colors=line:none"
      "--colors=line:style:intense"
      "--colors=path:style:underline"
    ];
  };
}
