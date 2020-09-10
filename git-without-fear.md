# Git without fear

Git is eventually fun and easy but a little scary before that, because you
rightfully worry about losing data.

Here are a few simple rules that will make your life more serene.

1. Once you have created a commit in your repo, it's almost impossible to lose
   it if you never type `git gc`

Here's the panic point - you just commited a week's worth of code and then you
did something complicated and now you don't see the code you just wrote.

Relax!  Even if you can't see that code in any of your branches, it is not
gone.  In fact, you probably have commits you discarded weeks or even months ago
floating around in your repository.

You can think of the Git repo as a database that maps commit IDs to states of
your project.  A branch just a name for a commit ID.

Now, when you lose the last reference to some commit ID like the project you
need to hand in in a few hours and has now vanished, literally nothing happens
at all.

The commit ID and its files stay on disk indefinitely.  There's a garbage
collector but it keeps everything created in the last 30 days..

So how do you get to those commits?  Through the reflog!

(For quite a while, I thought it was re-flog - "Arrr, re-flog the crew until
morale improves!". Disappointingly, it's actually "ref-log" - the log of all the
references to commit IDs.)

If you have gone through all your branches and the code isn't there, the next
logical step is the reflog.

`git reflog -20` shows the last 20 commit IDs visited.  You'll see some
duplicates, that's natural

`git reflog --all` shows everything.  There it is (almost certainly)!

(But if you type `git gc` your reflog is erased. Code is tiny.  Time is
precious. Never `git gc` unless you really need to.  `git reflog` has
options that fry the reflog - beware those also.)

Your commit is in the reflog, so you can relax.  How to get it back?  Wait a bit
and I'll show you.  But first:

2. If you don't ever commit your code, it can simply vanish like the morning dew

Now, git is quite careful here.  In normal operation, it's fairly hard to
overwrite your uncommitted changes.  But emergencies and mistakes happen.

You can avoid this in two easy ways: lots of tiny commits, and liberal use of
`git stash`.

3. Use `git stash` as your trash

Never, ever delete new files or revert changes to files in your project, even if
you are sure you won't need them, unless the changes are gigabyte huge, or have
secrets.

Don't trash it, stash it! Go to the root of the project and type:

    git add . && git stash

If you ever need this change again, go to a clean branch and type `git stash
pop`.

You can stash as much as you like, and they are arranged in a stack with the
most recent stash on top, so `git stash` is a trash stash stack.

There's a lot more - see `git stash --help`.

4. Lots of tiny commits.

Committing is like voting - you should do it early and often.




1.



### Commit ids, garbage collection, the stash and the reflog


I'm going to jump ahead to two intermediate topics, `git stash` and `git
reflog`, because they can offer you great peace of mind and allow you to
experiment with other commands.
