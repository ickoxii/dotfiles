;;important;;
;;;;;;;;;;  SAMPLE .emacs file ;;;;;;;;;

(setq inhibit-local-variables t)
(setq-default visible-bell t)
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

(line-number-mode 1) ; line number is displayed in mode line.
(display-time) ; time displayed in mode line
(setq-default case-fold-search nil); Makes search & replaces case sensitive


; Check for X-windows
(if (equal window-system 'x)
  (progn
(setq-default transient-mark-mode t)

; Alternate key-bindings:
(global-set-key [f1] 'find-file) 	
(global-set-key [f2] 'kill-buffer)
(global-set-key [f3] 'goto-line)
(global-set-key [f4] 'save-buffer)		      

;; The next part sets up colour coding for TeX files etc.
;; You may need to change colours for maximum contrast.
;; To change, use syntax: ... (font-...face "colour")
;; If don't want this feature at all, then delete to "End Colours"

; Begin Colours
(setq font-lock-face-attributes
             '((font-lock-comment-face "Orange")
		       (font-lock-string-face "Red")
		       (font-lock-keyword-face "Blue")
		       (font-lock-function-name-face "Purple")
		       (font-lock-variable-name-face "Goldenrod")
		       (font-lock-type-face "Green")
		       (font-lock-reference-face "Brown")))

(global-font-lock-mode t) ; auto. colourization on
(setq font-lock-support-mode 'fast-lock-mode) ; caching on
; End Colours

))

;;;;;;;;;; END ;;;;;;;;;;;;;;;
