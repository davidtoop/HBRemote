 CleanUp;obs
 obs←⎕NL 2 3 4 9
 obs←{(⌽∨\⌽' '≠⍵)/⍵}¨⊃,/↓¨obs)~⊂'LX'
 ⎕EX obs
