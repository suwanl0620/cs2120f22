/-
CS2120 Fall 2022 Sullivan. Quiz #1. Edit your answers into
this file using VSCode. Save the file to your *local* hard 
drive (File > Save As > local > ...). Submit it to the Quiz1
assignment on Collab.
-/

/-
#1: For each of the following questions give a yes/no answer 
and then a very brief explanation why that answer is correct.
To explain why your answer is correct, name the specific rule
of inference that tells you it's correct, or explain that 
there is no such valid inference rule.
-/

/-
#1A

If a ball, b, is round *and* b is also red, is b red?

A: yes/no: yes

B: Why? According to elim right, if X and Y are true, 
it entails that Y is true, with Y being "red" in this case.


#1B

If flowers make you happy and chocolates make you happy,
and I give you flowers *or* I give you chocolates, will
you be happy?

A: yes/no: yes

B: Why? Using or elimination, if X -> Z and Y -> Z, 
it is sufficient to prove that if either X or Y is true, 
then Z is true. In this case, X is giving flowers and 
Y is giving chocolate, since X or Y is true, Z (being happy)
is true. 


#1C: If giraffes are just zebras in disguise, then the 
moon is made of green cheese?

A. yes/no: no
*yes

B. Why? There is no such rule that would relate these statements 
together. If written as an inference rule it would be X -> Y |- Z -> A
which is not proper logic. 
*Anything implied from a false proposition is true


#1D. If x = y implies that 0 = 1, then is it true that
x ≠ y?

A. yes/no: yes

B. Why? x = y implies a false statement, which would
entail that x = y is also false, allowing us to draw the 
conclusion that x ≠ y. 

*Not intro, proof by negation (If the proposition leads to 
a contradiction, then the proposition must be false)



#1E. If every zebra has stripes and Zoe is a Zebra then
Zoe has stripes.

A. yes/no: yes

B. Why? Using the transitivity of implies, it can be deduced that 
Zoe has stripes. Because if X(Zoe) implies Y(Zebra) and Y(Zebra)
implies Z(stripes), X(Zoe) implies Z(stripes).

#1F. If Z could be *any* Zebra and Z has stripes, then 
*every* Zebra has stripes.

A. Yes/no: yes
B: Why? Using all elim, if ∀ (z: Zebra), hasStripes z,
assuming z is any zebra, we can deduce that every zebra has stripes.
*all intro

#1G. If whenever the wind blows, the leaves move, and 
the leaves are moving, then the wind is blowing.

A. yes/no: No

B. Why? This would be the converse rule of X -> Y |- Y -> Z, with 
wind blowing being X and leaves moving Y. The converse rule is not always true
so this is a false statement.  


#1H: If Gina is nice *or* Gina is tall, and Gina is nice,
then Gina is not tall. (The "or" here is understood to be
the or of predicate logic.)

A. yes/no: No

B. Why? The "or" in predicate logic is not an exclusive "or", meaning that
it could be that both "Gina is nice" and "Gina is tall" is true and not just 
one or the other.
-/



/- 
#2

Consider the following formula/proposition in propositional
logic: X ∨ ¬Y.

#2A: Is is satisfiable? If so, give a model (a binding of 
the variables to values that makes the expressions true).
Yes. Dogs are nice OR dogs are not cute.

#2B: Is it valid? Explain your answer. 
No, it is not true in all cases, making it satisfiable but 
not valid. 

-/


/-
#3: 

Express the following propositions in predicate logic, by
filling in the blank after the #check command.

If P and Q are arbitrary (any) propositions, then if (P is 
true if and only if Q is true) then if P is true then Q is 
true.
-/

#check ∀ (P Q : Prop), (P ↔ Q) → (P → Q)



/-
#4 Translate the following expressions into English.
The #check commands are just Lean commands and can
be ignored here. 
-/


-- A
#check ∀ (n m : ℕ), n < m → m - n > 0

/-
Answer: For all natural numbers n and m, if n is less than 
m, it is implied that m minus n is greater than 0.
-/

-- B

#check ∃ (n : ℕ), ∀ (m : nat), m >= n

/-
Answer: For a set of natural numbers n, the natural number m is greater than or equal to n

-/


-- C

variables (isEven: ℕ → Prop) (isOdd: ℕ → Prop)
#check ∀ (n : ℕ), isEven n ∨ isOdd n

/-
Answer: For all natural numbers n, n is either even or odd. 
-/


-- D

#check ∀ (P : Prop), P ∨ ¬P

/-
Answer: For all propositions P, P is either true or not true. 
-/


-- E

#check ∀ (P : Prop), ¬(P ∧ ¬P)

/-
Answer: For all propositions P, P is either not true or true. 
-/


/-
#5 Extra Credit

Next we define contagion as a proof of a slightly long
proposition. Everything before the comma introduces new
terms, which are then used after the comma to state the
main content of the proposition. 

Using the names we've given to the variables to infer
real-world meanings, state what the logic means in plain
natural English. Please don't just give a verbatim reading
of the formal logic. 

If a1 and a2 are any animals, if a1 has a virus, and a1 and a2 have been in close contact, 
it implies that a2 has a virus. 
-/ 


variable contagion : 
  ∀ (Animal : Type) 
  (hasVirus : Animal → Prop) 
  (a1 a2 : Animal) 
  (hasVirus : Animal → Prop)
  (closeContact : Animal → Animal → Prop), 
  hasVirus a1 → closeContact a1 a2 → hasVirus a2


