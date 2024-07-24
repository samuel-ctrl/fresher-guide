```python
from sqlalchemy.orm import Session
from . import models, schemas

def get_book(db: Session, book_id: int):
    """
    Get a book by its ID.
    """
    return db.query(models.Book).filter(models.Book.id == book_id).first()

def get_books(db: Session, skip: int = 0, limit: int = 100):
    """
    Get a list of books with optional pagination.
    """
    return db.query(models.Book).offset(skip).limit(limit).all()

def create_book(db: Session, book: schemas.BookCreate):
    """
    Create a new book record.
    """
    db_book = models.Book(
        title=book.title,
        publication_date=book.publication_date,
        isbn=book.isbn,
        publisher_id=book.publisher_id,
        cover=book.cover,
        sample=book.sample
    )
    db.add(db_book)
    db.commit()
    db.refresh(db_book)
    return db_book

def update_book(db: Session, book_id: int, book: schemas.BookCreate):
    """
    Update an existing book record by its ID.
    """
    db_book = db.query(models.Book).filter(models.Book.id == book_id).first()
    if db_book:
        db_book.title = book.title
        db_book.publication_date = book.publication_date
        db_book.isbn = book.isbn
        db_book.publisher_id = book.publisher_id
        db_book.cover = book.cover
        db_book.sample = book.sample
        db.commit()
        db.refresh(db_book)
    return db_book

def delete_book(db: Session, book_id: int):
    """
    Delete a book record by its ID.
    """
    db_book = db.query(models.Book).filter(models.Book.id == book_id).first()
    if db_book:
        db.delete(db_book)
        db.commit()
    return db_book
```

### Explanation:

1. **`get_book`**:
   - Retrieves a book by its ID from the database.

2. **`get_books`**:
   - Retrieves a list of books with optional pagination (using `skip` and `limit`).

3. **`create_book`**:
   - Creates a new book record based on the provided `schemas.BookCreate` data.
   - Adds the new book to the database, commits the transaction, and returns the created book.

4. **`update_book`**:
   - Updates an existing book record by its ID with the provided data.
   - Finds the book, updates its fields, commits the transaction, and returns the updated book.

5. **`delete_book`**:
   - Deletes a book record by its ID.
   - Finds the book, deletes it, commits the transaction, and returns the deleted book.

Go to [MAIN GUIDE](../main.md) or back to [DATABASE INIT GUIDE](__init__.md)