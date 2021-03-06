## NonRelDB-server
Server for NonRelDB.

## NonRelDB
NonRelDB is an in-memory database that persists on disk. The data model is key-value. Written on pure golang.

## Installation
First of all you need to install [git](https://git-scm.com/) and [docker](https://www.docker.com/)
Then you need to clone repository on your pc from github

    git clone https://github.com/777777miSSU7777777/NonRelDB-server.git

In cloned repository you will find **Makefile** with following targets:

 - **build** - copies server's src and it's dependecies, adds go vet, goimports and golint. Runs checks and if no errors were occured, builds server's binary. Entrypoint is server with default configuration.
 - **clean** - cleans docker's unused containers, networks, volumes and dangling images.
 - **check** - runs subsequently go vet, goimports and golint on the project. Fails if any error occurs.
 - **test** - runs unit & integration tests. Fails if any test don't pass.
 - **run** - runs built docker container in detached mode.
 
## Usage
### Flags
 - **-host -h** - defines host ip (default is 127.0.0.1)
 - **-port -p** - defines host port (default is 9090)
 - **-mode -m** - defines storage location (default is "memory"). Possible options are "memory" and "disk".
 - **-location -l** - defines storage location on disk (default is "storage.json").

### Commands
Commands can be proccessed only in one register (**GET** and **get** but not **Get**).

 **List of supported commands**
 - **GET** - returns the value if existing, otherwise message "Value with this key not found".  
 Example
 

    GET 123
    

 - **SET** - set the value if existing, otherwise creates new. Also returns message "Value has changed".  
 **Value must be in double quotes.*  
 Example
 

    SET 123 "123"
    

 - **DEL** - deletes value from storage and returns it's value if existing, otherwise message "Value with this key not found".  
 Example
 

    DEL 123

- **KEYS** - returns all keys matching to entered regexp pattern, otherwise message "Keys with this pattern not found" or "Pattern is incorrect".  
**Regex pattern must be in double quotes.*  
Example

    KEYS "/*"

- **SUBSCRIBE** - subscribes the client on specified channel.  
Example 

    SUBSCRIBE redis

- **UNSUBSCRIBE** - unsubscribes the client from specified channel.    
Example

    UNSUBSCRIBE redis

- **PUBLISH** - sends the message to specified channel.  
*\*Message must be in double quotes.*   
Example

    PUBLISH redis "Hello world"
 
 ## Notice
 - Server will crash with non-existing flag's values.
 - Not implented -help flag.
