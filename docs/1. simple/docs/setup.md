# Setup

1. **Install Required Tools**
   - Install Python 3.8+.
   - Install PostgreSQL.
   - Install an IDE (like VSCode).

2. **Set Up Directory Structure**
   please refer to the [Structure Guide](basic_structure.md).

3. **Create and Activate Virtual Environment**

   - **Windows:**
     ```bash
     python -m venv .venv
     .venv\Scripts\activate
     ```

   - **macOS/Linux:**
     ```bash
     python -m venv .venv
     source .venv/bin/activate
     ```

4. **Install Dependencies**

   With the virtual environment activated, install the required packages using pip:

   ```bash
   pip install fastapi uvicorn sqlalchemy psycopg2-binary
   ```