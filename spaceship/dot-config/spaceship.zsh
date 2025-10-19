# Spaceship prompt configuration
# https://spaceship-prompt.sh/config/intro/

# Core prompt config
# SPACESHIP_TIME_SHOW=true
# SPACESHIP_USER_SHOW=always
# SPACESHIP_CHAR_SYMBOL="$"
SPACESHIP_CHAR_SYMBOL="❱"
SPACESHIP_CHAR_SYMBOL_ROOT="#"
# SPACESHIP_CHAR_SUFFIX=" "

# Only show execution time after n seconds
SPACESHIP_EXEC_TIME_ELAPSED=0
# Precision (number of decimal points)
SPACESHIP_EXEC_TIME_PRECISION=2


SPACESHIP_DIR_TRUNC_REPO=true
SPACESHIP_PROMPT_ADD_NEWLINE=false

# Add a custom vi-mode section to the prompt
# See: https://github.com/spaceship-prompt/spaceship-vi-mode
# spaceship add --before char vi_mode

# Turn off the languge stuff
SPACESHIP_RUBY_SHOW=false
SPACESHIP_LUA_SHOW=false
SPACESHIP_PYTHON_SHOW=false
SPACESHIP_DOCKER_SHOW=false
SPACESHIP_NODE_SHOW=false
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_ANSIBLE_SHOW=false

# Kuberenetes
SPACESHIP_KUBECTL_SHOW=true
SPACESHIP_KUBECTL_VERSION_SHOW=false
