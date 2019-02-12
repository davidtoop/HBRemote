 START;v;up;root
 ⎕IO←0
 'Conga'⎕CY'conga'

 ⍝Load standard utilities
 v←⎕IO⊃'.'⎕WG'APLVersion'
 :Select v
 :Case 'Mac-64'
     up←'/Users/david/Dropbox/apl/utils/'
 :Else
     up←'c:\Users\david\Dropbox\apl\utils\'
 :EndSelect

 ⎕SE.SALT.Load up,'E' ⋄ ⎕SE.SALT.Load up,'F'

⍝ Initalise constants Namespace
 ⎕EX'C'
 'C'⎕NS''
 root←⎕IO⊃⎕NPARTS ⎕WSID
 C.Root←root,'html',E.PathSeparator
 C.Code←root,'Code',E.PathSeparator

 ⍝Get Code parts
 ⎕SE.SALT.Load C.Code,'*'

 ⍝Start the Conga
 :If 0=⎕NC'iConga'
     iConga←Conga.Init''
 :Else
    ⍝iConga.
 :EndIf

 :If YesNo'Start Web Server [Y/N]? '
     iSrv←Conga.Srv 8088 HBServer
     iSrv.Start
 :EndIf



 ⍝#.WebServer.Run&webargs
