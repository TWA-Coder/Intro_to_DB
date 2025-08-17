# MySQLServer.py
import mysql.connector
from mysql.connector import errorcode

# Database configuration - You will need to change these to your MySQL server credentials
DB_HOST = "localhost"
DB_USER = "your_username"
DB_PASSWORD = "your_password"
DATABASE_NAME = "alx_book_store"

def create_alx_book_store_db():
    """
    Connects to the MySQL server and creates the 'alx_book_store' database if it doesn't exist.
    Handles connection errors and ensures the script does not fail if the database exists.
    """
    db_connection = None
    try:
        # Connect to the MySQL server without specifying a database initially
        db_connection = mysql.connector.connect(
            host=DB_HOST,
            user=DB_USER,
            password=DB_PASSWORD
        )

        db_cursor = db_connection.cursor()
        
        # SQL statement to create the database if it does not exist
        # Using "CREATE DATABASE IF NOT EXISTS" handles the requirement of not failing if it already exists.
        sql_query = f"CREATE DATABASE IF NOT EXISTS {DATABASE_NAME}"
        
        db_cursor.execute(sql_query)
        
        # Check for warnings to see if the database was actually created or already existed
        # The `execute` method for a "CREATE IF NOT EXISTS" query will return a warning if the database exists.
        # We can check the cursor's `with_rows` attribute, but since we are not allowed to use SELECT or SHOW,
        # we can rely on the fact that if no exception is raised, the command was successful.
        # To provide a more specific message, we can get the warnings.
        
        # Note: The `warnings` attribute is a list of tuples (warning_code, warning_message)
        # However, to be fully compliant with the "no SELECT or SHOW" rule, we'll
        # just assume success if no error is raised, and the CREATE IF NOT EXISTS handles the idempotency.
        # The prompt requires a success message, so we'll print it.
        print(f"Database '{DATABASE_NAME}' created successfully!")
        
    except mysql.connector.Error as err:
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Error: Access denied. Something is wrong with your user name or password.")
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            # This is a general error, but for this specific script, it's unlikely to be hit
            # since we are creating the database first.
            print(f"Error: Database '{DATABASE_NAME}' does not exist.")
        else:
            print(f"Error: {err}")
    
    finally:
        # Ensure the cursor and connection are closed
        if 'db_cursor' in locals() and db_cursor is not None:
            db_cursor.close()
        if db_connection and db_connection.is_connected():
            db_connection.close()
            print("MySQL connection is closed.")

if __name__ == "__main__":
    create_alx_book_store_db()