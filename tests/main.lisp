(defpackage afp-mop-intro/tests/main
  (:use :cl
        :afp-mop-intro
        :rove))
(in-package :afp-mop-intro/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :afp-mop-intro)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
