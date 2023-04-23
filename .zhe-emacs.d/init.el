;;; init.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2023 Zhe Li
;;
;; Author: Zhe Li <linuxcity.jn@gmail.com>
;; Maintainer: Zhe Li <linuxcity.jn@gmail.com>
;; Created: April 23, 2023
;; Modified: April 23, 2023
;; Version: 0.0.1
;; Keywords: abbrev bib c calendar comm convenience data docs emulations extensions faces files frames games hardware help hypermedia i18n internal languages lisp local maint mail matching mouse multimedia news outlines processes terminals tex tools unix vc wp
;; Homepage: https://github.com/zzz/init
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:



(package-initialize)
(require 'package)
(setq package-enable-at-startup nil)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
;;; init.el ends here
