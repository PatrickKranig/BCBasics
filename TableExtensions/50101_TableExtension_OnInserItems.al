// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

//pageextension ***** NAME extens "" erweitert eine page...
tableextension 50101 ItemTableExt extends Item //wenn man was triggern will aufgrund eines datensatzes, dann mussm an die tabelle erweitern und den trigger triggern - darauf achten das der name net zu lang ist!
{ ///diese extension triggert einfach nur beim  inserten eine code Unit!
    //einer der verschiedenen trigger
    trigger OnInsert();
    var
        mycodeunit: Codeunit TestCodeUnit_Basics; //deklariert eine lokale variable vom Typ Codeunit
    begin
        Message('on insert trigger wurde getriggert, ich triggere jetzt die codeUnit!'); //wirft eine message zum test
        mycodeunit.Run(); //ruft den RUN Trigger der Codeunit auf
        mycodeunit.MyMethode(); //ruft die methode der codeunit aus
    end;
}

//OnInsertRecord ist nicht, wenn der Datensatz eingefügt wird, sondern wenn der Benutzer darum bittet, einen neuen Datensatz zu erstellen.. Der unterstehende Parameter ist für Sie, die Zeilen-Nummern berechnen Die Rückkehr ist, wenn der Rekord gut gelaufen ist und die UI weitergehen kann,
// => // (Boolean) Dieser Rückgabewert gibt an, ob der neue Datensatz nach dem letzten Datensatz in der Tabelle (xRec) eingefügt werden soll oder nicht. Wenn false, wird der Datensatz zwischen einem vorhandenen Datensatz und dem letzten Datensatz eingefügt. Wenn true, wird der Datensatz unter dem letzten Datensatz in der Tabelle (xRec) eingefügt.
// https://docs.microsoft.com/en-us/dynamics-nav/oninsertrecord-trigger?fbclid=IwAR3A8qqSYD3cu-D5R76OTJ6SsamcEi06Z4gEG9r08zwh_wYHk43SMSRUP24