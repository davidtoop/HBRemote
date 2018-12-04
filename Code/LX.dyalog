 LX
 ⎕CY'conga'
 ⎕CY'fv2'
 ⍝Get utility functions
 fv.get'E' 'F'

 ⍝Fix problem with CertPath
 ⍝Samples.CertPath←'/Applications/Dyalog-17.0.app/Contents/Resources/Dyalog/TestCertificates/'


⍝ Initalise constants Namespace
 ⎕EX'C'
 'C'⎕NS''
 C.Root←⎕IO⊃⎕NPARTS ⎕WSID
 C.Root,←'html'

 ⍝Start the web server
 XX←''
 ⍝#.WebServer.Run&webargs
