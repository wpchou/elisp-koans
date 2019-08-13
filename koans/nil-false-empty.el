;;   Copyright 2013 Google Inc.
;;
;;   Licensed under the Apache License, Version 2.0 (the "License");
;;   you may not use this file except in compliance with the License.
;;   You may obtain a copy of the License at
;;
;;       http://www.apache.org/licenses/LICENSE-2.0
;;
;;   Unless required by applicable law or agreed to in writing, software
;;   distributed under the License is distributed on an "AS IS" BASIS,
;;   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;;   See the License for the specific language governing permissions and
;;   limitations under the License.
;;
;;   Adapted from google/lisp-koans:koans/nil-false-empty.lsp

;; Relevant emacs info page: `(info "(elisp)nil and t")'

(defun elisp-koans/to-boolean (arg)
  "Return ARG as a boolean."
  (if arg t nil))

(elisp-koans/deftest
 elisp-koans/nil-false-empty-t-and-nil-are-opposites ()
 "`not' is a function which returns the boolean opposite of its argument"
 (should (eq t (not nil)))
 (should (eq nil (not t))))


(elisp-koans/deftest
 elisp-koans/nil-false-empty-nil-and-empty-list-are-the-same-thing ()
 "`nil' is the same thing as the empty list"
  (should (eq nil (and '())))
  (should (eq t (not ()))))


(elisp-koans/deftest
 elisp-koans/nil-false-empty-lots-of-things-are-true ()
 "every value, other than nil, is boolean true"
 (should (eq t (elisp-koans/to-boolean 5)))
 (should (eq t (elisp-koans/to-boolean "A String")))
 "only nil is nil.  Everything else is effectively true."
 "the empty string"
 (should (eq t (elisp-koans/to-boolean "")))
 "a list containing a nil"
 (should (eq t (elisp-koans/to-boolean '(nil))))
 "an vector with no elements"
 (should (eq t (elisp-koans/to-boolean (vector))))
 "the number zero"
 (should (eq t (elisp-koans/to-boolean 0))))


(elisp-koans/deftest
 elisp-koans/nil-false-empty-test-and ()
 "`and' can take multiple arguments"
   (should (eq t (and t t t t t)))
   (should (eq nil (and t t nil t t)))
   "if no nils, and returns the last value"
   (should (eq 5 (and t t t t t 5))))


(elisp-koans/deftest
 elisp-koans/nil-false-empty-test-or ()
 "`or' can also take multiple arguments"
 (should (eq t  (or nil nil nil t nil)))
 "`or' returns the first non nil value, or nil if there are none."
 (should (eq nil (or nil nil nil)))
 (should (eq 1 (or 1 2 3 4 5))))

;;; nil-false-empty.el ends here
