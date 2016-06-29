#!/bin/bash

abs_dirname() {
    local cwd="$(pwd)"
    local path="$1"

    while [ -n "$path" ]; do
    cd "${path%/*}"
    local name="${path##*/}"
    path="$(readlink "$name" || true)"
    done

    pwd -P
    cd "$cwd"
}

# カレントディレクトリ取得
current_dir="$(abs_dirname "$0")"

# ログ
log_dir="${current_dir}/log"
log_file="${log_dir}/brewfile_update_`date +"%Y-%m-%d"`.log"
if [ -z ${log_dir} ]; then
  mkdir $log_dir
fi


echo `date` >> $log_file
brew file update >> $log_file 2>&1

echo -e "Complete brewfile update.\n" >> $log_file

