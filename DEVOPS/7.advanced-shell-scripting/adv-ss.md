# Advanced Shell Scripting

In this guide, we'll explore a simple yet effective shell script that checks the health of your machine by displaying available disk space, memory usage, and CPU core count.

This script is designed with good practices in mind, which help make your code more readable, maintainable, and efficient.

## Shell Script Example: Node Health Check

Below is an example of a shell script that provides system health information, such as disk usage, memory, and CPU count.

```shell
#!/bin/bash

########################################
# Good practices for shell scripting
# Author : Kraken
# Date: 28/10/2024
#
# This script outputs the health of the node
#
# Version : v1
########################################

echo "Checking disk usage..."
df -h

echo "Checking memory usage (in GB)..."
free -g

echo "Checking the number of processing units..."
nproc

echo "Node health check complete."

```

### Good Practices for Shell Scripting

1. **Use Comments**  
   - Describe the purpose, author, and date at the top.

2. **Add `echo` Statements**  
   - Use `echo` to clearly indicate each action for readability.

3. **Set Proper Permissions**  
   - Use `chmod` (e.g., `chmod +x script.sh`) to make scripts executable.

4. **Use Descriptive Naming**  
   - Name variables meaningfully, like `total_memory` or `disk_usage`.

5. **Handle Errors**  
   - Use `||` for error handling and set appropriate exit codes.

6. **Avoid Hardcoding**  
   - Store paths in variables or use environment variables.

7. **Test Before Production**  
   - Always test scripts locally to avoid unexpected issues.

Following these guidelines helps create efficient, reliable, and maintainable shell scripts.


*Instead of using `echo` everywhere as `echo` is not feasible use `set -x` at the start like this :*

```shell 
#!/bin/bash


set -x # debug mode

df -h

free -g

nproc

echo "Node health check complete."
```


### Command: `ps -ef`

The `ps -ef` command is used in Unix/Linux systems to display a list of all running processes in a detailed format.

This command is useful for monitoring or managing system processes.

### Command Explanation: `ps -ef | grep "amazon"`

The command `ps -ef | grep "amazon"` is used to search for running processes related to "amazon" on a Unix-based system.

## Breakdown of the Command

1. **`ps -ef`**:
   - The `ps` command displays information about active processes.
   - The `-e` flag shows all processes on the system.
   - The `-f` flag provides a full-format listing, including additional details such as the user, PID, parent process ID, start time, and command.

2. **`grep "amazon"`**:
   - The `grep` command searches for the specified keyword, `"amazon"` in this case, within the output of `ps -ef`.
   - This will filter and display only the lines that contain "amazon", helping locate any Amazon-related services or processes.

## Example Usage

```bash
ps -ef | grep "amazon"

### Sample Output 

root      1234     1  0 10:00 ?        00:00:01 /usr/bin/amazon-cloudwatch-agent
user      2345  5678  0 10:05 ?        00:00:00 /amazon/kinesis-agent
user      4567  6789  0 10:10 pts/0    00:00:00 grep --color=auto amazon
```

**One interview question**:
*What is the output for `date | echo "Today is"`*

> Hint : system command, stdin, stdout, stderr .......


Here we get a ID to for each process so to get process with id use :

```bash
ps -ef | grep snapfuse | awk -F" " '{print $2}'
```

### Using `set -e` and `set -o pipefail` in Shell Scripts

- **`set -e`**: This option stops the script if any command returns a non-zero exit status (i.e., fails). It helps catch errors early by halting execution.
- **`set -o pipefail`**: Ensures that if any command in a pipeline (`|`) fails, the entire pipeline is considered failed. This helps detect errors in command chains.

Together, these options make your script more reliable by stopping on errors instead of continuing with potential issues.
