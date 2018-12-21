 LX;v;up
 ⎕IO←0
 'Conga'⎕CY'conga'

 v←⎕IO⊃'.'⎕WG'APLVersion'
 :Select v
 :Case 'Mac-64'
     up←'/Users/david/Dropbox/apl/utils'
 :Else
     up←'c:\Users\david\Dropbox\apl\utils'
 :EndSelect

 ⎕SE.SALT.Load up,'/E'

 ⍝Fix problem with CertPath
 ⍝Samples.CertPath←'/Applications/Dyalog-17.0.app/Contents/Resources/Dyalog/TestCertificates/'


⍝ Initalise constants Namespace
 ⎕EX'C'
 'C'⎕NS''
 C.Root←⎕IO⊃⎕NPARTS ⎕WSID
 C.Root,←'html'

 ⍝Get Code parts
 ⎕SE.SALT.Load'/Users/david/Dropbox/projects/HBRemote/Code/*'

 ⍝Start the web server
 XX←''
 iConga←Conga.Init''
 ⍝#.WebServer.Run&webargs
