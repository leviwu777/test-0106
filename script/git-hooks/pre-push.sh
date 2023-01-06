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

github_id="$(git config user.github-statementdog)"

function parent_branch() {
  local git_parent_branch
  git_parent_branch=$(git log --pretty=format:'%D' HEAD^ | grep 'origin/' | head -n1 | sed 's@origin/@@' | sed 's@,.*@@')
  if [[ -z "$git_parent_branch" ]]; then
    echo "master"
  else
    echo "$git_parent_branch"
  fi
}
current_branch=$(git rev-parse --abbrev-ref HEAD)
pr_base_url="https://github.com/${org}/${project}/compare/$(parent_branch)...${current_branch}"
pr_base_options="quick_pull=1&assignees=${github_id}"

echo "\r"
echo "\033[0;33m快速建立 Pull Request：\033[0m"
echo "\033[41;37m[ Bugfix ]\033[0m: $pr_base_url?$pr_base_options&template=template_bugfix.md&labels=Bugfix"
echo "\033[42;37m[ Feature ]\033[0m: $pr_base_url?$pr_base_options&template=template_feature.md&labels=Feature"
echo "\033[42;37m[ Crawler ]\033[0m: $pr_base_url?$pr_base_options&template=template_crawler.md&labels=Feature"
echo "\033[43;37m[ Experiment ]\033[0m: $pr_base_url?$pr_base_options&template=template_experiment.md&labels=Experiment"
echo "\r"
