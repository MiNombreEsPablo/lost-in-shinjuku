import secrets
import string
import json
from datetime import date,datetime

def random_str(n=8):
    # Define the characters to choose from
    characters = string.ascii_letters + string.digits
    # Generate the unreplicable string of length 8
    unreplicable_string = ''.join(secrets.choice(characters) for _ in range(n))
    return unreplicable_string


def append_message_to_json_file(file_path, message):
    """
    Appends a message to a list in a JSON file.

    :param file_path: The path to the JSON file.
    :param message: The message to append.
    """
    try:
        # Read the current content of the file
        with open(file_path, 'r') as file:
            data = json.load(file)
    except FileNotFoundError:
        # If the file does not exist, start with an empty list
        data = []
    except json.JSONDecodeError:
        # If the file is empty or contains invalid JSON, start with an empty list
        data = []

    # Append the message to the data (assuming it's a list)
    data.append(message.copy())

    # Write the updated data back to the file
    with open(file_path, 'w') as file:
        json.dump(data, file, indent=4)
    return message