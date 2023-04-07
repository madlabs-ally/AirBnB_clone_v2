i#!/usr/bin/python3
from fabric.api import local
from datetime import datetime


def do_pack():
    """Create an archive file of the web_static directory"""

    # Save the current timestamp and create the filename
    time_now = datetime.now().strftime("%Y%m%d%H%M%S")
    file_path = "versions/web_static_{}.tgz".format(time_now)

    try:
        # Create a directory called versions if it does not exist
        local("mkdir -p versions")

        # Create an archive file using tar command
        local("tar -cvzf {} web_static/".format(file_path))

        # Return the path to the archive file created
        return file_path

    except Exception as e:
        # Print error message and return None if an error occurs
        print("Error: {}".format(e))
        return None

