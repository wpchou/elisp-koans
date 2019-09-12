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
;;   Adapted from google/lisp-koans:koans/vectors.lsp

;; Relevant emacs info page: `(info "(elisp)Vectors")'

(elisp-koans/deftest
 elisp-koans/vectors-types ()
 "`[x y z]' defines a vector literal containing x y z"
 (should (eq t (typep [1 11 111] 'vector)))
 (should (eq 11 (aref [1 11 111] 1))))


(elisp-koans/deftest
 elisp-koans/vectors-length ()
 "`length' works on vectors"
 (should (eq (length [1 2 3]) 3)))


(elisp-koans/deftest
 elisp-koans/vectors-bool ()
 "define a `bool-vector' literal with four elements, 0, 0, 1 and 1,
and expand it using `vconcat'"
 (should (equal [nil t t] (vconcat (bool-vector nil t t))))
 (should (eq ___ (typep #&4"	" 'bool-vector)))
 (should (eq ___ (aref #&4"	" 1))))


(elisp-koans/deftest
 elisp-koans/vectors-bool-operations ()
 "bool vectors can be compared using operations"
 (should (equal [t nil nil nil] (vconcat(bool-vector-intersection (bool-vector t t nil nil)
                                                      (bool-vector t nil t nil)))))
 (should (equal [t t t nil] (vconcat (bool-vector-union (bool-vector t t nil nil)
                                                (bool-vector t nil t nil)))))
 (should (equal [nil t t nil] (vconcat (bool-vector-exclusive-or (bool-vector t t nil nil)
                                                       (bool-vector t nil t nil))))))


(defun list-to-bool-vector (my-list)
  "Return a `bool-vector' created from the elements of MY-LIST."
  nil)

(elisp-koans/deftest
 elisp-koans/vectors-list-to-bool-vector ()
 "you must complete `list-to-bool-vector'"
 (should (bool-vector-p (list-to-bool-vector '(nil nil t t nil))))
 (should-not (aref (list-to-bool-vector '(nil))))
 (should (aref (list-to-bool-vector '(nil t)) 1))
 (should (equal 8 (length (list-to-bool-vector '(nil nil t t nil nil t t))))))

;;; vectors.el ends here
