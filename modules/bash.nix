{ ... }:

{
      programs.bash = {
            enable = true;
            enableVteIntegration = true;
            bashrcExtra = ''
                  [[ $- != *i* ]] && return

                  ### Paths ###
                  	PATH="$PATH:$HOME/Executables";

                  ### Prompt ###
                  	CURRENTHOUR="$(date +%H)";
                  	CURRENTMINUTE="$(date +%M)";
                  	CURRENTSECOND="$(date +%S)";
                  	CURRENTUSER="$(whoami)";
                  	CURRENTHOSTNAME="$(hostname)";
                  	BLACKFG="$(tput setaf 0)";
                  	REDFG="$(tput setaf 1)";
                  	GREENFG="$(tput setaf 2)";
                  	YELLOWFG="$(tput setaf 3)";
                  	BLUEFG="$(tput setaf 4)";
                  	MAGENTAFG="$(tput setaf 5)";
                  	CYANFG="$(tput setaf 6)";
                  	WHITEFG="$(tput setaf 7)";
                  	BLACKBG="$(tput setab 0)";
                  	REDBG="$(tput setab 1)";
                  	GREENBG="$(tput setab 2)";
                  	YELLOWBG="$(tput setab 3)";
                  	BLUEBG="$(tput setab 4)";
                  	MAGENTABG="$(tput setab 5)";
                  	CYANBG="$(tput setab 6)";
                  	WHITEBG="$(tput setab 7)";
                  	BOLD="$(tput bold)";
                  	REVERSE="$(tput rev)";
                  	RESET="$(tput sgr0)";
                  	PS1="\[$BLACKBG$BOLD\] $CURRENTUSER\[$RESET$BLACKBG$WHITEFG\] @\[$RESET$BLACKBG$BOLD\]$CURRENTHOSTNAME\[$RESET$BLACKBG\] \w \[$RESET\] ";

                  ### Functions ###
                        nix-where () {
                              echo "nix-store result:"
                              nix-store -r $(which $1)
                              echo "nix eval result:"
                              nix eval -f '<nixpkgs>' --raw $1
                              echo""
                        }

                        yt-dlp-flat-playlist () {
                              date=$(date +%F_%T)
                              yt-dlp -j --flat-playlist $1 | jq -r '.id' | sed 's_^_https://youtu.be/_' > playlist_$date.txt
                              echo playlist_$date.txt
                        }
            '';
            profileExtra = '' '';
            shellOptions = [
                  "histappend"
                  "extglob"
                  "globstar"
                  "checkwinsize"
                  "checkjobs"
            ];
            shellAliases = {
                  ls = "ls --color=auto";
                  steam = "steam -console";
                  priaoritize = "ionice -c 2 -n 0";
            };
      };
}
