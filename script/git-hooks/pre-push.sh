echo 'Start pre-push check'

remote=$1 # origin
url=$2 # git@github.com:leviwu777/test-0106.git

###extract host:
host=${url#*@}
host=${host%%:*}

###extract org:
org=${url#*:}
org=${org%%/*}

###extract project
project=${url#*/}
project=${project%%.*}

current_branch_name=$(git rev-parse --abbrev-ref HEAD)
base_pull_request_url="https://github.com/${org}/${project}/compare/${current_branch_name}"


echo "快速建立 Pull Request："
echo "    - Feature   : $base_pull_request_url?quick_pull=1&template=template_feature&labels=Feature"
echo "    - Bugfix    : $base_pull_request_url?quick_pull=1&template=template_bugfix&labels=Bugfix,Chore"
echo "    - Experiment: $base_pull_request_url?quick_pull=1&template=template_experiment&labels=Experiment"
