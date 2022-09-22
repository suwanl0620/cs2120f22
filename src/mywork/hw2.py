# Suwan Lee 
# uty2zp@virginia.edu
from z3 import *

def hw2():
    X, Y, Z = Bools('X Y Z')
    s = Solver()
    
    # 1. X ∨ Y, X ⊢ ¬Y 
    # As proposition: ((X \/ Y) /\ X) -> ¬Y
    # If either X or Y is true and X is true, it must be that Y is false
    # I believe the rule is invalid
    C1 = (Implies(And(Or(X,Y), X),Not(Y)))
    s.add(Not(C1)) #check the negation is unsat
    r = s.check()

    if(r == unsat):
        print("C1 is valid")
    else:
        print("Here's a counter-example: ", s.model())
    s.reset()
    # There is no reason Y is not also true because of logical "or". 
    # "If I have the option to buy a coffee or donut and I bought a coffee, 
    # it doesn't mean I didn't also buy a donut" 

    # 2. X, Y ⊢ X ∧ Y
    # As proposition: (X /\ Y) -> (X /\ Y)
    # If X is true and Y is true, it must be that X and Y are true
    # I believe the rule is valid
    C2 = (Implies(And(X, Y), And(X, Y)))
    s.add(Not(C2))
    r = s.check()

    if(r == unsat):
        print("C2 is valid")
    else:
        print("Here's a counter-example: ", s.model())
    s.reset()

    # 3. X ∧ Y ⊢ X
    # As proposition: (X /\ Y) -> X
    # If X and Y are true, it must be that X is true
    # I believe the rule is valid
    C3 = (Implies(And(X, Y), X))
    s.add(Not(C3))
    r = s.check()

    if(r == unsat):
        print("C3 is valid")
    else:
        print("Here's a counter-example: ", s.model())
    s.reset()

    # 4. X ∧ Y ⊢ Y
    # As proposition: (X /\ Y) -> Y
    # If X and Y are true, it must be that Y is true
    # I believe the rule is valid
    C4 = (Implies(And(X, Y), Y))
    s.add(Not(C4))
    r = s.check()

    if(r == unsat):
        print("C4 is valid")
    else:
        print("Here's a counter-example: ", s.model())
    s.reset()

    # 5. ¬¬X ⊢ X 
    # As proposition: ¬¬X -> X
    # If not X is not true, it must be that X is true
    # I believe the rule is valid
    C5 = (Implies(Not(Not(X)), X))
    s.add(Not(C5))
    r = s.check()

    if(r == unsat):
        print("C5 is valid")
    else:
        print("Here's a counter-example: ", s.model())
    s.reset()

    # 6. ¬(X ∧ ¬X) 
    # As proposition: ¬(X /\ ¬X)
    # It is never the case that both X and not X are true
    # I believe the rule is valid
    C6 = (Not(And(X, Not(X))))
    s.add(Not(C6))
    r = s.check()

    if(r == unsat):
        print("C6 is valid")
    else:
        print("Here's a counter-example: ", s.model())
    s.reset()

    # 7. X ⊢ X ∨ Y
    # As proposition: X -> X \/ Y
    # If X is true, it must be that either X or Y is true
    # I believe the rule is valid
    C7 = (Implies(X, Or(X, Y)))
    s.add(Not(C7))
    r = s.check()

    if(r == unsat):
        print("C7 is valid")
    else:
        print("Here's a counter-example: ", s.model())
    s.reset()

    # 8. Y ⊢ X ∨ Y
    # As proposition: Y -> X \/ Y
    # If Y is true, it must be that either X or Y is true
    # I believe the rule is valid
    C8 = (Implies(Y, Or(X, Y)))
    s.add(Not(C8))
    r = s.check()

    if(r == unsat):
        print("C8 is valid")
    else: 
        print("Here's a counterexample: ", s.model())
    s.reset()

    # 9. X → Y, ¬X ⊢ ¬ Y
    # As proposition: 
    # If X implies Y and not X, it must be that not Y
    # I believe the rule is invalid
    C9 = (Implies(And(Implies(X, Y), Not(X)), Not(Y)))
    s.add(Not(C9))
    r = s.check()

    if(r == unsat):
        print("C9 is valid")
    else:
        print("Here's a counterexample: ", s.model())
    s.reset()
    # Inverse is not always true. "If I eat breakfast, then I will have the energy to study but
    # that does not mean if I don't eat breakfast, I won't have the energy to study"

    # 10. X → Y, Y → X ⊢ X ↔ Y
    # (X -> Y /\ Y -> X) -> (X <-> Y)
    # If X implies Y and Y implies X, it must be that X is true if and only if Y is true
    # I believe the rule is valid
    C10 = (Implies(And(Implies(X, Y), Implies(Y, X)), X==Y))
    s.add(Not(C10))
    r = s.check()

    if(r == unsat):
        print("C10 is valid")
    else:
        print("Here's a counterexample: ", s.model())
    s.reset()

    # 11. X ↔ Y ⊢ X → Y 
    # (X == Y) -> (X->Y)
    # If X is true if and only Y is true, it must be that X implies Y
    # I believe the rule is valid
    C11 = (Implies(X==Y, Implies(X, Y)))
    s.add(Not(C11))
    r = s.check()

    if(r == unsat):
        print("C11 is valid")
    else: 
        print("Here's a counter-example: ", s.model())
    s.reset()

    # 12. X ↔ Y ⊢ Y → X
    # (X == Y) -> (Y -> X)
    # If X is true if and only if Y is true, it must be that Y implies X
    # I believe the rule is valid
    C12 = (Implies(X==Y, Implies(Y, X)))
    s.add(Not(C12))
    r = s.check()

    if(r == unsat):
        print("C12 is valid")
    else:
        print("Here's a counter-example: ", s.model())
    s.reset()

    # 13. X ∨ Y, X → Z, Y → Z ⊢ Z
    # ((X \/ Y) /\ (X -> Z) /\ (Y -> Z)) -> Z
    # If X or Y are true and X implies Z and Y implies Z, it must be that Z is true
    # I believe the rule is valid
    C13 = (Implies(And(Or(X, Y), Implies(X, Z), Implies(Y, Z)),Z))
    s.add(Not(C13))
    r = s.check()

    if(r == unsat):
        print("C13 is valid")
    else: 
        print("Here's a counter-example: ", s.model())
    s.reset()

    # 14. X → Y, Y ⊢ X
    # ((X -> Y) /\ Y) -> X
    # If X implies Y and Y is true, it must be that X is true
    # I believe that this rule is invalid
    C14 = (Implies(And(Implies(X, Y), Y), X))
    s.add(Not(C14))
    r = s.check()

    if(r == unsat):
        print("C14 is valid")
    else:
        print("Here's a counter-example: ", s.model())
    s.reset()
    # Not a bi-implication. "If I am at the library, my friend is at the library, 
    # but when my friend is at the library, I am not always at the library"

    # 15. X → Y, X ⊢ Y
    # ((X -> Y) /\ X) -> Y
    # If X implies Y and X is true, then it must be that Y is true
    # I believe this rule is valid
    C15 = (Implies(And(Implies(X, Y), X), Y))
    s.add(Not(C15))
    r = s.check()

    if(r == unsat):
        print("C15 is valid")
    else: 
        print("Here's a counter-example: ", s.model())
    s.reset()

    # 16. X → Y, Y → Z ⊢ X → Z
    # ((X -> Y) /\ (Y -> Z)) -> (X -> Z)
    # If X implies Y and Y implies Z, it must be that X implies Z
    # I believe this rule is valid
    C16 = (Implies(And(Implies(X, Y), Implies(Y, Z)), Implies(X, Z)))
    s.add(Not(C16))
    r = s.check()

    if(r == unsat):
        print("C16 is valid")
    else:
        print("Here's a counter-example: ", s.model())
    s.reset()

    # 17. X → Y ⊢ Y → X
    # (X -> Y) -> (Y -> X)
    # If X implies Y, it must be that Y implies X
    # I believe this rule is invalid
    C17 = (Implies(Implies(X, Y), Implies(Y, X)))
    s.add(Not(C17))
    r = s.check()

    if(r == unsat):
        print("C17 is valid")
    else:
        print("Here's a counter-example: ", s.model())
    s.reset()
    # The converse is not always true. "All squares are rectangles but 
    # not all rectangles are squares"

    # 18. X → Y ⊢ ¬Y → ¬X
    # (X -> Y) -> (¬Y -> ¬X)
    # If X implies Y, it must be that not Y implies not X
    # I believe this rule is valid
    C18 = (Implies(Implies(X, Y), Implies(Not(Y), Not(X))))
    s.add(Not(C18))
    r = s.check()

    if(r == unsat):
        print("C18 is valid")
    else: 
        print("Here's a counter-example: ", s.model())
    s.reset()

    # 19. ¬(X ∨ Y) ↔ ¬X ∧ ¬Y
    # ¬(X \/ Y) <-> (¬X /\ ¬Y)
    # X or Y is false if and only if X is false and Y is false
    # I believe this rule is valid
    C19 = ((Not(Or(X, Y))) == (And(Not(X), Not(Y))))
    s.add(Not(C19))
    r = s.check()

    if(r == unsat):
        print("C19 is valid")
    else: 
        print("Here's a counter-example: ", s.model())
    s.reset()

    # 20. ¬(X ∧ Y) ↔ ¬X ∨ ¬Y
    # ¬(X /\ Y) <->  (¬X ∨ ¬Y)
    # X and Y are false if and only if X is false or Y is false
    # I believe this rule is valid
    C20 = ((Not(And(X, Y))) == (Or(Not(X), Not(Y))))
    s.add(Not(C20))
    r = s.check()

    if(r == unsat):
        print("C20 is valid")
    else: 
        print("Here's a counter-example: ", s.model())
    s.reset()


    
hw2()


