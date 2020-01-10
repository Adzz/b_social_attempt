# The Problem

There is a group of five friends, Ola, Sam, Kelly, Tommen and Sandy, who are all on the B-Social app.
B-Social has selected them to try out the new limited edition B-Social card for their group "Badgers in London". To celebrate this they have been socialising a lot. Last week, they went for lunch together at Homeslice and yesterday they went to see Black Panther at Genesis, in Whitechapel.
Tommen happens to be low on cash and has taken it upon himself to calculate who owes who what. Our awesome app would normally help him with this, but now we'd like to ask you to help Tommen with solving the problem​.


### Context
Here at B-Social we are all about making money as social as our lives. From going on holidays with your friends, to splitting your household expenses, and everything in-between. Sometimes though, discussing money with your friends can get a little awkward.
That’s why we created B-Social: to make sure that money doesn’t come between friends. ​B-Social is our app, which allows people to share and settle expenses with each other​.

### Guidelines
- The following exercise contains some example input and expected outputs, however the solution should be extendable to similar inputs and outputs.
- You can solve the problem in the language of your choice, although we might not be familiar with it, so be prepared to explain it!
- Please submit the solution as an email attachment (.zip)
- What we will look for:
- good breakdown of the domain that is flexible enough to be extended
- technically simple solution, avoid database integration, docker etc, we care more
about how you model the domain
- automated testing (e.g. unit testing)
- clear instructions on how to run the solution and tests
- a brief explanation of your design and assumptions
- We want our hiring practices to be fair. To ensure this, please do not publically share the problem or solution.


Here is the example input (you do not need to parse the text in this format, feel free to convert it to JSON input, REST calls, command line inputs or whatever else you prefer):
```
Title: Lunch
Spend:
      Kelly: 5.50
      Sam: 10
      Ola: 15
      Tommen: 10
      Sandy: 5
Total: 45.5
Payer: Tommen
Title: Movie
Spend:
      Kelly: 10
      Sam: 10
      Ola: 10
      Tommen: 10
      Sandy: 10
Total: 50
Payer: Kelly
```

### Using the above information, please make your solution is able to answer the following:

total_debts
total_receivables
x_owe_y
simplify? / bookkeep

1. In total, how much is Tommen owed by everyone else?
2. How much does Ola owe Sam?
3. How much does Tommen owe Kelly?
<!-- I think this problem might be NP hard at the most general level... -->
4. How can the group settle outstanding balances with the minimum number of payments?

### Answers

Here is the expected output (the output does not need to be represented as text strings, it just needs to clearly communicate the answers):
1. Tommen is owed £25.50
2. Ola owes Sam nothing
3. Tommen owes Kelly £4.50
4. Ola pays Kelly -> 25

Ola pays Kelly -> 25
Sam pays Tommen -> 20
Sandy pays Kelly -> 9.5
Sandy pays Tommen -> 5.5





