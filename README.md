# Bank tech test

## How to use

* Fork repo and clone to local directory.
* To set up databases, follow the instructions in db/migrations/01_db_and_table_setup.
* To run RSPec, type 'rspec' in terminal.

* All functionality of the project should be accessed from app.rb. 
* To use this file, open IRB and require file with "require './app'".
* Methods are to be called direclty on Bank class (no need to create instance), eg Bank.method(arg).
* Methods available to the user are
  * create_bank_account
  * make_deposit
  * make_withdrawl
  * statement

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

## Planning

### Data

Whilst data can be kept in memory, this project will store it in SQL tables. This is to allow for easier handling and manipulation. The tables will be as follows:

* **Accounts** - responsible for managing the state of a users account
  - id 
  - account_name (varchar)
  - balance (decimal)
* **Transactions** - responsible for recording a users transactions
  - id
  - date
  - account_id (foreign key)
  - credit (decimal)
  - debit (decimal)
  - balance (decimal)

### MVC

* **Model** - The model will be responsible for accessing and manipulating data in the database. Since there are to be two tables, there will be two classes in the model which interact with them . **Account** class and table will have the following primary methods:
  - deposit - will increase the *Accounts Table* balance by the specified amount and record the activity in *Transactions Table*.
  - withdraw - will decrease the *Accounts Table* balance by the specified amount and record the activity transaction in *Transactions Table*.
  - create_account - will create a new account in the database.

  **Transaction** class and table will have the following primary methods:
  - record - will log each transaction in the table.
  - statement - will retrieve the data necessary for the bank statement.

* **View** - Since the specification for this exercise states that the bank app will be accessed via a REPL (in this case IRB), the view will only be responsible for formatting the data recieved from the model and logging it to the terminal. The view requires a single class called **Formatter** with the following main methods:
  - deposit_confirmation - will log a confirmation message to the terminal.
  - withdrawl_confirmation - will log a confirmation message to the terminal.
  - statement_report - will log a report of transactions to the terminal.

* **Controller** - The 'app.rb' file will act as the controller in this project. It will not be required to manage web pages, but will make calls to the model and view, which are described above. The app will be how the user is to interact with the system.

## Implementation/ Further Considerations

* The project was implemented accurately to the planning above. 
* The final presentation of the statement included '0' instead of whitespace. With more time this should be refactored out. 
* Time was added to the date to allow for further differentiation between the transactions (as all of mine were on the same day)
* Further controls to the method arguments taken from inputs should be added with more time. 

### Example implimentation from IRB

jimmylyons@Jimmys-MBP bank-tech-test % irb 
3.0.2 :001 > require './app'
 => true 
3.0.2 :002 > Bank.create_bank_account('Harry')
"Thankyou Harry for joining Bank, your account number is 3"
 => "Thankyou Harry for joining Bank, your account number is 3" 
3.0.2 :003 > Bank.create_bank_account('Sally')
"Thankyou Sally for joining Bank, your account number is 4"
 => "Thankyou Sally for joining Bank, your account number is 4" 
3.0.2 :004 > Bank.make_deposit(3, 1000)
"Credit: £1000.00, New Balance: £1000.00"
 => "Credit: £1000.00, New Balance: £1000.00" 
3.0.2 :005 > Bank.make_deposit(4, 2000)
"Credit: £2000.00, New Balance: £2000.00"
 => "Credit: £2000.00, New Balance: £2000.00" 
3.0.2 :006 > Bank.make_withdrawl(3, 200)
"Debit: £200.00, New Balance: £800.00"
 => "Debit: £200.00, New Balance: £800.00" 
3.0.2 :007 > Bank.make_withdrawl(3, 600)
"Debit: £600.00, New Balance: £200.00"
 => "Debit: £600.00, New Balance: £200.00" 
3.0.2 :008 > Bank.make_withdrawl(4, 900)
"Debit: £900.00, New Balance: £1100.00"
 => "Debit: £900.00, New Balance: £1100.00" 
3.0.2 :009 > Bank.make_withdrawl(4, 50.88)
"Debit: £50.88, New Balance: £1049.12"
 => "Debit: £50.88, New Balance: £1049.12" 
3.0.2 :010 > Bank.statement(user_id: 3)
date || credit || debit || balance
21/06/2022 16:57 || 1000.0 || 0.0 || 1000.0
21/06/2022 16:58 || 0.0 || 200.0 || 800.0
21/06/2022 16:58 || 0.0 || 600.0 || 200.0
 => "date || credit || debit || balance\n21/06/2022 16:57 || 1000.0 || 0.0 || 1000.0\n21/06/2022 16:58 || 0.0 || 200.0 || 800.0\n21/06/2022 16:58 || 0.0 || 600.0 || 200.0\n" 
3.0.2 :011 > Bank.statement(user_id: 4)
date || credit || debit || balance
21/06/2022 16:57 || 2000.0 || 0.0 || 2000.0
21/06/2022 16:58 || 0.0 || 900.0 || 1100.0
21/06/2022 16:58 || 0.0 || 50.88 || 1049.12
 => "date || credit || debit || balance\n21/06/2022 16:57 || 2000.0 || 0.0 || 2000.0\n21/06/2022 16:58 || 0.0 || 900.0 || 1100.0\n21/06/2022 16:58 || 0.0 || 50.88 || 1049.12\n" 
3.0.2 :012 > 