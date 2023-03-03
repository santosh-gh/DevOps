  # Three States in GIT
    - Modified
    - Staged
    - Commited  
  
# GIT Configuaration
  
    Git has 3 levels of configurations
    - Repository/Project Level (Local)
    - User Account (Global Level)  
    - System Level (Git Installation)
    
    - Show GIT config locations
      git config --list --show-origin

    - Remove a specific settings for a specific level of config
      git config --global --unset user.name
    
    - Remove the specific section
      git config --global --remove-section user

 # Commands
    git status
    git log
    git diff (between working area and staging area)
    git diff --staged (between staging area and repository area)
    git diff head (between working area and repository area)

    rename a branch
    git checkout feature_branch
    git branch -m new_branch

    delete branch

    git branch -d new_branch
    git branch -D new_branch

    git merge feature/some_feature

    abort the merge
    git merge abort 


    git rebase

    git rebase -i master

# Git Rebase
  - used an alternative to merging
  - Rebasing a branch updates one branch with another by applying the commits of one branch on top of the commints of another branch
  - used to clean up the local commit history
  - rebase does not preserve history where merge preserve history

# Don't use rebase when
  - Do not use rebase when the branch is public and shared to all the developers

# Use rebase when
  - Cleaning up your commint before sharing your code 
  - Pulling changes from another branch without merge.

# Branches
    Create New Branch
    Create a new git branch and switch to it

    git checkout -b <branch name>
    and create it on origin too

    git push --set-upstream origin/<branch name> <branch name>

# Tracking Remote Branches
    To follow additional branches in your local repo follow these steps:

    # Find out all existing remote branches
    git branch -r

    # And track one of them locally
    git branch --track <local name> origin/<name>

# Remove Branch
    Remove git branch locally with
    git branch -d 

    Remove branch on origin
    git push origin --delete <branch>

    or
    
    git branch -d -r origin/<branch>
    git push origin :

# Rename Local Branch
    git branch -m <new name>
    Remove stale
    When remote branches disappear clean them from your local repo with

    git remote prune origin

# Rebasing
    To rebase on master

    git rebase master 

# Solve Merge Conflicts
    When a rebase fails manually fix files and

    git add <files>
    git rebase --continue

# Move commits onto new branch
    git branch 
    git reset --hard HEAD~1      # 1 to move 1 commit
    git checkout 

# Squash Commits
    git rebase -i <commit after which to rebase>

# Commits
    Amending changes
    git add 
    git commit --amend
    Apply patches
    A detailed description can be found here. You should always run the following commands:

    git apply --stat cool_feature.patch    # Check what the patch will do
    git apply --check cool_feature.patch   # Check if the patch fails
    git am --signoff < cool_feature.patch
    Create patches
    git format-patch -1     # Creates one patch file for the commit
    git format-patch -2 HEAD           # Creates two patch files for last two commits on HEAD
    git format-patch -3 HEAD --stdout  # Print last 3 commit changes on stdout
    Solving Mistakes
    Accidental “git add”

    git reset HEAD []
    Accidental commit of too many files

    git reset --soft HEAD^

    git status         # to list all added files
    git reset <files>  # to remove incorrectly added files

    # Commit afterwards
    Stashing Changes
    For a detailed explanation check here. This feature is useful to put debugging or experimental changes to the “background”. Here are the commands:

    git stash "Some test I made"    # Stash some changes away

    git stash list                  # List stashes
    git stash show stash@{0}        # Show changes file in last stash
    git stash show -p stash@{0}     # Show patch for last stash

    git stash apply stash@{0}       # Get last stash active again
    git stash drop stash@{0}        # Delete last stash

    git stash pop                   # Apply and remove last stash

    git stash clear                 # Delete all stashes

    # Stash just some files by adding all others first 
    # and using --keep-index
    git add <files>
    git stash --keep-index
    List Commits in One Line Each
    git rev-list --all --pretty=oneline
    Search in Commits
    To search all commits for lines containing a certain change:

    git log -p -S -- 
    git log -p -G -- 
    Disecting
    git disect start <recent commit> <older commit>

    git disect good
    git disect bad

    git disect reset

# Tags
    git fetch --all --tags --prune

    git checkout tag/<tag> -b <branch>
    git clone <repo> --branch=<tag>

    git tag                    # List all tags
    git tag <tag>              # Create tag
    git tag -a <tag> -m <msg>  # Create annotated tag
    git push --tags            # Push tags to remote

    git tag -d <tag>         # Deletes tag in your local repo
    git push origin :<tag>   # Deletes tag remote

# Origins
    git remote -v                  # List
    git remote add <origin> <url>  # Add new origin
    git remote rm <origin>         # Remove

    # Get a branch track a specific origin
    git branch --set-upstream-to=<origin>/<branch> <branch>

    # Remove remote branch
    git push origin --delete <branch>

# Security
    Enable git password Caching
    To keep passwords for 1h run

    git config --global credential.helper 'cache --timeout=3600'
    Allow insecure certificates
    One time only

    git clone <url> --config http.sslVerify=false
    Permanently for a give URL

    git config https.<remote url>/.sslVerify false
    Configuring specific proxy
    Disable proxy for a given URL

    git config https.<remote url>/.proxy ""

# Misc
    Update submodules
    git submodule update --init --recursive
    Remove all repo files from a directory
    If you ever need to remove all git related files from a local working repo and make it just a normal directory:

    git clean -ffrx
    List Branch in Bash Prompt PS1
    There are several documentations online e.g. this one. In the end it boils down to running “git branch” on each prompt and to use an environment function __git_ps1() that is set up by “git branch” to print the branch if there is one. So if your current $PS1 is

    export PS1='\u@\h:\w\$ "
    you could extend it to

    export PS1='\u@\h:\w$(git branch &>/dev/null; echo $(__git_ps1 "(%s)"))\$ '
    to show the branch name in braces after the directory name and before the $ like this:

    john@server:~/project/src(master)$ 
    Push Dry Run
    git push --dry-run --porcelain
    git-write-tree: error building trees
    git reset --mixed
    Merge two repos
    One simple way to merge two repos is to add one repo (repo1) into a subdirectory of another repository (repo2)

    cd repo2
    git remote add repo1 <path to repo1>
    git fetch repo1
    git merge -s ours --no-commit repo1/master
    # Ignore the merge error!

    git read-tree --prefix=<subdir> -u repo1/master
    git commit
    That’s it. Check “git log” to see if changes of repo1 appear.

    Comfort merging with opening PRs in a browser
    This can be done via git command aliases invoking xdg-open. An example solution

    [alias]
    curbranch = rev-parse --symbolic-full-name --abbrev-ref HEAD
    bpush = !sh -c 'git push origin $(git curbranch) 2>&1 |grep -o "https://.*" |xargs xdg-open'
    bp = !sh -c 'echo "Pull" && git pull origin master && echo "Push" && git bpush'
    with now “git bp” pulling, pushing and opening the PR for further review work.

    Checkout at a specific time
    git checkout 'master@{2019-01-01 01:00:00}'
    <?slideshare,cWwH3B15RuuGW6,Git Tips and Tricks?>

    cherrypick changes in a specific commit from branch ‘A’ to branch ‘B’
    git checkout B
    git cherry-pick <commit hash from branch A>

    know what changed on a specific commit
    git show <commit hash>

    Resync git repo
    git fetch origin && git reset --hard origin/master && git clean -f -d

    Resync forked repo
    git remote add upstream https://github.com/lwindolf/lzone-cheat-sheets.git
    git fetch upstream
    git checkout master
    git merge upstream/master

    Ignore invalid certificates
    git -c http.sslVerify=false <command> 

# GIT Branching Strategy
There are a few popular git branching strategies at the moment

- GitFlow (Feature Based Development)

- Trunk Based Development

- Github Flow

GitFlow (Feature Based Development)
GitFlow involves creating multiple levels of branching off of master where changes to feature branches are only periodically merged all the way back to master to trigger a release.
Main branches
The central repo holds two main branches with an infinite lifetime
master — contains production-ready code
develop — is continuous integration branch

Supporting branches
In addition to the master and develop, GitFlow uses a variety of supporting branches with a limited lifetime, they get removed eventually.
Feature branches — These branches help parallel development between team members, ease the tracking of features. Should branch off from develop, must merge back into develop.
Release branches — Release branches support the preparation of a new production release. Use release branches to work on a particular release (multiple features). May branch off from develop, must merge back into develop and master.
Hotfix branches — Hotfix branches are very much like release branches, these are created to fix live unplanned production issues. Maybe branched off from the corresponding tag on the master branch that marks the production version, must merge back into develop and master.

# Branches

1. Master - This branch contains production code. All development code is merged into master in sometime.

2. Develop - This branch contains pre-production code. When the features are finished then they are merged into develop.

3. Feature / Bug Fixes / Issues - Feature branches are used to develop new features for the upcoming releases. May branch off from develop and must merge into develop.

4. Release - release branches support preparation of a new production release. They allow many minor bug to be fixed and preparation of meta-data for a release. May branch off 
   from develop and must merge into master anddevelop.

5. Hotfix - hotfix branches are necessary to act immediately upon an undesired status of master. May branch off from master and must merge into master and develop.

# Git flow Workflow
But how are we going to manage each branch and what should be the real flow? Wouldn’t there be conflicts in branches with the modification in some other branches? Ok!! So let’s understand why we are using these all branches and what will be the impact of each branch.

- Master branch is the most stable branch of all and will be used for production deployment.

- Develop branch is created from master branch and will contain the latest features and bugfixes.

- Multiple Feature branches and bugfix branches can be created from develop branch for feature development.

- Release branch is created from develop branch with all the features which are planned for next release.

- Hotfix branch will be created from the master branch.

# Creating and Merging Branches
Let us assume we already had a Master and Develop branch.

1. To start working on a new feature, we will create a new feature branch feature/f1 out of Develop.
2. Also a small feature started in parallel, we call that branch feature/f2.

3. feature/f2 task is completed and it will be merged to develop and at the same time it has to be merged to feature/f1.

4. It’s decided to put feature/f2 in the next release which is planned in the next few weeks.

5. At this point we will create a release branch from develop with a version tag. We call this branch release/v0.1.0. And this release branch will be sent for testing.

6. During testing we got some issues again and created some other bugfix1 and bugfix2 branches out of release. Once bugfix1 and bugfix2 are merged to release, make sure to merge
   back to develop and feature/f1.

7. Once we are sure with the testing, this branch is now much more stable and we are ready to merge it to the master branch. And again send the Master branch for testing.

8. During testing we again faced an issue, and this time we have to create a hotfix branch out of master, we call this branch hotfix/hf1.

9. Once the hotfix branch is merged to master, it will be merged back to develop and feature/f1 branch.

10. Cheer’s, we have the most stable branch “The Master Branch”, and we are ready to deploy this to production.

One of the most important things to be noted is that TESTING plays a major role in getting the most stable branches, so make sure to get it tested enough before you say Master as the most STABLE branch.

Trunk Based development
In the trunk-based development model developers regularly merge their code changes into a central repository usually master branch. Usually, create short-lived feature branches. Once code on their branch compiles and passes all tests, they merge it straight to master. When teams are able to regularly merge small changes they minimize the complexity of the merge and thereby the effort.

Github Flow
GitHub flow is a lightweight, branch-based workflow that supports teams and projects where deployments are made regularly. Anything in the master branch is always deployable. The below guide explains how GitHub flow works.

# Github Flow guidelines:
    Create a branch
    - A branch is created off of master when working on a feature or a fix. Your branch name should be descriptive
      Add commits

    - Start making changes. Whenever you add, edit, or delete a file, add relevant commit messages for other people to follow along and provide feedback
      Open a Pull Request
      
    - Initiate a discussion about your commits through pull Request. Pull Requests help start code review and conversation about proposed changes before they’re merged into 
      the master branch
    
    Discuss and review your code
    - Pull Request leads to a discussion with the reviewer, through comments, questions. Helps to improve project standards, coding quality.
      Deploy

    - Once your pull request has been reviewed and the branch passes your tests, you can deploy your changes to verify them in production. If your branch causes issues, you
      can roll it back by deploying the existing master into production.
