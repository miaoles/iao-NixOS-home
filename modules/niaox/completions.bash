_niaox() {
      local cur prev opts cmds
      COMPREPLY=()
      cur="${COMP_WORDS[COMP_CWORD]}"
      prev="${COMP_WORDS[COMP_CWORD-1]}"
      cmds="update upgrade discard"
      opts="user os both"

      case "${prev}" in
      niaox)
            COMPREPLY=( $(compgen -W "${cmds}" -- ${cur}) )
            return 0
            ;;
      update|upgrade|discard)
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
      esac
}

complete -F _niaox niaox