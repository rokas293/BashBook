# BashBook

## Introduction

The BashBook project, a simple Facebook-like social media implemented in Bash. This README file provides instructions on how to run the server and 
client scripts.

## Instructions

### 1. Running the Server (server.sh)

1. Open a terminal
2. Navigate to the project directory

```bash
cd /path/to/BashBook

3. Run the server script

./server.sh
The server will start listening for client requests

### 2. Running a Client (client.sh)

1. Open a terminal
2. Navigate to the project directory

```bash
cd /path/to/BashBook

3. Run the client script with a unique user ID

./client.sh user1

4. Follow the prompts to interact with the server.
   - Enter a request(create, add, post, display)
   - Enter additional arguments as needed

5. Press `Ctrl+C` to exit the client script

### 3. Running Additional Clients

Repeat steps 1-4 to run additional clients with different user ID's

### CleanUP

To stop the server and clean up resources, press `Ctrl+C` in the server 
terminal. The server scripts will remove the named pipe and exit gracefully

### Notes

- Ensure that the server is running before starting any clients
- Each client interacts independently with the server using named pips
