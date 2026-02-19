# deliverable_db
School project

5 Requirements
You have all been hired by a startup that is building the next generation online platform for pet
owners.

Before our devs can get to work, they need you to come up with a schema for the main
production database.

You need to deliver one or more .sql files that create the needed tables, views, keys
and relations, as well as populate the tables with test data, so we can test our applications
while we develop them.

The database design should be normalized to 3NF.

After endless meetings with people from sales, social, research and marketing teams, you’ve
come up with the following requirements.

5.1 Database

5.1.1
We will use MariaDB version 12 for the production database.

5.2 Users

5.2.1
Users sign up for our services by chosing a unique username and password, as well as providing
a unique email adress they need to confirm before their account can be used.

5.2.2
When a user buys something from our app’s store, they need to provide a billing adress and a
delivery adress.

5.3 Pets

5.3.1
Users can register their pets on our platform. A pet can be one of many different species. When
chosing the specie, the user should be able to chose a specie using either the common name (i.e.:
dog) or the latin name (i.e.: Canis Familiaris). Either names should result in the same specie
being chosen.

5.3.2
A pet can also have a given name and a date of birth (so that we can send a happy bithday
message).

5.3.3
Users can also write a description of their pets for other users to read.

5.3.4
A pet can be a current pet (alive) or a former pet (dead).

5.4 Shop

5.4.1
Our webshop will offer many products, divided into different categories.
Each product has a unique SKU (https://en.wikipedia.org/wiki/Stock_keeping_unit),
a name, a manifacturer whom we buy it from, a buying price and a selling price.

Each manufacturer we buy our products from has a name, an adress and a contact person
(along with their contact information).

5.4.2
Products have a descriptive text where further details are stored, such as sizes, colours, materials,
instructions, etc..

5.5 Orders

5.5.1
An order is submitted by a user, and it contains one or more products in different quantities.
An order has a status, and it can be awaiting, fullfilled or cancelled.

5.6 Warehouses

5.6.1
We will open warehouses in the country’s major cities to allow quick fullfillment and delivery
times across the whole country.

Each order will be assigned to a warehouse to be fullfilled.

5.6.2
We will need to keep an inventory for all the products across all warehouses.

5.7 Social

5.7.1
Users can send messages to each other. Each message has a sender and a receiver.

5.7.2
A message can either be an answer to another message (which we say is the parent of the
message), or the beginning of a new thread (without a parent).

5.8 For VG

5.8.1
All changes (INSERT, UPDATE and DELETE) on all tables are to be logged in separate log tables
using TRIGGERS (1 log table per table).

5.8.2
A python script is to be provided in the repo. It should allow the user to chose a warehouse
from the ones present in the DB, and it should show if all the current (non-fullfilled and non-
cancelled) orders assigned to that warehouse can be fullfilled with the current inventory present
in the location.

If it is not possible to fullfill all orders, the script should print out a list of which and how
many products are missing at each warehouse.

5.8.3
Make your design work with species having more than one common name, and more than one
latin name.
