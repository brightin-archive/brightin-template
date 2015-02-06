# Brightin style guide

## Git hooks

Git hooks are simple scripts run at certain events in a Git repository. They
reside in `.git/hooks` in your project root directory. The `pre-commit` hook can
be useful to ensure a clean commit.

### Installation

Create a new file `.git/hooks/pre-commit` and make it executable (`chmod +x
.git/hooks/pre-commit`). Put any scripts in there that need to be run before a
commit is recorded and exit with a non-zero status when the commit should be
aborted.

### Examples

See `pre-commit` for examples to reject commits that:

* would include files indented with tabs instead of spaces;
* would include Ruby debug statements (`binding.pry`)
* would include Git conflict markers (`<<<<<<<` and `>>>>>>>`)
* would include trailing whitespace

### Committing the hooks

Normally, Git hooks are local to a repository. They are not committed and
thefore not shared between developers. You could easily put your scripts in a
project directory such as `./hooks` and symlink them from there into your
`.git/hooks` directory.

If you do go this route, remember that everyone will need to create those
symlinks in order to use the hooks. A project setup script (such as
`./bin/setup`) would be a nice way to do so. Such a script might include some
lines like this:

    echo 'Setting up git hooks...'
    for hook in hooks/*
    do
      ln -sf ../../$hook .git/hooks/$(basename $hook)
    done
