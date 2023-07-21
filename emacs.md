# Doom Emacs
## Installation
```
git clone https://github.com/hlissner/doom-emacs ~/.doom-emacs.d
 ~/.doom-emacs.d/bin/doom install
```
## Fix issue with cannot find python packages
```
# Use python-version that matches the system version
pyenv global {python-version}
doom sync
```

## Upgrade package
```
 ~/.doom-emacs.d/bin/doom sync
```


# Common issue with spacemacs/emacs
## I cannot start lsp mode for my python project
If you have all the packages installed. Open the python file and run command lsp
to import the project. If it says xxx.py not in project or it is blacklisted try
to delete the session file and restart emacs. For more details, see:
https://github.com/emacs-lsp/lsp-mode/issues/2392

## "LSP :: example_filename.c not in project or it is blacklisted."
https://emacs.stackexchange.com/questions/54414/how-to-debug-troubleshoot-lsp-not-in-project-or-it-is-blacklisted-in-lsp-mo
 `lsp-workspace-folders-add` solves it for me.

## Install metals (deprecated)
```
# Make sure to use coursier v1.1.0-M9 or newer.
curl -L -o coursier https://git.io/coursier-cli
chmod +x coursier
./coursier bootstrap \
  --java-opt -Xss4m \
  --java-opt -Xms100m \
  --java-opt -Dmetals.client=emacs \
  org.scalameta:metals_2.12:0.10.9 \
  -r bintray:scalacenter/releases \
  -r sonatype:snapshots \
  -o /usr/local/bin/metals-emacs -f
```

## org-mode doesn't work and `Invalid function: org-assert-version`
```
rm -v ~/.spacemacs-emacs.d/elpa/28.2/develop/org*/*.elc
```
and restart

## emacs hangs
Use this to recover:
```
pkill -SIGUSR2 emacs
```

Don't forget to `toggle-debug-on-quit` afterwards.
https://emacs.stackexchange.com/questions/21643/what-do-i-do-when-emacs-is-frozen
