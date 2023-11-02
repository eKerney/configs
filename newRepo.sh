#!/bin/bash
read -p "Enter the name of the project: " projectName
read -p "Enter github username" userName

echo "# $projectName" > README.md
git init
git add .
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/$userName/$projectName.git
git push -u origin main

