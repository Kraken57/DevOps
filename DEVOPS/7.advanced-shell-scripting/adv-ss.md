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