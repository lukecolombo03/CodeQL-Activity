/**
 * @description Find all tests that call pressActionKey()
 * @kind problem
 * @id javascript/find-long-functions
 * @problem.severity recommendation
 */
import javascript

/**
 * Holds if a function is a test.
 */
predicate isTest(Function test) {
    exists(CallExpr describe, CallExpr it |
        describe.getCalleeName() = "describe" and
        it.getCalleeName() = "it" and
        it.getParent*() = describe and
        test = it.getArgument(1)
    )
}

/**
* Holds if `caller` contains a call to `pressActionKey`.
*/
predicate callsPressActionKey(Function caller) {
    exists(DataFlow::CallNode call |
      call.getEnclosingFunction() = caller and
      call.getACallee() = "pressActionKey"
    )
  }



from Function test, Function callee
where isTest(test) and 
        callsPressActionKey(callee)
select test, "tests pressActionKey"