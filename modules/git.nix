{ ... }:

{
      programs.git = {
            enable = true;
            userName = "miaoles";
            userEmail = "iao_mm@pm.me";
            extraConfig = {
                  init.defaultBranch = "main";
                  credential.helper = "cache";
            };
      };
}
