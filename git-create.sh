#!/bin/sh

repo_name=$1
test -z $repo_name && echo "Repo name required." 1>&2 && exit 1

curl -u '<your_user_name>' https://api.github.com/user/repos -d "{\"name\":\"$repo_name\"}"


git init
git remote add origin "https://github.com/your_github_username/$repo_name.git"
