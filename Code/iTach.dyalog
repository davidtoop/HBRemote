:Class iTach


    :Field private ipaddress
    :Field private name
    :Field private CrLf←⎕av[3 2]
    :Field private Cr←⎕ucs 13


    ∇ init ip;_
      :Access public
      :Implements Constructor
      ipaddress←ip
      name←'C',ip~'.'
      _←#.iConga.Clt name ip 4998 'Text' 32000
      _←#.iConga.Wait name
      _←#.iConga.Wait name
      _←#.iConga.Wait name
    ∇



    ∇ r←GetDevices;cmd;_;resp
      :Access public
      cmd←'getdevices',Cr
      _←#.iConga.Send name cmd
      resp←#.iConga.Wait name
     
      :If 0=⎕IO⊃resp
          r←3⊃resp
      :Else
          r←'Error'
      :EndIf
     
     
    ∇

    ∇r←SendIr ir;_
    :Access public
    _←#.iConga.Send name ir
    r←#.iConga.Wait name
    ∇

:EndClass
