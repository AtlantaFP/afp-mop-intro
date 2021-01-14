(defpackage afp-mop-intro
  (:use :cl)
  (:local-nicknames (:a :alexandria) (:s :serapeum)))
(in-package :afp-mop-intro)


#|
  The Common Lisp Meta Object Protocol

- A Description of CLOS that itself is an extensible CLOS program
- Meta Objects
  - fundamental elements of CLOS programs (class, slot definitions, etc)
  - are first-class citizens
  - behavior of CLOS is provided by these objects
- Meta Object Protocol
  - protocol followed by metaobjects to provide the behavior of CLOS
- Common Lisp Meta Objects
  - class, slot-definition, generic-function, method and method-combination
    - A _metaobject class_ is a subclass of EXACTLY one of the above classes

|#


#|
 class metaobjects
|#

(defclass point ()
  ((x :initarg :point-x :accessor point-x)
   (y :initarg :point-y :accessor point-y)))


(defclass loggable (c2mop:standard-class)
  )

(defun ensure-class (class-name &rest all-keys)
  (a:if-let ((class-def (find-class class-name nil)))
    (apply #'reinitialize-instance :name class-name all-keys)
    (let ((class-instance (apply #'make-instance 'standard-class :name class-name all-keys)))
      (setf (find-class class-name) class-instance))))

#|
Inheritance Example of what can not be modeled in CLOS.
|#
(defclass a () ())
(defclass b () ())
(defclass c (a b) ())
(defclass d (b a) ())
(defclass e (a b c d) ())

(defgeneric my-generic-function (a b))
