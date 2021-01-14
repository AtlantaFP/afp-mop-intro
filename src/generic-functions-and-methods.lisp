(defpackage :afp.mop.intro.gf-and-methods
  (:use :cl))

(in-package :afp.mop.intro.gf-and-methods)

(defclass counting-gf (c2mop:standard-generic-function)
  ((counter :initform 0 :accessor call-count)))

#|

compute-applicable-methods-using-classes
method-more-specific-p
apply-methods

|#

(defgeneric apply-generic-function (gf args))

(defmethod apply-generic-function ((gf c2mop:standard-generic-function) args)
  (let ((applicable-methods (c2mop:compute-applicable-methods-using-classes
                             gf (mapcar #'class-of args))))
    (if (null applicable-methods)
        (error "No matching method for the ~@ generic function ~S, ~@ when called with arguments ~:S. " gf args)
        (apply-methods gf args applicable-methods))))

(defmethod apply-generic-function :before ((gf counting-gf) args)
  (incf (call-count gf)))

(defgeneric method-more-specific-p (gf method1 method2 required-classes))


