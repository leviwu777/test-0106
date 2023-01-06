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

echo "$git_parent_branch"

echo "$author_email"
echo "快速建立 Pull Request："
echo "[ Bugfix ]: $pr_base_url?$pr_base_options&template=template_bugfix.md&labels=Bugfix,Chore\r\n"
echo "[ Crawler ]: $pr_base_url?$pr_base_options&template=template_crawler.md&labels=Bugfix,Chore\r\n"
echo "[ Feature ]: $pr_base_url?$pr_base_options&template=template_feature.md&labels=Feature\r\n"
echo "[ Experiment ]: $pr_base_url?$pr_base_options&template=template_experiment.md&labels=Experiment\r\n"
