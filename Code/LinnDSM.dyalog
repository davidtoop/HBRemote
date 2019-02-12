:Class LinnDSM


    :Field private ipaddress
    :Field private name
    :Field private CrLf←⎕av[3 2]

    base64←{⎕IO ⎕ML←0 1             ⍝ Base64 encoding and decoding as used in MIME.

     chars←'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
     bits←{,⍉(⍺⍴2)⊤⍵}                   ⍝ encode each element of ⍵ in ⍺ bits,
                                       ⍝   and catenate them all together
     part←{((⍴⍵)⍴⍺↑1)⊂⍵}                ⍝ partition ⍵ into chunks of length ⍺

     0=2|⎕DR ⍵:2∘⊥∘(8∘↑)¨8 part{(-8|⍴⍵)↓⍵}6 bits{(⍵≠64)/⍵}chars⍳⍵
                                       ⍝ decode a string into octets

     four←{                             ⍝ use 4 characters to encode either
         8=⍴⍵:'=='∇ ⍵,0 0 0 0           ⍝   1,
         16=⍴⍵:'='∇ ⍵,0 0               ⍝   2
         chars[2∘⊥¨6 part ⍵],⍺          ⍝   or 3 octets of input
     }
     cats←⊃∘(,/)∘((⊂'')∘,)              ⍝ catenate zero or more strings
     cats''∘four¨24 part 8 bits ⍵
 }


    ∇ init ip;_
      :Access public
      :Implements Constructor
      ipaddress←ip
      name←'C',ip~'.'
      _←#.iConga.Clt name ip 23 'Text' 32000
      _←#.iConga.Wait name
      _←#.iConga.Wait name
      _←#.iConga.Wait name
    ∇




    :Property Standby
    :Access public
        ∇ r←Get;_
          _←#.iConga.Send name('Action Ds/Product 2 Standby',CrLf)
          ⎕←r←3⊃#.iConga.Wait name
          r←(1+r⍳'"')↓r
          r←(r⍳'"')↑r
          r←r≡'true'
        ∇
        ∇ Set args;_
          ⎕←#.iConga.Send name(⎕←'Action Ds/Product 2 SetStandby "',(⍕args.NewValue),'"',CrLf)
          ⎕←#.iConga.Wait name
        ∇
    :endProperty

    ∇ SetRadioChannel uri;_;msg
      :Access public
      msg←'Action Ds/Radio 1 SetChannel ',uri,' ""',CrLf
      ⎕←#.iConga.Send name msg
      ⎕←#.iConga.Wait name
    ∇

    ∇ SetSourceBySystemName src;_;msg
      :Access public
      ⎕←msg←'Action Ds/Product 2 SetSourceBySystemName "',src,'"',CrLf
      ⎕←#.iConga.Send name msg
      ⎕←#.iConga.Wait name
     
    ∇

    ∇ r←GetRadioChannel chan;cmd;_;resp
      :Access public
      cmd←'ACTION Ds/Radio 1 ReadList "',(⍕chan),'"',CrLf
      _←#.iConga.Send name cmd
      resp←#.iConga.Wait name
      :If 0=⎕IO⊃resp
          r←3⊃resp
      :Else
          r←'Error'
      :EndIf
     
     
    ∇
    ∇ r←GetRadioChannelList;cmd;_;resp
      :Access public
      cmd←'ACTION Ds/Radio 1 IdArray',CrLf
      _←#.iConga.Send name cmd
      resp←#.iConga.Wait name
      :if 0=⎕io⊃resp
          r←base64{(⌽∧\⌽' '≠⍵)/⍵}3⊃resp
          r←((0.25×⍴r),4)⍴r
          r←10 10 10 10⊥⍉r
      :else
          r←'Error'
      :endif

    ∇



:EndClass
