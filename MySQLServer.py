# MySQLServer.py
import mysql.connector
from mysql.connector import errorcode

# Database configuration - You will need to change these to your MySQL server credentials
DB_HOST = "localhost"
DB_USER = "your_username"
DB_PASSWORD = "your_password"
alx_book_store = "alx_book_store"

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
        sql_query = f"CREATE DATABASE IF NOT EXISTS {alx_book_store}"
        
        db_cursor.execute(sql_query)
        
    
        print(f"Database '{alx_book_store}' created successfully!")
        
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