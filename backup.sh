#!/bin/bash

cp -r ~/bin .

ls -l /usr/local/bin | egrep -iv "Cellar|Applications"  > ./packages/usr_local_bin.txt
brew list -1 > ./packages/brew_list.txt
brew list --casks -1 > ./packages/brew-cask_list.txt
ls -1 /Applications > ./packages/system_apps_list.txt
pip3 list > ./packages/pip_list.txt

#Check git status
git_status="$(git status | grep -i "add\|modified\|new")"

if [[ $git_status != ""  ]]; then
  echo "changes in setup files"
  git add . ;
  git commit -m "New backup `date +'%Y-%m-%d %H:%M:%S'`";
  git push;
fi  

#TTest for auto backup