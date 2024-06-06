{ user, ... }:

{
      programs.git = {
            enable = true;
            userName = "miaoles";
            userEmail = user.email;
            extraConfig = {
                  init.defaultBranch = "main";
                  credential.helper = "cache";
            };
      };
}
