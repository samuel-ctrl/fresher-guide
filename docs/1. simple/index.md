## Bookr Project Guide for Beginners

### Introduction
- **Overview**: Brief description of the Bookr project.
- **Technologies**: FastAPI, PostgreSQL, SQLAlchemy.
- **Purpose**: Learn how to build a web application with modern technologies.

### Prerequisites
- Basic knowledge of Python.
- Familiarity with SQL.
- Basic understanding of REST APIs.

## Getting Started

1. [Setup Guide](docs/setup.md)
2. [database Guide](docs/db/__init__.md)
3. [Endpoints Guide](docs/endpoints/__init__.md)

### Running the Application

1. **Start the Server**
   ```bash
   uvicorn app.main:app --reload
   ```

2. **Testing the API**
   - Open [SWAGGER](http://127.0.0.1:8000/docs) in your browser to access the interactive API documentation.