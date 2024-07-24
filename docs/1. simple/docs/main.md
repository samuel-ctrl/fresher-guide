## Create the Main Application

In `app/main.py`, set up the FastAPI application:

```python
from fastapi import Depends, FastAPI, HTTPException
from sqlalchemy.orm import Session

from .db import crud, models, schemas
from .db.base import SessionLocal, engine

from .endpoints import book, publisher

models.Base.metadata.create_all(bind=engine)

app = FastAPI()

# Dependency
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

# Include routers
app.include_router(book.router, prefix="/books", tags=["BOOKS"])
app.include_router(publisher.router, prefix="/publisher", tags=["PUBLISHER"])

```