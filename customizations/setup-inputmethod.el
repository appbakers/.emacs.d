;; (set-fontset-font "fontset-default" '(#x1100 . #xffdc) '("Apple SD Gothic Neo" . "iso10646-1")) ; 한글과 영문 폰트 따로 설정

(set-language-environment 'Korean)

;;(global-set-key (kbd "<Hangul>") 'toggle-input-method)
;;(global-set-key (kbd "<S-Space>") 'toggle-input-method)
;;(global-set-key (kbd "<kana>") 'toggle-input-method)
;; better to set <S-Space> as global input method
;; and <Hangul> as emacs's embedded input method 




;;(defun xftp (&optional frame)
;; "Return t if FRAME support XFT font backend."
;; (let ((xft-supported))
;;  (mapc (lambda (x) (if (eq x 'xft) (setq xft-supported t)))
;;   (frame-parameter frame 'font-backend))
;;  xft-supported))

;;(when (xftp)
;; (let ((fontset "fontset-default"))
;;  ;; (set-default-font "Terminus 10")
;;  ;; (set-face-font 'default "Terminus 10")
;;  ;; (set-default-font "Terminus")
;;  ;; (set-face-font 'default "Terminus")
;;  ;; (set-fontset-font fontset 'latin
;;	  ;; '("NanumGothicCoding" . "unicode-bmp"))
;;  (set-fontset-font fontset 'hangul
;;   '("NanumGothicCoding" . "unicode-bmp"))
;;  (set-face-attribute 'default nil
;;   :font fontset
;;   :height 120)
;; ))

(defun xftp (&optional frame)
  "Return t if FRAME support XFT font backend."
  (let ((xft-supported))
    (mapc (lambda (x) (if (eq x 'xft) (setq xft-supported t)))
          (frame-parameter frame 'font-backend))
    xft-supported))

(when (xftp)
 (let ((fontset "fontset-default"))
  (set-fontset-font fontset 'latin
   '("DejaVu Sans Mono" . "unicode-bmp"))
  (set-fontset-font fontset 'hangul
   '("NanumGothic" . "unicode-bmp"))
  (set-face-attribute 'default nil
   :font fontset
   :height 110)))

(custom-set-variables
 '(current-language-environment "UTF-8")
 ;; '(default-input-method "korean-hangul390")  ;; 세벌식 390
 ;; '(default-input-method "korean-hangul3f")   ;; 세벌식 최종
 '(default-input-method "korean-hangul")     ;; 두벌식 
)

(prefer-coding-system 'utf-8)
;;(global-set-key (kbd "S-SPC") 'toggle-input-method)   ;; Debian GNU/Linux에서
;;(global-set-key (kbd "s-SPC") 'toggle-input-method)   ;; OS X에서 emacs(cocoa)용
;;(global-set-key (kbd "A-SPC") 'toggle-input-method)   ;; OS X에서 aquamacs용

(global-set-key (kbd "<Hangul>") 'toggle-input-method)  ;; <Hangul> key for only emacs;;; <S-SPC> is for global change
