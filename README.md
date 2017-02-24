# ScreenCreator
Simple screen script that create multiple windows and executing given cmd

# Description
Create multiple windows in a screen session. It read a file filled with commands that need to be executed in a screen session without human intervention.

# Usage
### Execution
For now, there is only two possibles options.

To create a new session with a specific name
* `./screenCreator.sh -n NAME`

To execute one or multiple commands in a screen session(this will create multiple windows)
* `./screenCreator.sh -f FILE`

They can also be mixed
* `./screenCreator.sh -n NAME -f FILE`

### File
In the configuration file, you add line by line all the commands you want to execute.

You can also check the [example file](https://github.com/gzsierra/ScreenCreator/blob/master/file.txt) to help you

```
htop
echo 1
echo 2
echo 3
```

# TODO
- [ ] Make yaml file
- [ ] Wait before execute

# LICENCE
[Apache License](https://github.com/gzsierra/ScreenCreator/blob/master/LICENSE)
