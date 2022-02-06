;;; uwu-theme.el --- based on UwU colorscheme by Mangeshrex -*- lexical-binding: t; no-byte-compile: t; -*-
;Author: SamuelNhBos

;;; Code:

(require 'doom-themes)


;;
;;; Variables

(defgroup uwu-theme nil
  "Options for the `doom-one' theme."
  :group 'doom-themes)

(defcustom uwu-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'uwu-theme
  :type 'boolean)

(defcustom uwu-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'uwu-theme
  :type 'boolean)

(defcustom uwu-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'uwu-theme
  :type '(choice integer boolean))


;;
;;; Theme definition

(def-doom-theme uwu
  "A beautiful and dark vim colorscheme ported to doom emacs."

  ;; name        default   256           16
  ((bg         '("#131a1c" "#131a1c"      nil  )) ;
   (fg         '("#c5c8c9" "#c5c8c9"    "brightwhite"  )) ;

   ;; These are off-color variants of bg/fg, used primarily for `solaire-mode',
   ;; but can also be useful as a basis for subtle highlights (e.g. for hl-line
   ;; or region), especially when paired with the `doom-darken', `doom-lighten',
   ;; and `doom-blend' helper functions.
   (bg-alt     '("#131a1c" "#131a1c"     nil        )) ;
   (fg-alt     '("#c5c8c9" "#c5c8c9"    "white"        )) ;

   ;; These should represent a spectrum from bg to fg, where base0 is a starker
   ;; bg and base8 is a starker fg. For example, if bg is light grey and fg is
   ;; dark grey, base0 should be white and base8 should be black.
   (base0      '("#131a1c" "#131a1c"     "black"        )) ;
   (base1      '("#1b2224" "#1b2224"     "brightblack"  )) ;
   (base2      '("#1b2224" "#1b2224"     "brightblack"  )) ;
   (base3      '("#232a2c" "#232a2c"     "brightblack"  )) ;
   (base4      '("#2f3638" "#2f3638"     "brightblack"  )) ;
   (base5      '("#2f3638" "#2f3638"     "brightblack"  )) ;
   (base6      '("#232a2c" "#232a2c"     "brightblack"  )) ;
   (base7      '("#232a2c" "#232a2c"     "brightblack"  )) ;
   (base8      '("#c4c4c4" "#c4c4c4"     "white"        )) ;

   (grey       base4)
   (red        '("#f65b5b" "#f65b5b" "red"          ))
   (orange     '("#e59e67" "#e59e67" "brightred"    ))
   (green      '("#6bb05d" "#6bb05d" "green"        ))
   (teal       '("#8dc776" "#8dc776" "brightgreen"  ))
   (yellow     '("#e59e67" "#e59e67" "yellow"       ))
   (blue       '("#6cbad1" "#6cbad1" "brightblue"   ))
   (dark-blue  '("#53a7bf" "#53a7bf" "blue"         ))
   (magenta    '("#bb8fe5" "#bb8fe5" "brightmagenta"))
   (violet     '("#b185db" "#b185db" "magenta"      ))
   (cyan       '("#6db0ad" "#6db0ad" "brightcyan"   ))
   (dark-cyan  '("#51a39f" "#51a39f" "cyan"         ))

   ;; These are the "universal syntax classes" that doom-themes establishes.
   ;; These *must* be included in every doom themes, or your theme will throw an
   ;; error, as they are used in the base theme defined in doom-themes-base.
   (highlight      blue)
   (vertical-bar   (doom-darken base1 0.1))
   (selection      dark-blue)
   (builtin        magenta)
   (comments       (if uwu-brighter-comments dark-cyan base5))
   (doc-comments   (doom-lighten (if uwu-brighter-comments dark-cyan base5) 0.25))
   (constants      violet)
;;   (functions      magenta)
   (functions      orange)
   (keywords       blue)
   (methods        cyan)
   (operators      blue)
   (type           yellow)
   (strings        green)
;;   (variables      (doom-lighten magenta 0.4))
   (variables      dark-blue)
   (numbers        orange)
   (region         `(,(doom-lighten (car bg-alt) 0.15) ,@(doom-lighten (cdr base1) 0.35)))
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; These are extra color variables used only in this theme; i.e. they aren't
   ;; mandatory for derived themes.
   (modeline-fg              fg)
   (modeline-fg-alt          base5)
   (modeline-bg              (if uwu-brighter-modeline
                                 (doom-darken blue 0.45)
                               (doom-darken bg-alt 0.1)))
   (modeline-bg-alt          (if uwu-brighter-modeline
                                 (doom-darken blue 0.475)
                               `(,(doom-darken (car bg-alt) 0.15) ,@(cdr bg))))
   (modeline-bg-inactive     `(,(car bg-alt) ,@(cdr base1)))
   (modeline-bg-inactive-alt `(,(doom-darken (car bg-alt) 0.1) ,@(cdr bg)))

   (-modeline-pad
    (when uwu-padded-modeline
      (if (integerp uwu-padded-modeline) uwu-padded-modeline 4))))


  ;;;; Base theme face overrides
  (((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground fg)
   ((font-lock-comment-face &override)
    :background (if uwu-brighter-comments (doom-lighten bg 0.05)))
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis :foreground (if uwu-brighter-modeline base8 highlight))

   ;;;; css-mode <built-in> / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)
   ;;;; doom-modeline
   (doom-modeline-bar :background (if uwu-brighter-modeline modeline-bg highlight))
   (doom-modeline-buffer-file :inherit 'mode-line-buffer-id :weight 'bold)
   (doom-modeline-buffer-path :inherit 'mode-line-emphasis :weight 'bold)
   (doom-modeline-buffer-project-root :foreground green :weight 'bold)
   ;;;; elscreen
   (elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")
   ;;;; ivy
   (ivy-current-match :background dark-blue :distant-foreground base0 :weight 'normal)
   ;;;; LaTeX-mode
   (font-latex-math-face :foreground green)
   ;;;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   ((markdown-code-face &override) :background (doom-lighten base3 0.05))
   ;;;; rjsx-mode
   (rjsx-tag :foreground red)
   (rjsx-attr :foreground orange)
   ;;;; solaire-mode
   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-alt)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-alt))))

  ;;;; Base theme variable overrides-
  ())

;;; doom-one-theme.el ends here
