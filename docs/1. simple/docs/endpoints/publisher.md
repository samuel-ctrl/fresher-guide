
# `app/endpoints/publisher.py`

## Router Definition

```python
router = APIRouter()
```

## Routes

### Create New Publisher

```python
@router.post("/", response_model=schemas.Publisher)
```

### Edit Publisher

```python
@router.put("/{publisher_id}/", response_model=schemas.Publisher)
```