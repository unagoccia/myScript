#!/bin/bash

# リクエスト生成
redmineURL="http://xxxxxxx/redmine"
apiKey="xxxxxxx"
projectId="xxxxxx"
requestURL="${redmineURL}/sys/fetch_changesets?key=${apiKey}&id=${projectId}"

# ログ
log_dir="xxxxxx/log"
log_file="${log_dir}/getRepInfoByRedmine_`date +"%Y-%m-%d"`.log"
if [ -z ${log_dir} ]; then
  mkdir $log_dir
fi

wget -O /dev/null ${requestURL} >> ${log_file} 2>&1
