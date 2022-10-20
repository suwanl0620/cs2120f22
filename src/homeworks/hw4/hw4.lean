/-
CS 2120 F22 Homework #4. Due Oct 13.
-/

/- #1A [10 points]

Write a formal proposition stating that 
logical and (∧) is associative. That is, 
for arbitrary propositions, P, Q, and R,
P ∧ (Q ∧ R) is true *iff* (P ∧ Q) ∧ R is, 
too. Replace the placeholder (_) with your
answer.
-/

def and_associative : Prop := 
  ∀ (P Q R : Prop), P ∧ (Q ∧ R) ↔ (P ∧ Q) ∧ R



/- #1B [10 points]

Give an English language proof. Identify
the inference rules of predicate logic
that you use in your reasoning.
-/

/-
Answer: 
 Assume P, Q, and R are arbitrary but specific 
 propositions and that we have a proof of P and 
 a proof of Q and R. From this proof we can derive 
 a proof of Q and a proof of R separately using and elim and 
 combine the proof of P and the proof of Q to get a
 proof of P and Q using and intro and combine the 
 proof of P and Q with the proof of R using and intro 
 again to get a proof of (P ∧ Q) ∧ R
-/

/- #1C [5 points]

Give a formal proof of the proposition.
Hint: unfold and_associative to start.
-/

theorem and_assoc_true : and_associative :=
begin
  unfold and_associative,

  assume P Q R,

  apply iff.intro,
  assume pqr,
  cases pqr with p qr,
  cases qr with q r,
  let pq := and.intro p q,
  exact and.intro pq r,

  assume pqr,
  cases pqr with pq r,
  cases pq with p q,
  exact and.intro p and.intro q r
end



/- #2A [10 points]

Write the proposition that ∨ is associative.,
analogous to the proposition about ∧ in #1.
-/

def or_associative : Prop := 
  ∀ (P Q R : Prop), P ∨ (Q ∨ R) ↔ (P ∨ Q) ∨ R


/- #2B [10 points]

Write an English language proof of it, citing
the specific inference rules you use in your
reasoning.

Assume P, Q, and R are arbitrary but specific 
propositions and that we have a proof that P 
implies (P ∨ Q) ∨ R or (Q ∨ R) implies (P ∨ Q) ∨ R.
The bi implication makes it so that (P ∨ Q) implies 
P ∨ (Q ∨ R) or R implies P ∨ (Q ∨ R). By or elim, we 
can derive a proof of Q and use or intro to derive a
proof of P ∨ (Q ∨ R). 
-/


/- #2C [5 points]

Complete the following formal proof.
-/

theorem or_associative_true : or_associative :=
begin

  unfold or_associative,
  assume P Q R,
  apply iff.intro,

  assume pqr,
  cases pqr with p q_or_r,
  exact or.intro_left R (or.intro_left Q p),

  cases q_or_r with q r,
  let pq := (or.intro_right P q),
  exact or.intro_left R pq,

  exact or.intro_right (P ∨ Q) r,

  assume pqr,
  cases pqr with p_or_q r,
  cases p_or_q with p q,
  exact or.intro_left (Q ∨ R) p,

  let qr := or.intro_left R q,
  exact or.intro_right P qr,

  let qr := or.intro_right Q r,
  exact or.intro_right P qr,

end


/- #3A [10 points]
Write a formal statement of the proposition.
-/

def arrow_transitive : Prop :=
  ∀ (X Y Z : Prop), (X → Y) ∧ (Y → Z) → (X → Z)


/- #3B [10 points]

Write an English language proof of the proposition
that for any propositions, X, Y, and X, it's the
case that (X → Y) → (Y → Z) → (X → Z). In other
words, implication is "transitive." Hint: Recall
that if you have a proof of, say, X → Y, and you 
have a proof of X, you can derive a proof of Y by
arrow elimination. Think of it as applying a proof
of an implication to a proof of its premise to get
yourself a proof of its conclusion.
-/

/- 
Assume X, Y, and Z are arbitrary and specific propositions
and that we have a proof of X implies Y and Y implies Z.
By applying arrow elim on X implies Y, I can derive a proof 
of Y and by applying arrow elim on Y implies Z, I can derive
a proof of Z. Assuming X and having a proof of Z, we can 
construct a proof of X implies Z. 
-/


/- #3C [5 points]. 
Write a formal proof of it.
-/
theorem arrow_transitive_true : arrow_transitive :=
begin

  assume X Y Z,
  assume xy yz,
  assume x,

  exact yz (xy x)

end


/- #4
Suppose that if it's raining then the streets
are wet. This problem requires you to prove that
if the streets are not wet then it's not raining.
-/

/- #4A [10 points]

Start by writing the proposition in predicate
logic by completing the following answer.
-/

def contrapositive : Prop :=
  ∀ (Raining Wet : Prop), 
    (Raining → Wet) → (¬Wet → ¬Raining)


/- #4B [10 points]. 
-/

theorem contrapositive_valid : contrapositive :=
begin 
  unfold contrapositive,
  assume Raining Wet, 
  assume rw,
  assume not_wet,
  assume raining, 
  exact not_wet (rw raining),
end 
/- #4C [5 points]. 

Give an English language proof of it.
Assume that there is proof that if it's raining, 
the streets are wet. By applying contrapositive,
 we can derive a proof that when the streets are 
 not wet, it is not raining. 
-/


/- #5. Extra credit.

Complete the following formal proof of the 
proposition that if for any proposition P, 
P ∨ ¬P is true, then for any propositions, 
X and Y, if it's not the case that X or Y
is true then it is the case that ¬X and ¬Y 
is true. 
-/

theorem demorgan1 : 
  (∀ (P : Prop), P ∨ ¬ P) → 
    ∀ (X Y : Prop), 
      ¬(X ∨ Y) → (¬X ∧ ¬Y) :=
begin

assume em X Y nxory,
cases (em X) with x nx,
let xory := or.intro_left Y x,
contradiction,
apply and.intro nx, 
assume y,
let xory := or.intro_right X y,
contradiction,

end

/-
A comment on or.intro_left and or.intro_right.
In Lean each of these takes two arguments: a
proof of the disjunct -- the proposition on 
one side of the ∨ -- that is to be proven true, 
*and* it takes as an argument the proposition 
that is not being proven true. In applications 
of these rules the proposition argument (not 
being proven) comes first, while the proof 
argument comes second.

The reason is that Lean needs to know what 
overall proposition is being proved. From the
proof argument it can infer the proposition 
being proved, but it needs the other proposition
as well to know the full (X ∨ Y) disjunction to
be proved. 

Here's an example:
-/

example : 0 = 0 ∨ 0 = 1 :=
begin
apply or.intro_left (0 = 1) rfl
/-
The "rfl" serves as a proof of 0=0.
But in addition, as the first argument
to or.intro, we need to provide the
*proposition* that is not being proved.
Here's that's (0 = 1). In contexts
where Lean can infer both disuncts,
you can use the simpler or.inl or 
or.inr, each of which just takes one
argument: a proof of the left or of 
the right side, respectively.
-/
end

