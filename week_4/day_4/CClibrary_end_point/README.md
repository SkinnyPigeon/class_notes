The aim of the example is to teach the use of many-to-many relationship in a Sinatra app complete with views, controllers and tests.

An order

 - Member
  - ID
  - Name
  - Address

 - Book
  - ID
  - Title
  - Author

 - rental joined table
  - member_id
  - book_id