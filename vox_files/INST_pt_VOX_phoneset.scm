;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                                                                     ;;;
;;;                     Carnegie Mellon University ;;; and Alan W 
;;;                  Black and Kevin Lenzo ;;;
;;;                      Copyright (c) 1998-2000                        ;;;
;;;                        All Rights Reserved.                         ;;;
;;;                                                                     ;;;
;;; Permission is hereby granted, free of charge, to use and distribute ;;;
;;; this software and its documentation without restriction, including  ;;;
;;; without limitation the rights to use, copy, modify, merge, publish, ;;;
;;; distribute, sublicense, and/or sell copies of this work, and to     ;;;
;;; permit persons to whom this work is furnished to do so, subject to  ;;;
;;; the following conditions:                                           ;;;
;;;  1. The code must retain the above copyright notice, this list of   ;;;
;;;     conditions and the following disclaimer.                        ;;;
;;;  2. Any modifications must be clearly marked as such.               ;;;
;;;  3. Original authors' names are not deleted.                        ;;;
;;;  4. The authors' names are not used to endorse or promote products  ;;;
;;;     derived from this software without specific prior written       ;;;
;;;     permission.                                                     ;;;
;;;                                                                     ;;;
;;; CARNEGIE MELLON UNIVERSITY AND THE CONTRIBUTORS TO THIS WORK        ;;;
;;; DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING     ;;;
;;; ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT  ;;;
;;; SHALL CARNEGIE MELLON UNIVERSITY NOR THE CONTRIBUTORS BE LIABLE     ;;;
;;; FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES   ;;;
;;; WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN  ;;;
;;; AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION,         ;;;
;;; ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF      ;;;
;;; THIS SOFTWARE.                                                      ;;;
;;;                                                                     ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Phonset for INST_pt
;;;

;;;  Feeel free to add new feature values, or new features to this
;;;  list to make it more appropriate to your ptuage

;; This is where it'll fall over if you haven't defined a 
;; a phoneset yet, if you have, delete this, if you haven't
;; define one then delete this error message
;(error "You have not yet defined a phoneset for pt (and others things ?)\n            Define it in festvox/INST_pt_VOX_phoneset.scm\n")

(defPhoneSet
  INST_pt
  ( ;;;  Phone Features
  (vc + - 0) 
  (clst + - 0) ;;Usar ambos 0 para semivogal
 
   ;; vowel length: short long dipthong schwa (Comprimento de vogal: Curta, Longa, Ditongo, Schwa)
   ;; O som de Schwa não há na língua portuguesa brasileira
   (vlng s l d a - 0)
    
    ;; vowel height: high mid low (Altura de Vogal: Alta, Média, baixa)
   (vheight 1 2 3 0 -)
  
   ;; vowel frontness: front mid back
   (vfront 1 2 3 0 -)
   ;; lip rounding
   (vrnd + - 0)
   ;; consonant type: stop fricative affricative nasal liquid approximant
   (ctype s f a n l r 0)
   ;; place of articulation: labial alveolar palatal
   ;; labio-dental dental velar glottal
   (cplace l a p b d v g 0)
   ;; consonant voicing
   (cvox + - 0)
  ; (asp  + - 0)
 ;  (nuk + - 0)
   )

  (

   (pau - - 0 0 0 0 0 0 0)
   ;;Vogais Orais
    (a + - - 3 2 - 0 0 0)
    (o + - - 2 3 + 0 0 0)
    (O + - - 2 3 + 0 0 0)
    (u + - - 1 3 + 0 0 0)
    (e + - - 2 1 - 0 0 0)
    (E + - - 2 1 - 0 0 0)
    (i + - - 1 1 - 0 0 0)
    
    ;; Vogais nasais
    (a~ + - - 3 2 - 0 0 0)
    (e~ + - - 2 1 - 0 0 0)
    (i~ + - - 1 1 - 0 0 0)
    (o~ + - - 2 3 + 0 0 0)
    (u~ + - - 1 3 + 0 0 0)
    
    ;; Semivogais
    (w 0 0 - - 0 0 0 0 0)
    (j 0 0 - - 0 0 0 0 0)
    (w~ 0 0 - - 0 0 0 0 0)
    (j~ 0 0 - - 0 0 0 0 0)
  
                   ;;Consoantes
   
   (p - + 0 - - - s 0 -)
   (R - + 0 - - - l 0 +)
   (b - + 0 - - - s 0 +)
   (t - + 0 - - - s 0 -)
   (d - + 0 - - - s 0 +)
   (k - + 0 - - - s v -)
   (f - + 0 - - - f b -)
   (v - + 0 - - - f b +)
   (s - + 0 - - - f p -)
   (z - + 0 - - - f a +)
   (S - + 0 - - - f p -)
   (Z - + 0 - - - f p +)
   (m - + 0 - - - n 0 +)
   (n - + 0 - - - n 0 +)
   (J - + 0 - - - n p +) ;; Exemplo: Banho > b a~ j o (J > nh)
   (l - + 0 - - - l a +)
   (L - + 0 - - - l p +) ;; Exemplo: Trabalho > t r a b a L u (L > lh)
   (r - + 0 - - - l a +)
   (X - + 0 - - - 0 v +)
   (tS - + 0 - - - a 0 -)
   (g - + 0 - - - s v +)
   (dZ - + 0 - - - a 0 +)
   ;; insert the phones here, see examples in 
   ;; festival/lib/*_phones.scm

 )
)
(PhoneSet.silences '(pau))

(define (INST_pt_VOX::select_phoneset)
  "(INST_pt_VOX::select_phoneset)
Set up phone set for INST_pt."
  (Parameter.set 'PhoneSet 'INST_pt)
  (PhoneSet.select 'INST_pt)
)

(define (INST_pt_VOX::reset_phoneset)
  "(INST_pt_VOX::reset_phoneset)
Reset phone set for INST_pt."
  t
)

(provide 'INST_pt_VOX_phoneset)
