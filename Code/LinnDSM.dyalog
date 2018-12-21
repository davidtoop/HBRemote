:Class LinnDSM


    :Field private ipaddress
    :Field private name
    :Field private CrLf←⎕av[3 2]


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




:EndClass
