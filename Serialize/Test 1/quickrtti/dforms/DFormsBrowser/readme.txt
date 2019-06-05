Here's the idea, 
I want to create delphi forms that work over the Net. I have to create an event sink to "trap" all the events from the controls, in order to send the events over the wire and process responses coming back.

Where do events get processed? hmm.. two ideas:
1) a plugin that can be downloaded to the client to process events .. it would come over the wire as a dll along with the form XML. but at that rate you might as well send an actual app.
2) events processed back on the server. Traffic bites. latency..

So the idea owuld be that you could connect to a server using the form browser, which would then allow you to interact with the application. You could call it a "Terminal" for the application. Your server then becomes an application server.

Network traffic is going to stink in the Deforms current state. I think that responses will have to not marshall back the whole form. right now I would end up shuffling the whole form back and forth.

1. connect.
2. authenticate.
3. send DForm.
4. send any plugins.
5. client clicks or otherwise performs events
6. small messages go back to the server. along the lines of:
      <Event Type="TNotifyEvent" Sender="BtnGetList">
7. server sends instructions and object definitions. (like refresh a TList, etc) depending on changes. along the lines of:
    <RESPONSE>
     <OBJECTS>
       <LISTBOX>
        <ITEM LINENUMBER="">....some test for the list </ITEMS>
       </LISTBOX>
     </OBJECTS>       
    </RESPONSE>


I'll have to play a little with the idea. I want to be able to create the whole deal from the Delphi IDE. 