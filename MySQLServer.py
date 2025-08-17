#!/usr/bin/env python3
# MySQLServer.py

import mysql.connector

def create_alx_book_store_database():
    """
    Connects to a MySQL server and creates the 'alx_book_store' database.
    """
    # Replace these with your MySQL server credentials
    mysql_user = "your_mysql_user"  # e.g., "root"
    mysql_password = "your_mysql_password" # e.g., "password"
    mysql_host = "localhost" # Or the IP address of your MySQL server

    db_connection = None
    db_cursor = None

    try:
        # Connect to the MySQL server
        # We connect without specifying a database first to perform the CREATE operation
        db_connection = mysql.connector.connect(
            host=mysql_host,
            user=mysql_user,
            password=mysql_password
        )

        db_cursor = db_connection.cursor()

        # SQL statement to create the database if it doesn't exist
        # The IF NOT EXISTS clause prevents the script from failing if the database exists
        create_db_query = "CREATE DATABASE IF NOT EXISTS alx_book_store"

        # Execute the SQL query
        db_cursor.execute(create_db_query)

        print("Database 'alx_book_store' created successfully!")

    except mysql.connector.Error as err:
        # Handle connection and other potential errors
        print(f"Error: Failed to connect to MySQL server. {err}")

    finally:
        # Close the cursor and connection to free up resources
        if db_cursor:
            db_cursor.close()
        if db_connection:
            db_connection.close()

if __name__ == "__main__":
    create_alx_book_store_database()