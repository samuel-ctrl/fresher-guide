# Guide to Creating SQLAlchemy Models and Pydantic Schemas

Define your database models & schema in `db/models.py` & `db/schema.py`:
Here’s a refined version of your notes and comparison table for better clarity and presentation:

---

**Notes:**
- **Models**: ORMs (Object-Relational Mappers) like SQLAlchemy are used to interact with databases by mapping Python objects to database tables. They simplify defining and managing database schemas and performing CRUD (Create, Read, Update, Delete) operations.

- **Schema**: In the context of data validation and serialization, schemas define the structure and rules for data. They ensure that data conforms to specific formats and constraints.


## 1. Publisher Model

### SQLAlchemy Model

1. Create a file named `models.py`.
2. Import necessary modules: `Column`, `Integer`, `String` from `sqlalchemy` and `declarative_base` from `sqlalchemy.ext.declarative`.
3. Define a `Base` class using `declarative_base()`.
4. Define a `Publisher` class that inherits from `Base`.
5. Define the table name using `__tablename__`.
6. Define the columns: `id`, `name`, `website`, and `email`.
7. Implement the `__str__` method to return the publisher's name.

### Pydantic Schema

1. Create a file named `schemas.py`.
2. Import necessary modules: `BaseModel`, `EmailStr`, and `HttpUrl` from `pydantic`.
3. Define a `PublisherBase` class that inherits from `BaseModel`.
4. Define the fields: `name`, `website`, and `email`.
5. Define a `PublisherCreate` class that inherits from `PublisherBase`.
6. Define a `Publisher` class that inherits from `PublisherBase`.
7. Add an `id` field to the `Publisher` class.
8. Set the `orm_mode` to `True` in the `Config` class of the `Publisher`.

---

## 2. Book Model

### SQLAlchemy Model

1. Continue editing `models.py`.
2. Import necessary modules: `Date`, `ForeignKey` from `sqlalchemy` and `relationship` from `sqlalchemy.orm`.
3. Define a `Book` class that inherits from `Base`.
4. Define the table name using `__tablename__`.
5. Define the columns: `id`, `title`, `publication_date`, `isbn`, `publisher_id`, `cover`, and `sample`.
6. Define relationships: `publisher` and `contributors`.
7. Implement the `__str__` method to return the book's title and ISBN.

### Pydantic Schema

1. Continue editing `schemas.py`.
2. Import necessary modules: `date` from `datetime` and `List`, `Optional` from `typing`.
3. Define a `BookBase` class that inherits from `BaseModel`.
4. Define the fields: `title`, `publication_date`, `isbn`, and `publisher_id`.
5. Define a `BookCreate` class that inherits from `BookBase`.
6. Define a `Book` class that inherits from `BookBase`.
7. Add additional fields: `id`, `cover`, `sample`, `publisher`, and `contributors`.
8. Set the `orm_mode` to `True` in the `Config` class of the `Book`.

---

## 3. Contributor Model

### SQLAlchemy Model

1. Continue editing `models.py`.
2. Define a `Contributor` class that inherits from `Base`.
3. Define the table name using `__tablename__`.
4. Define the columns: `id`, `first_names`, `last_names`, and `email`.
5. Implement a method `initialled_name` to return the contributor's name with initials.
6. Implement the `__str__` method to return the contributor's initialled name.

### Pydantic Schema

1. Continue editing `schemas.py`.
2. Define a `ContributorBase` class that inherits from `BaseModel`.
3. Define the fields: `first_names`, `last_names`, and `email`.
4. Define a `ContributorCreate` class that inherits from `ContributorBase`.
5. Define a `Contributor` class that inherits from `ContributorBase`.
6. Add an `id` field to the `Contributor` class.
7. Set the `orm_mode` to `True` in the `Config` class of the `Contributor`.

---

## 4. BookContributor Model

### SQLAlchemy Model

1. Continue editing `models.py`.
2. Import necessary modules: `TextChoices` from `django.db.models`.
3. Define a `BookContributor` class that inherits from `Base`.
4. Define the table name using `__tablename__`.
5. Define a nested `ContributionRole` class that inherits from `TextChoices`.
6. Define the choices: `AUTHOR`, `CO_AUTHOR`, and `EDITOR`.
7. Define the columns: `book_id`, `contributor_id`, and `role`.
8. Implement the `__str__` method to return the contributor's name and role.

### Pydantic Schema

1. Continue editing `schemas.py`.
2. Define a `BookContributorBase` class that inherits from `BaseModel`.
3. Define the fields: `book_id`, `contributor_id`, and `role`.
4. Define a `BookContributorCreate` class that inherits from `BookContributorBase`.
5. Define a `BookContributor` class that inherits from `BookContributorBase`.
6. Add an `id` field to the `BookContributor` class.
7. Set the `orm_mode` to `True` in the `Config` class of the `BookContributor`.

---

## 5. Review Model

### SQLAlchemy Model

1. Continue editing `models.py`.
2. Import necessary modules: `TextField`, `DateTimeField`, `auth.get_user_model` from `django`.
3. Define a `Review` class that inherits from `Base`.
4. Define the table name using `__tablename__`.
5. Define the columns: `id`, `content`, `rating`, `date_created`, `date_edited`, `creator_id`, and `book_id`.
6. Implement the `__str__` method to return the reviewer's username and book title.

### Pydantic Schema

1. Continue editing `schemas.py`.
2. Define a `ReviewBase` class that inherits from `BaseModel`.
3. Define the fields: `content`, `rating`, `date_created`, `date_edited`, `creator_id`, and `book_id`.
4. Define a `ReviewCreate` class that inherits from `ReviewBase`.
5. Define a `Review` class that inherits from `ReviewBase`.
6. Add an `id` field to the `Review` class.
7. Set the `orm_mode` to `True` in the `Config` class of the `Review`.

Go to [CRUD GUIDE](CRUD.md) or back to [DATABASE INIT GUIDE](__init__.md)