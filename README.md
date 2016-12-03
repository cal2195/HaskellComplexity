The purpose of this project is to provide a baseline demonstration of the use of cloudhaskell in the context of the
code complexity measurement individual programming project. The cloud haskell platform provides an elegant set of
features that support the construction of a wide variety of multi-node distributed systems commuinication
architectures. A simple message passing abstraction forms the basis of all communication.

This project provides a command line switch for starting the application in master or worker mode. It is implemented
using the work-pushing pattern described in http://www.well-typed.com/blog/71/. Comments below describe how it
operates. A docker-compose.yml file is provided that supports the launching of a master and set of workers.

To use, build and do somethign like the following to start some clients:

```
stack exec use-cloudhaskell-exe worker localhost 8000 &
stack exec use-cloudhaskell-exe worker localhost 8001 &
stack exec use-cloudhaskell-exe worker localhost 8002 &
stack exec use-cloudhaskell-exe worker localhost 8003 &
```

And then start the manager as follows:

```
stack exec use-cloudhaskell-exe manager localhost 8005 100
```

To understand the ouput, consult the code.