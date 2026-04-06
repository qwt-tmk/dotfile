function loadenv --description "Load KEY=VALUE lines from an env file into fish as exported variables"
  argparse 'h/help' -- $argv
  or return
  if set -q _flag_help
    echo "Usage: loadenv [/path/to/.env]"
    echo "Loads simple KEY=VALUE lines (comments and blank lines ignored)."
    return 0
  end
  set -l file $argv[1]
  if test -z "$file"
    set file ".env"
  end
  # ~ 展開
  set file (string replace -r '^\~' $HOME -- $file)
  if not test -f "$file"
    return 0
  end
  # ファイルを1行ずつ処理
  while read -l line
    # 空行/コメントをスキップ
    if string match -qr '^\s*(#|$)' -- $line
      continue
    end
    # KEY=VALUE でない行は無視
    if not string match -qr '^\s*[A-Za-z_][A-Za-z0-9_]*\s*=' -- $line
      continue
    end
    # splitは最初の=だけ
    set -l kv (string split -m1 '=' -- $line)
    set -l key (string trim -- $kv[1])
    set -l val (string trim -- $kv[2])
    # 末尾コメント "FOO=bar # baz" を雑に落とす（クオートなしの場合のみ）
    if not string match -qr '^["'\'']' -- $val
      set val (string replace -r '\s+#.*$' '' -- $val)
    end
    # 両端のクオートを外す（単純ケース）
    set val (string replace -r '^"(.*)"$' '$1' -- $val)
    set val (string replace -r "^'(.*)'\$" '$1' -- $val)
    # export
    set -gx $key $val
  end < "$file"
end
