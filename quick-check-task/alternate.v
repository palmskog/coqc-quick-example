Require Import List.
Import ListNotations.

Fixpoint alternate (l1 l2 : list nat) : list nat :=
match l1, l2 with
| [], _ => l2
| l1', [] => l1'
| h1 :: t1, h2 :: t2 => h1 :: h2 :: alternate t1 t2
end.

Inductive alternation : list nat -> list nat -> list nat -> Prop :=
| alternation_nil : forall (l : list nat), alternation [] l l
| alternation_step : forall (a : nat) (l t1 t2 : list nat), 
    alternation l t1 t2 -> alternation (a :: t1) l (a :: t2).

Lemma alternation_nil_nil :
  forall (l l' : list nat), alternation [] l l' -> l = l'.
Proof.
intros.
do 100 (match goal with H0: alternation _ _ _ |- _  => inversion H end); subst; auto with datatypes; try congruence.
Qed.
