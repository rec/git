#!/bin/bash
set -eo pipefail

# A list of git global config settings to make life a little safer

### Aliases

# `git fix <commit-id>` means `git commit --fixup <commit-id>`
git config --global alias.fix 'git commit --fixup'

# `git list` lists the last 8 commits, one line each
# `git list -23` lists the last 23 commits, one line each
git config --global alias.list 'log --oneline -8'


### Merge, pull and rebase settings

# Only merge or pull if you can fast-forward and do so without conflicts
# https://blog.sffc.xyz/post/185195398930/why-you-should-use-git-pull-ff-only
git config --global merge.ff only
git config --global pull.ff only

# Only push if the upstream and local branch have the same name
# https://stackoverflow.com/a/21865319/43839
git config --global push.default simple

# Always squash fixup commits in a rebase
git config --global rebase.autosquash true

# Re-use old merge resolutions if you see them again
# https://stackoverflow.com/a/49501436/43839
git config --global rerere.enabled true

# Newer, nicer-looking indentation in diffs
git config --global diff.indentheuristic true


### Branch settings

# Automatically get rid of deleted remote branches
# https://stackoverflow.com/a/18718936/43839
git config --global fetch.prune true

# Use "main" as default branch for new projects
git config --global init.defaultbranch main


### Platform-specific settings

if [[ `uname -a` == Darwin* ]]; then  # MacOs/Darwin
    # Configure line endings
    #
    # https://docs.github.com/en/github/using-git/
    # configuring-git-to-handle-line-endings#global-settings-for-line-endings

    git config --global core.autocrlf input
fi
