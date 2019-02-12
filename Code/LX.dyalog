 LX;root
 ⎕IO←0
 root←(+/∨\(⌽⎕WSID)∊'\/')↑⎕WSID
 root←root,'Code',¯1↑root
 ⎕SE.SALT.Load root,'START'
 START
