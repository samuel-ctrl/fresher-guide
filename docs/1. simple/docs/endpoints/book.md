# `app/endpoints/book.py`

This file defines the routes for handling book-related operations in the FastAPI application.

## Router Definition

```python
router = APIRouter()
```

## Routes

### List All Books

```python
@router.get("/", response_model=List[schemas.Book])
```

### Get Book Details

```python
@router.get("/{book_id}", response_model=schemas.Book)
```

### Create New Review

```python
@router.post("/{book_id}/review/new/", response_model=schemas.Review)
```

### Edit Review

```python
@router.put("/{book_id}/review/{review_id}/", response_model=schemas.Review)
```

### Get Book Media

```python
@router.get("/{book_id}/media/", response_model=schemas.BookMedia)
```

### Search Books

```python
@router.get("/search/", response_model=List[schemas.Book])
```

Go to [PUBLISHER ENDPOINTS](publisher.md) or back to [README](../../README.md)