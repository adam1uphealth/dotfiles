# Likely out of date soon 
function hash1upPw -d "hash a password in the style of 1up"
    command node -e "const phpPassword = require('@1uphealth/node-php-password'); console.log(phpPassword.hash('$argv[1]'))" | pbcopy
end
