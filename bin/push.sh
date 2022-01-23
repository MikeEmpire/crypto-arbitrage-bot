#!/bin/sh
git add .
git add -u
read -r -p 'Commit message: ' desc  # prompt user for commit message
branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
read -p "Do you wish to run git commit hooks? (y/n)? " answer
case ${answer:0:1} in
    y|Y )
        git commit -m "$desc"
    ;;
    * )
        git commit -m "$desc" -n 
    ;;
esac
git push origin $branch

