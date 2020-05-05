codeunit 50102 Customer_Insert //snippet tc
{

    /*
    In diesem Beispiel wird ein Datensatz mithilfe der FUNKTION INSERT eingefügt. INIT verweist es auf Standardwerte auf die Tabelle. Einige Felder werden hier hinzugefügt, und die Variablensyntax zeigt an, dass die Werte aus dem Datensatz entnommen werden, wobei der Kunde der Tabellenname ist.
    */
    var//variable (für datensatz) deklarieren)
        CustomerRecord: Record Customer; //Datensatz (GLOBAL) deklarieren auf schema der tabelle Customer

    trigger OnRun()
    begin
        CustomerRecord.Init();
        CustomerRecord."No." := '121211';
        CustomerRecord.Name := 'Max Mustermann';
        CustomerRecord.Contact := 'TestConntact Jessy';
        CustomerRecord.Balance := 0;
        CustomerRecord.Insert(); //fügt den datensatz tatsächlich ein - .Modify kann den Datensatz spezifisch verändern
        Message('Datensatz "121211" wurde erstellt...');
    end;

}