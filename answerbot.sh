#!/usr/bin/expect -f
set timeout -1
spawn ./questions.sh
expect "Hello, who are you?\r"
send -- "Hi Im Adam\r"
expect "*password?\r"
interact ++ return
send "\r"
expect "*topic?\r"
send -- "Technology\r"
expect eof
