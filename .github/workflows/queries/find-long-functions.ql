/**
 * @description Find all functions longer than 10 lines
 * @kind problem
 * @id javascript/find-long-functions
 * @problem.severity recommendation
 */
import javascript

predicate isLongFunction(Function f) {
    getNumLines(f) > 10
}

from Function function
where isLongFunction(function)
select function, "these are long functions"
