# Shortcus.sh

Speed up your development process, or just make it easier to traverse your computer using these helpful shortcuts.

Meant to be used with Mac OS X or other bash CLIs.

|Status|
|------|
|0.5.0 |

## Overview

**Shortcuts.sh** adds high-level commands to open various programs or start various tasks via a bash CLI client.

## Installation

Check the [project dependecies][1] and look through the source files to make sure that you have full access to all the commands; note, some commands have default variables you can change.

Clone this repo to a `.bash` directory in your root directory:

```bash
$ mkdir ~/.bash # if you don't already have a .bash directory here
$ cd ~/.bash
$ git clone git@github.com:fullstax/shortcuts-sh
```

---
#### Note: Read before continuing
Once you include the preceeding export/source lines in your `~/.bash*` file(s), some commands with the same name may override or be overridden by the **Shortcuts.sh** file, depending on the hierarchy of that file. 

If you notice you overrode a command, simply comment out/remove the export/source lines, or rename one of the instances of the conflicted command to something else.
---

Edit your `~/.bash_profile`, `~/.bashrc`, or `~/.profile` and add the following code to the top:

```bash
export SHORTCUTS_SH=~/.bash/shortcuts-sh
source "${SHORTCUTS_SH}/index.sh"
```
Once you restart your Terminal/Bash shell or open up a new window/tab, you'll be able to use the new commands!

## Commands

Check [the wiki][2] for 

|script|description|
|------|-----------|
|`$ `|...|


## Updating

Before you update, you can check the current version of your clone of **shortcuts.sh** by entering the following in your shell:

```bash
$ shortcuts v # short version
$ shortcuts version # long version
```

Updating is simple; just navigate to the `.bash` directory that you installed the project to, and pull:

```bash
$ cd ~/.bash/shortcuts-sh
$ git pull
```

## License

[The MIT License](https://github.com/fullstax/shortcuts.sh/blob/master/LICENSE)

[1]: https://github.com/fullstax/shortcuts-sh/wiki/dependencies  "shortcuts.sh dependencies"
[2]: https://github.com/fullstax/shortcuts-sh/wiki "shortcuts.sh wiki"