Coqc Quick Compilation Example
==============================

The directories in this repository contain examples of the various forms of Coq compilation. In each directory, it suffices to run `make` to see the commands and get execution time via the `time` command on Linux.

- default
  * standard Coq compilation
  * produces all .vo files (proof in `alternate.v` takes quite a long time to check)

- quick
  * quick Coq compilation
  * produces all .vio files (without checking any proofs)
  * produces `alternate_correct.vo` file from `alternate_correct.vio` (avoids producing `alternate.vo`)

- quick-check
  * quick Coq compilation
  * produces all .vio files (without checking any proofs)
  * only *checks* all proofs in `alternate_correct.vio`, does not produce any .vo files

- quick-check-task
  * quick Coq compilation
  * produces all .vio files (without checking any proofs)
  * only checks *two* (out of three) of the proofs in `alternate_correct.vio`, does not produce any .vo files

About Quick Compilation
-----------------------

* https://coq.inria.fr/refman/Reference-Manual031.html
* http://dx.doi.org/10.1007/978-3-319-22102-1_4
