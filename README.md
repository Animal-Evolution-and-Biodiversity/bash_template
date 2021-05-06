# Bash Template

Most command-line applications share a common set of features which would be
tedious to remember or type out every time you wish to create a new script.
Here I collected what are, in my opinion, some best practices for writing new
Bash scripts.

## Download the Template

Go to the directory where you want to write your new script from and simply
copy the template into your directory using _one_ of the commands below.

1. Using `wget`:

```bash
wget https://raw.githubusercontent.com/Animal-Evolution-and-Biodiversity/bash_template/main/template.bash -O template.bash
```

2. Using `curl`:

```bash
curl https://raw.githubusercontent.com/Animal-Evolution-and-Biodiversity/bash_template/main/template.bash -o template.bash
```

You can change `template.bash` into the name of your own script if you would
like.

## Guidelines

All program should support two standard options: `--help` and `--version`.
It is also a good idea to provide single-letter alternatives for these: `-h`
and `-v`.  Any output files should prefarably be set using the `-o` or
`--output` options. If the output is a directory, then it is generally good
practice to call it `--output-dir`. Any program should stop reading
command-line options when two dashes `--` is specified.

### Filetype Extension

Executable (runnable) files can omit the filetype extensions altogether.
Libraries or non-executable scripts should use `.sh` or `.bash`. I prefer
`.bash` over `.sh` since `.sh` may also be used for shell scripts executed by
`/bin/sh`.

### Shebang Line

All Bash scripts, or any script really, should start with a _shebang_ line.
For Bash, there are two commonly accepted variants:

```bash
#!/usr/bin/env bash
```

or

```bash
#!/bin/bash
```

The first one will choose the first `bash` in the user's path, while the
second one will use the interpreter located in `/bin/bash`. The `bash`
located in `/bin/bash` is usually a little older, but it shouldn't matter for
non-interactive shells.

All scripts should have a brief explanation of what they do in the first few
comment lines like so:

```bash
#!/usr/bin/env bash
#
# A minimal Bash template.
```

### Shell Options

These four lines sets a bunch of options which are meant to protect against
common problems which may occur:

```bash
set -o errtrace
set -o errexit
set -o nounset
set -o pipefail
```

Below I try to give a brief explanation of every one of these.

* `errtrace` — inherit signals trapping from functions
* `errexit` — exit if any command exits with a non-zero exit status
* `nounset` — exit if an unitialised variabled is used
* `pipefail` — the script inherits a non-zero exit status from a command within
  a pipe (`|`)

See Bash's man page for more details.

### Debugging Options

This line adds line numbers and function names to the debugger, when the
script is invoked using `bash -x bash_template.bash`.

```bash
export PS4='+ ${LINENO}:${FUNCNAME[0]:-}() '
```

© Animal Evolution and Biodiversity 2021
