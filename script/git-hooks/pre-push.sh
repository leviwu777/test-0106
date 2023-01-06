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

github_id="$(git config user.github-statementdog)"

parent_branch=$(git log --pretty=format:'%D' HEAD^ | grep 'origin/' | head -n1 | sed 's@origin/@@' | sed 's@,.*@@')
current_branch=$(git rev-parse --abbrev-ref HEAD)
pr_base_url="https://github.com/${org}/${project}/compare/${parent_branch}...${current_branch}"
pr_base_options="quick_pull=1&assignees=${github_id}"

echo "\r\n快速建立 Pull Request："
echo "[ Bugfix ]: $pr_base_url?$pr_base_options&template=template_bugfix.md&labels=Bugfix"
echo "[ Feature ]: $pr_base_url?$pr_base_options&template=template_feature.md&labels=Feature"
echo "[ Crawler ]: $pr_base_url?$pr_base_options&template=template_crawler.md&labels=Feature"
echo "[ Experiment ]: $pr_base_url?$pr_base_options&template=template_experiment.md&labels=Experiment"
echo "\r\n"
