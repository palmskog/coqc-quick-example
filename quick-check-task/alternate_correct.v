Require Import List.
Require Import alternate.

Import ListNotations.

Lemma alternate_alternation : 
  forall (l1 l2 l3 : list nat), alternate l1 l2 = l3 -> alternation l1 l2 l3.
Proof.
intro l1.
induction l1.
- intros.
  simpl in H.
  rewrite H.
  apply alternation_nil.
- intros.
  destruct l2.
  * simpl in H.
    rewrite <- H.
    apply alternation_step.
    apply alternation_nil.
  * simpl in H.
    rewrite <- H.
    apply alternation_step.
    apply alternation_step.
    apply IHl1.
    reflexivity.
Qed.

Lemma alternation_alternate : 
  forall (l1 l2 l3 : list nat), alternation l1 l2 l3 -> alternate l1 l2 = l3.
Proof.
induction l1.
- intros.
  inversion H; subst.
  simpl.
  reflexivity.
- intros.
  destruct l2.
  * simpl.
    inversion H; subst.
    inversion H4; subst.
    reflexivity.
  * simpl.
    inversion H; subst.
    inversion H4; subst.
    apply IHl1 in H5.
    rewrite H5.
    reflexivity.
Qed.

Lemma alternate_correct : 
   forall (l1 l2 l3 : list nat), alternate l1 l2 = l3 <-> alternation l1 l2 l3.
Proof.
intros.
split.
- apply alternate_alternation.
- apply alternation_alternate.
Qed.
