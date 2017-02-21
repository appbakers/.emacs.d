;; (set-fontset-font "fontset-default" '(#x1100 . #xffdc) '("Apple SD Gothic Neo" . "iso10646-1")) ; 한글과 영문 폰트 따로 설정
(custom-set-variables
 '(current-language-environment "UTF-8")
 ;; '(default-input-method "korean-hangul390")  ;; 세벌식 390
 ;; '(default-input-method "korean-hangul3f")   ;; 세벌식 최종
 '(default-input-method "korean-hangul")     ;; 두벌식 
)

(global-set-key (kbd "S-SPC") 'toggle-input-method)   ;; Debian GNU/Linux에서
;;(global-set-key (kbd "s-SPC") 'toggle-input-method)   ;; OS X에서 emacs(cocoa)용
;;(global-set-key (kbd "A-SPC") 'toggle-input-method)   ;; OS X에서 aquamacs용
