# Programming Fundamentals - Consolidation Task

Over the next week you have the chance to consolidate and expand on everything you have learned:

- Ruby fundamentals
- TDD
- OOP
- Web Programming ( REST/MVC )
- Databases with CRUD actions

Your assignment is an opportunity to practice all or some of these principles. Next Thursday you can do a short 10 minute presentation on what you have achieved and learned. This should include pictures of your drawings and planning.

## Project Rules

Projects must:

- Have only handwritten CSS, no frameworks.
- Be written purely server side, with no Javascript. At all.
- Contain only handwritten SQL using the PG gem we have used in class, no ORMs.


## Harvey's Music Store

The owner of Harvey’s Music Store, Harvey, wants an app which will help him keep on top of his store inventory. He does not want an app that customers will see, but he will use to check stock levels, see what he needs to order soon and what is in stock.

You should be able to add to Stock, which would have an Artist and Album as well as the quantity available. He would ideally like to:

- Inventory page
  - Show stock level of all items:
    - High/Medium/Low based on quantity
- Add albums
- Add artists
- Add stock

Any further analysis would be appreciated but not required, for example:

- Create route that sends down Inventory data as JSON
- Work out the markup for each product ( there could be a buy price and a sell price )
  - Total possible sales & markup on inventory page
- Search functionality on Inventory page
- Associated Genre (Harvey associates one Genre to Artists)

## MoneyCashboard

You want to start tracking your spending in an attempt to be more frugal with money.

You must be able to create new Transactions ( which should include merchant name e.g. Tesco and value ) which has an associated Tag (e.g. ‘food’). It would then be able to track a total. Your Account could then be displayed in a view.

Suggested MVP:

- Create new transactions
- Display all transactions
- Display total expenditure
- Display total expenditure by tag

Your app could:

- CRUD actions for the transations
- Create route that sends down Account data as JSON

## Rio Olympics 2016

It’s the Olympic Games in Rio this year! The organising body want you to help them out with an important feature for their website. They are looking for an app that will track the Nations, Athletes and results of Events.

They would like to make it possible to add an Athlete, which will have an associated Nation. Event results should keep track of the athlete who got gold, silver and bronze as well as the event they participated in.

They would ideally like:

- Nation medal results table with
  - gold, silver and bronze count for each nation
  - total points for each nation based on:
    - 5 for Gold
    - 3 for Silver
    - 1 for Bronze
- Be able to add an Athlete, Nation and Event result.
 
Further functionality would be
- CRUD actions for Athlete, Nation and event results
- Listing of each event with the medalists
- Create route that sends down nation results data as JSON


