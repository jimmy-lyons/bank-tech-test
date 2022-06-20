# Bank tech test

## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or Node.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2023  
**And** a deposit of 2000 on 13-01-2023  
**And** a withdrawal of 500 on 14-01-2023  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00
```

## Implementation

### Data

Data will be stored in SQL tables as follows:

* **Accounts** - responsible for managing the state of a users account
  - id 
  - account_name (varchar)
  - balance (decimal)
* **Transactions** - responsible for recording a users transactions
  - id
  - account_id (foreign key)
  - credit (decimal)
  - debit (decimal)
  - balance (decimal)

### MVC

* **Model** - The model will be responsible for accessing and manipulating data in the database. The model will contain one class called **Account** with the following primary methods:
  - deposit - will increase the *Accounts Table* balance by the specified amount and record the activity in *Transactions Table*.
  - withdraw - will decrease the *Accounts Table* balance by the specified amount and record the activity transaction in *Transactions Table*.
  - statement - will retrieve the data necessary for the bank statement.
  - create_account - will create a new account in the database.

* **View** - Since the specification for this exercise states that the bank programme will be accessed via a REPL (in this case IRB), the view will only be responsible for formatting the data recieved from the model and logging it to the terminal. The view requires a single class called **Formatter** with the following methods:
  - deposit_confirmation - will log a confirmation message to the terminal.
  - withdrawl_confirmation - will log a confirmation message to the terminal.
  - statement_report - will log a report of transactions to the terminal.

* **Controller** - The 'app.rb' file will act as the controller in this project. It will not be required to manage web pages, but will make calls to the model and view, which are described above. The app will be how the user is to interact with the system.

