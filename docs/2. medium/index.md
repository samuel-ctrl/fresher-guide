## Users API

### Retrieve Users
```
GET /users/
```
**Response Fields:**
- `id`: Unique identifier for the user.
- `name`: Name of the user.
- `email`: Email address of the user.
- `gender`: Gender of the user.
- `phone_number`: Phone number of the user.
- `age`: Age of the user.
- `favorite_books`: List of books the user has marked as favorite.
- `total_reviews`: Total number of reviews written by the user.

### Create User
```
POST /users/
```
**Request Fields:**
- `name`: Name of the user.
- `email`: Email address of the user.
- `gender`: Gender of the user.
- `phone_number`: Phone number of the user.
- `age`: Age of the user.

**Response Fields:**
- `id`: Unique identifier for the created user.
- `name`: Name of the user.
- `email`: Email address of the user.
- `gender`: Gender of the user.
- `phone_number`: Phone number of the user.
- `age`: Age of the user.

### Retrieve User
```
GET /users/{user_id}
```
**Response Fields:**
- `id`: Unique identifier for the user.
- `name`: Name of the user.
- `email`: Email address of the user.
- `gender`: Gender of the user.
- `phone_number`: Phone number of the user.
- `age`: Age of the user.
- `favorite_books`: List of favorite books.
- `total_reviews`: Total number of reviews written by the user.

### Update User
```
PUT /users/{user_id}
```
**Request Fields:**
- `name`: Updated name of the user.
- `email`: Updated email address of the user.
- `gender`: Updated gender of the user.
- `phone_number`: Updated phone number of the user.
- `age`: Updated age of the user.

**Response Fields:**
- `id`: Unique identifier for the user.
- `name`: Updated name of the user.
- `email`: Updated email address of the user.
- `gender`: Updated gender of the user.
- `phone_number`: Updated phone number of the user.
- `age`: Updated age of the user.

## Categories API

### Retrieve Categories
```
GET /categories/
```
**Response Fields:**
- `id`: Unique identifier for the category.
- `name`: Name of the category.
- `description`: Description of the category.

### Create Category
```
POST /categories/
```
**Request Fields:**
- `name`: Name of the new category.
- `description`: Description of the new category.

**Response Fields:**
- `id`: Unique identifier for the created category.
- `name`: Name of the category.
- `description`: Description of the category.

### Retrieve Category
```
GET /categories/{category_id}
```
**Response Fields:**
- `id`: Unique identifier for the category.
- `name`: Name of the category.
- `description`: Description of the category.

### Update Category
```
PUT /categories/{category_id}
```
**Request Fields:**
- `name`: Updated name of the category.
- `description`: Updated description of the category.

**Response Fields:**
- `id`: Unique identifier for the category.
- `name`: Updated name of the category.
- `description`: Updated description of the category.

## Publishers API

### Retrieve Publishers
```
GET /publishers/
```
**Response Fields:**
- `id`: Unique identifier for the publisher.
- `name`: Name of the publisher.
- `location`: Location of the publisher.
- `books`: List of books associated with the publisher.

### Create Publisher
```
POST /publishers/
```
**Request Fields:**
- `name`: Name of the new publisher.
- `location`: Location of the new publisher.
- `books`: List of books associated with the new publisher.

**Response Fields:**
- `id`: Unique identifier for the created publisher.
- `name`: Name of the publisher.
- `location`: Location of the publisher.
- `books`: List of books associated with the publisher.

### Retrieve Publisher
```
GET /publishers/{publisher_id}
```
**Response Fields:**
- `id`: Unique identifier for the publisher.
- `name`: Name of the publisher.
- `location`: Location of the publisher.
- `books`: List of books associated with the publisher.

### Update Publisher
```
PUT /publishers/{publisher_id}
```
**Request Fields:**
- `name`: Updated name of the publisher.
- `location`: Updated location of the publisher.
- `books`: Updated list of books associated with the publisher.

**Response Fields:**
- `id`: Unique identifier for the publisher.
- `name`: Updated name of the publisher.
- `location`: Updated location of the publisher.
- `books`: Updated list of books associated with the publisher.

### Delete Publisher
```
DELETE /publishers/{publisher_id}
```
**Response Fields:**
- `message`: Confirmation message indicating successful deletion.

## Bookstores API

### Retrieve Bookstores
```
GET /bookstores/
```
**Response Fields:**
- `id`: Unique identifier for the bookstore.
- `name`: Name of the bookstore.
- `location`: Location of the bookstore.
- `books`: List of books available at the bookstore.

### Create Bookstore
```
POST /bookstores/
```
**Request Fields:**
- `name`: Name of the new bookstore.
- `location`: Location of the new bookstore.
- `books`: List of books available at the new bookstore.

**Response Fields:**
- `id`: Unique identifier for the created bookstore.
- `name`: Name of the bookstore.
- `location`: Location of the bookstore.
- `books`: List of books available at the bookstore.

### Retrieve Bookstore
```
GET /bookstores/{bookstore_id}
```
**Response Fields:**
- `id`: Unique identifier for the bookstore.
- `name`: Name of the bookstore.
- `location`: Location of the bookstore.
- `books`: List of books available at the bookstore.

### Update Bookstore
```
PUT /bookstores/{bookstore_id}
```
**Request Fields:**
- `name`: Updated name of the bookstore.
- `location`: Updated location of the bookstore.
- `books`: Updated list of books available at the bookstore.

**Response Fields:**
- `id`: Unique identifier for the bookstore.
- `name`: Updated name of the bookstore.
- `location`: Updated location of the bookstore.
- `books`: Updated list of books available at the bookstore.

### Delete Bookstore
```
DELETE /bookstores/{bookstore_id}
```
**Response Fields:**
- `message`: Confirmation message indicating successful deletion.

### Add Book to Bookstore
```
POST /bookstores/{bookstore_id}/books/{book_id}
```
**Response Fields:**
- `message`: Confirmation message indicating the book has been added to the bookstore's stock.

### Remove Book from Bookstore
```
DELETE /bookstores/{bookstore_id}/books/{book_id}
```
**Response Fields:**
- `message`: Confirmation message indicating the book has been removed from the bookstore's stock.

## Search API

### Search Books
```
GET /search/books
```
**Request Parameters:**
- `name` (optional): Search by book name.
- `description` (optional): Search by book description.
- `author` (optional): Search by author name.
- `category` (optional): Search by category name.
- `publisher` (optional): Search by publisher name.

**Response Fields:**
- `results`: List of books matching the search criteria.
  - `id`: Unique identifier for the book.
  - `name`: Name of the book.
  - `author`: Author of the book.
  - `category`: Category of the book.
  - `publisher`: Publisher of the book.
  - `average_rating`: Average rating of the book.
  - `total_reviews`: Total number of reviews for the book.

### Search Authors
```
GET /search/authors
```
**Request Parameters:**
- `name` (optional): Search by author name.
- `awards` (optional): Search by author awards.

**Response Fields:**
- `results`: List of authors matching the search criteria.
  - `id`: Unique identifier for the author.
  - `name`: Name of the author.
  - `age`: Age of the author.
  - `gender`: Gender of the author.
  - `awards`: List of awards received by the author.
  - `latest_books`: List of books authored recently.
  - `total_published`: Total number of books published by the author.
  - `average_rating`: Average rating of books by the author.

### Search Categories
```
GET /search/categories
```
**Request Parameters:**
- `name` (optional): Search by category name.
- `description` (optional): Search by category description.

**Response Fields:**
- `results`: List of categories matching the search criteria.
  - `id`: Unique identifier for the category.
  - `name`: Name of the category.
  - `description`: Description of the category.

### Search Reviews
```
GET /search/reviews
```
**Request Parameters:**
- `content` (optional): Search by review content.
- `rating` (optional): Search by review rating.
- `user` (optional): Search by reviewer's user ID.

**Response Fields:**
- `results`:

 List of reviews matching the search criteria.
  - `id`: Unique identifier for the review.
  - `content`: Content of the review.
  - `rating`: Rating given in the review.
  - `created_by`: User who created the review.
  - `book_id`: Book that the review is for.
  - `review_details`: Additional details about the review, such as likes and comments.

### Search Users
```
GET /search/users
```
**Request Parameters:**
- `name` (optional): Search by user name.
- `email` (optional): Search by user email.
- `phone_number` (optional): Search by user phone number.

**Response Fields:**
- `results`: List of users matching the search criteria.
  - `id`: Unique identifier for the user.
  - `name`: Name of the user.
  - `email`: Email address of the user.
  - `gender`: Gender of the user.
  - `phone_number`: Phone number of the user.
  - `age`: Age of the user.
  - `favorite_books`: List of favorite books.
  - `total_reviews`: Total number of reviews written by the user.