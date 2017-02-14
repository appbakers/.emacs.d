;; https://vxlabs.com/2014/05/25/emacs-24-with-prelude-org2blog-and-wordpress/

;; defaults to be "~/org"
;; (setq org-directory "~/sync/notes/org/")

(setq org-list-allow-alphabetical t)

(require 'org2blog-autoloads)

(require 'netrc)

(require 'auth-source)

(setq wp-irt (netrc-machine (netrc-parse "~/.netrc") "wp-irt" t))

(netrc-get wp-irt "login")

(let (credentials)
  (add-to-list 'auth-sources "~/.netrc")
  (setq credentials (auth-source-user-and-password "wp-irt"))
  (setq org2blog/wp-blog-alist
        `(("wp-irt"
           :url "http://nas.irt.co.kr/wordpress/xmlrpc.php"
           :username ,(car credentials) 
           :password ,(cadr credentials)
           :default-title "Hello World"
           :default-categories ("org2blog" "emacs")
           :tags-as-categories nil))))

(setq org2blog/wp-use-sourcecode-shortcode 't)
(setq org2blog/wp-sourcecode-default-params nil)
(setq org2blog/wp-sourcecode-langs
      '("actionscript3" "bash" "coldfusion" "cpp" "csharp" "css" "delphi"
        "erlang" "fsharp" "diff" "groovy" "javascript" "java" "javafx" "matlab"
        "objc" "perl" "php" "text" "powershell" "python" "ruby" "scala" "sql"
        "vb" "xml"
        "sh" "emacs-lisp" "lisp" "lua"))

(setq org-src-fontify-natively t)
