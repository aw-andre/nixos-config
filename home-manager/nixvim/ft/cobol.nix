{ pkgs, ... }: {
  # plugins.lsp.servers.cobol_ls = {
  #   enable = true;
  #   # package = pkgs.stdenv.mkDerivation rec {
  #   #   pname = "cobol-language-support";
  #   #   version = "2.4.0";
  #   #
  #   #   src = pkgs.fetchurl {
  #   #     url =
  #   #       "https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/releases/download/${version}/cobol-language-support-linux-x64-${version}.vsix";
  #   #     sha256 = "sha256-IzilO+dzeU+jMg8Zk8WzidlGHEmIkROZoAhaKCzs7M0=";
  #   #   };
  #   #
  #   #   nativeBuildInputs = [ pkgs.unzip ];
  #   #
  #   #   unpackPhase = "true";
  #   #
  #   #   installPhase = ''
  #   #     mkdir -p $out/bin
  #   #     unzip $src -d $out
  #   #     cp $out/extension/server/native/server-linux $out/bin
  #   #     chmod +x $out/bin/server-linux
  #   #   '';
  #   # };
  #   package = pkgs.maven.buildMavenPackage {
  #     pname = "cobol_ls";
  #     version = "1.0.0";
  #     src = pkgs.fetchFromGitHub {
  #       owner = "eclipse-che4z";
  #       repo = "che-che4z-lsp-for-cobol";
  #       rev = "e2118067aec59369f8d6f662ec321828e836b9c6";
  #       hash = "sha256-rkK8NyZ3vRoGhiJcpweexHjvox1HRbhQncMj25nIl9o=";
  #     } + "/server";
  #     mvnHash = "sha256-mDKlDi6LXJLKWkYSjiz3Ejp0s5I/JMjg9umDQAmpByA=";
  #     nativeBuildInputs = with pkgs; [ makeWrapper ];
  #
  #     doCheck = false;
  #
  #     installPhase = ''
  #       mkdir -p $out/bin $out/share/cobol_ls
  #       install -Dm644 engine/target/server.jar $out/share/cobol_ls/
  #       install -Dm644 dialect-daco/target/dialect-daco.jar $out/share/cobol_ls/
  #       install -Dm644 dialect-idms/target/dialect-idms.jar $out/share/cobol_ls/
  #
  #       makeWrapper ${pkgs.jre}/bin/java $out/bin/cobol_ls \
  #         --add-flags "-jar $out/share/cobol_ls/server.jar"
  #     '';
  #   };
  #
  #   filetypes = [ "cobol" ];
  #   cmd = [ "cobol_ls" "analysis" "-si" ];
  #   settings = {
  #     root_dir = [ "*.git" "*.cbl" ];
  #     single_file_support = true;
  #     hostname = "localhost:1044";
  #   };
  # };
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "cobol.vim";
      src = pkgs.fetchFromGitHub {
        owner = "Jorenar";
        repo = "COBOL.vim";
        rev = "47cb2460f3cb902a5e9d2b1a0fa36a3c075660af";
        hash = "sha256-nhB0F2G7sDNDwKcMDcgL7v3o5z2NJXIpNZqHGmA24oE=";
      };
    })
  ];
}
