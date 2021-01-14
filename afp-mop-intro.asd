(defsystem "afp-mop-intro"
  :version "0.1.0"
  :author ""
  :license ""
  :depends-on ("alexandria"
               "serapeum"
               "closer-mop")
  :components ((:module "src"
                :components
                ((:file "generic-functions-and-methods"))))
  :description ""
  :in-order-to ((test-op (test-op "afp-mop-intro/tests"))))

(defsystem "afp-mop-intro/tests"
  :author ""
  :license ""
  :depends-on ("afp-mop-intro"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for afp-mop-intro"
  :perform (test-op (op c) (symbol-call :rove :run c)))
