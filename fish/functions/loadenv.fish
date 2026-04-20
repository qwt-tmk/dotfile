function loadenv --description "Load KEY=VALUE lines from an env file into fish as exported variables"
  argparse 'h/help' -- $argv
  or return
  if set -q _flag_help
    echo "Usage: loadenv [/path/to/.env]"
    echo "Loads simple KEY=VALUE lines (comments and blank lines ignored)."
    echo "Reads from stdin if no file is given and input is piped."
    return 0
  end
  set -l file $argv[1]
  set -l use_stdin 0
  if test -z "$file"
    if not isatty stdin
      set use_stdin 1
    else
      set file ".env"
    end
  end
  if test $use_stdin -eq 0
    # ~ 展開
    set file (string replace -r '^\~' $HOME -- $file)
    if not test -f "$file"
      return 0
    end
  end

  function __loadenv_parse
    while read -l line
      if string match -qr '^\s*(#|$)' -- $line
        continue
      end
      if not string match -qr '^\s*[A-Za-z_][A-Za-z0-9_]*\s*=' -- $line
        continue
      end
      set -l kv (string split -m1 '=' -- $line)
      set -l key (string trim -- $kv[1])
      set -l val (string trim -- $kv[2])
      if not string match -qr '^["'\'']' -- $val
        set val (string replace -r '\s+#.*$' '' -- $val)
      end
      set val (string replace -r '^"(.*)"$' '$1' -- $val)
      set val (string replace -r "^'(.*)'\$" '$1' -- $val)
      set -gx $key $val
    end
  end

  if test $use_stdin -eq 1
    __loadenv_parse
  else
    __loadenv_parse < "$file"
  end
  functions -e __loadenv_parse
end
