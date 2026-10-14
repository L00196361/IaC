# Git Command Cheatsheet

## Setup
| Command | Description |
| ----------- | ----------- |
| git config --global user.name "Ada" | Set your commit name |
| git config --global user.email you@x.com | Set your commit email |
| git config --global core.editor "code --wait" | Set your default editor|
| git config --list | Show all current config|

## Intializing
| Command | Description |
| ----------- | ----------- |
| git init | Create a new repo in the current folder |
| git clone <url>	 | 	Copy a remote repo locally |


## Staging & committing
| Command | Description |
| ----------- | ----------- |
| git add file.txt | Stage one file |
| git add .	 | 	Stage all changes in the current dir|
| git commit -m "message" |Commit staged changes with a message|
| git rm file.txt	 | Remove a file and stage the deletion|

