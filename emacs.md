# Common issue with spacemacs/emacs
## I cannot start lsp mode for my python project
If you have all the packages installed. Open the python file and run command lsp
to import the project. If it says xxx.py not in project or it is blacklisted try
to delete the session file and restart emacs. For more details, see:
https://github.com/emacs-lsp/lsp-mode/issues/2392
# "LSP :: example_filename.c not in project or it is blacklisted."
https://emacs.stackexchange.com/questions/54414/how-to-debug-troubleshoot-lsp-not-in-project-or-it-is-blacklisted-in-lsp-mo
 `lsp-workspace-folders-add` solves it for me.
